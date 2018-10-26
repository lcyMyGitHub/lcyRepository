<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加轮播图 - 轮播图管理</title>
    
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/css/style.css" />
  </head>
  
  <body>
	<article class="page-container">
		<form  class="form form-horizontal"  method="post" enctype="multipart/form-data" id="form-user-add">
			<input type="hidden" value="" id="type_id" />
			<input type="hidden" value="0" id="type_pid"/>
			<input type="hidden" value="${lunbotu.img_url}" id="type_icon"/> 
			<div class="row cl">
				<img alt="" id="iocn-img" src="${lunbotu.img_url}">
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">
					<span class="c-red">*</span>
					图标：</label>
				<div class="formControls col-xs-5 col-sm-7">
					<span class="btn-upload form-group">
						<input class="input-text upload-url radius"  type="file" id="uploadFile" name="imgFile" readonly />
						<input class="btn btn-primary radius" type="submit" onclick="submitexcelFile()" value="点击上传"  />
					</span>
				</div>				
			</div>	
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">
					<span class="c-red">*</span>
					排序：</label>
				<div class="formControls col-xs-6 col-sm-6">
					<input id="sort" value="${lunbotu.img_sort }">		
				</div>
			</div>
		
			<div class="row cl">
				<div class="col-9 col-offset-2">
					<input class="btn btn-primary radius" type="button" id="subType"  value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				</div>
			</div>
		</form>
	</article>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="<%=basePath%>admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="<%=basePath%>admin/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
$(function(){
	
	//提交
	$("#subType").click(function(){
		$.ajax({
			type: 'POST',
			url: '<%=basePath%>lunbotu/saveEditLunbotu',
			data:{
				type:'${type}',
				img_id:'${lunbotu.img_id}',
				img_url:$("#type_icon").val(),
				img_sort:$("#sort").val()
			},
			dataType: 'json',
			success: function(data){
					if(data.code==0)
					{
						
						layer.msg(data.msg, {icon:1,time:1500});
					
						setTimeout("parent.location.reload();",1500);;
						
					}
					else
					{
						layer.msg(data.msg, {icon:2,time:1500});
					}
					parent.parent.layer.close(lay);
			}
		});
	});	
		

});

function submitexcelFile()
{
	if($("#uploadFile").val()=='')
	{
		layer.msg("请选择需要上传的图片", {icon:2,time:1500});
		return ;
	}

	$("#form-user-add").ajaxForm({
	url: '<%=basePath%>upd/upload',
	dataType: "json",
	cache: false, //或者设置true
	success: function(ret) {
		
		if(ret.error==0)
		{
			
			layer.msg("上传成功", {icon:1,time:1500});
			$("#iocn-img").attr("src","<%=basePath%>"+ret.url);
			$("#type_icon").val(ret.url);
			
			
		}
		else
		{
			layer.msg(ret.message, {icon:2,time:1500});
		}
	}	
	, error: function(ret) {

		layer.msg(ret.message, {icon:2,time:1500});
	}
	});
}


</script> 
  </body>
</html>
