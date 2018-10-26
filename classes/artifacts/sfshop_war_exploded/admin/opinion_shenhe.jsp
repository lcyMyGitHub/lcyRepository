<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="<%=basePath%>admin/lib/html5shiv.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="<%=basePath%>admin/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>审核意见反馈 - 评论管理 - H-ui.admin v3.1</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-opionion-shenhe">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">用户名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${opinionInfo.user_name }" readonly>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">反馈内容：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="" cols="" rows="" class="textarea" readonly>${opinionInfo.opinion_content }</textarea>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">反馈时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${opinionInfo.opinion_time }" readonly>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">处理人：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${opinionInfo.admin_name }" readonly>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>处理意见：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea id="opinion_result" cols="" rows="" <c:if test="${opinionInfo.opinion_state==1}">readonly</c:if> class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="$.Huitextarealength(this,200)">${opinionInfo.opinion_result }</textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button class="btn btn-secondary radius" type="submit" 	<c:if test="${opinionInfo.opinion_state==1}">style="display: none;"</c:if> ><i class="Hui-iconfont">&#xe632;</i> 保存</button>
				
				<!-- <button onClick="removeIframe();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button> -->
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="<%=basePath%>admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="<%=basePath%>admin/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="<%=basePath%>admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="<%=basePath%>admin/lib/ueditor/1.4.3/ueditor.config.js"></script> 
<script type="text/javascript" src="<%=basePath%>admin/lib/ueditor/1.4.3/ueditor.all.min.js"> </script> 
<script type="text/javascript" src="<%=basePath%>admin/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	//表单验证
	$("#form-opionion-shenhe").validate({
		rules:{
			articletitle:{
				required:true
			}	
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$.post("<%=basePath%>opinion/saveOpinion",
				{
					opinion_result:$("#opinion_result").val(),
					opinion_id:'${opinionInfo.opinion_id }'
				},
				function(data){
				
					if(data.code==0)
					{
						layer.msg(data.msg, {icon:1,time:1500});
						setTimeout("parent.location.reload();",1500);;
					}else
					{
						layer.msg(data.msg, {icon:2,time:1500});
						
					}
					parent.parent.layer.close(lay);
					
				}
				,'json');
			
			//var index = parent.layer.getFrameIndex(window.name);
			////parent.$('.btn-refresh').click();
			//parent.layer.close(index);
		}
	});
	

});
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
