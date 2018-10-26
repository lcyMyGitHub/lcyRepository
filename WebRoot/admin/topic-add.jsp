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
    
    <title>添加课题</title>
    
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/css/style.css" />
	<link href="<%=basePath%>admin/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
  </head>
  <style>
  .cl::after, .clearfix::after {
    height: 20px;
	}
  .form-label{text-align: right;}
  </style>
  <body>
<div class="page-container">
	<input type="hidden" id="imgs_url"/>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课题名称：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text"  placeholder="请输入课题名称" id="topic_title" maxlength="100">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>分类栏目：</label>
		<div class="formControls col-xs-4 col-sm-4">
			<span class="select-box">
			<select name="" class="select" id="type_id" lcy="s1">
				<option value="0">全部栏目</option>
			</select>
			</span>
		</div>
		<div class="formControls col-xs-4 col-sm-4">
			<span class="select-box">
			<select name="" class="select" id="type_id1" lcy="s2">
				<option value="0">全部栏目</option>
			</select>
			<input type="hidden" id="topic_type_id" value="0" />
			</span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>限制人数：</label>
		<div class="formControls col-xs-4 col-sm-4 ">
			<input type="text" id="topic_total"  placeholder="只能输入数值类型"  class="input-text"/>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2">是否发布：</label>
		<div class="formControls col-xs-8 col-sm-9 skin-minimal">
			<div class="radio-box">
				<input name="topic_state"  value="1" type="radio" checked>
				<label>是</label>
			</div>
			<div class="radio-box">
				<input type="radio" value="0" name="topic_state">
				<label>否</label>
			</div>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2">允许评论：</label>
		<div class="formControls col-xs-8 col-sm-9 skin-minimal">
			<div class="check-box">
				<input type="checkbox" id="topic_comment_state" value="1">
				<label for="topic_comment_state">是</label>
			</div>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2">缩略图：</label>
		<div class="formControls col-xs-8 col-sm-9">
		<input type="hidden" value="" id="icon_img"/>
			<form  method="post" enctype="multipart/form-data" id="form-user-add">
				<span class="btn-upload form-group">
					<input class="input-text upload-url radius"  type="file" id="uploadFile" name="imgFile" readonly />
					<input class="btn btn-primary radius" type="submit" onclick="submitexcelFile()" value="点击上传"  />
				</span>
			</form>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2">课题说明：</label>
		<div  class="formControls col-xs-8 col-sm-9">
			<script id="editor" type="text/plain;" ></script>
		</div>
	</div>
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
			<button id="topic_save_submit"  class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 保存提交</button>
			<button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
		</div>
	</div>
</div>


<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="<%=basePath%>admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="<%=basePath%>admin/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript" src="<%=basePath%>admin/lib/webuploader/0.1.5/webuploader.min.js"></script> 


<script type="text/javascript" src="<%=basePath%>admin/lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="<%=basePath%>admin/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>

<script type="text/javascript">
function article_save(){
	alert("刷新父级的时候会自动关闭弹层。")
	window.parent.location.reload();
}
function submitexcelFile() {
	if($("#uploadFile").val()=='') {
		layer.msg("请选择需要上传的图片", {icon:2,time:1000,shade: [0.8, '#393D49']});
		return ;
	}
	$("#form-user-add").ajaxForm({
		url: '<%=basePath%>upd/upload',
		dataType: "json",
		cache: false, //或者设置true
		success: function(ret) {
			if(ret.error==0)
			{
				layer.msg("上传成功", {icon:1,time:1500,shade: [0.8, '#393D49']});
				$("#icon_img").val(ret.url);
			}
			else
			{
				layer.msg(ret.message, {icon:2,time:1500,shade: [0.8, '#393D49']});
			}
		}	
		, error: function(ret) {
			layer.msg(ret.message, {icon:2,time:1500,shade: [0.8, '#393D49']});
		}
	});
}
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	state = "pending";
});
function deletetr(inde) {
	$("#tr"+inde).remove();
}
(function($){
    // 当domReady的时候开始初始化
    $(function() {
        var datastr;
        $.ajax({
            type: 'POST',
            url: '<%=basePath%>tt/getTopicsTypeInfoList',
            dataType: 'json',
            async: false,
            success: function (data) {
                var trs;
                datastr = data;
                $.each(data, function (n, value) {
                    if (value.pId == 0)
                        trs += "<option value=" + value.id + ">" + value.name + "</option>";
                });
                $("#type_id").append(trs);
            }
        });
        $(".select").change(function () {
            var lcy = $(this).attr("lcy");
            var type_id = $(this).val();
            if (lcy == "s1") {
                $("#type_id1").empty();
                var str = "<option value=0>全部栏目</option>";
                $.each(datastr, function (n, value) {
                    if (value.pId == type_id)
                        str += "<option value=" + value.id + ">" + value.name + "</option>";
                });
                $("#type_id1").append(str);
            } else {
                $("#topic_type_id").val(type_id);
            }
        });
        //添加商品
        $("#topic_save_submit").click(function () {
            var topic_title = $("#topic_title").val();//标题
            var topic_type_id = $("#topic_type_id").val();//类型ID
            var topic_state = $("input[name='topic_state']:checked").val();//商品状态(0未上架1在售)
            var topic_comment_state = $('input[type=checkbox]:checked').length;//是否允许评论
            var icon_img = $("#icon_img").val();//缩略图
            var topic_introduce = UE.getEditor('editor').getContent();//要求
            var topic_total = $("#topic_total").val();//规定人数
            layer.msg("ssss", {icon: 1, time: 1500, shade: [0.8, '#393D49']});
            //alert(parent.window.index);
            $.ajax({
                type: 'POST',
                url: '<%=basePath%>topics/saveTopicInfo',
                dataType: 'json',
                data: {
                    topic_title:topic_title,
                    topic_type_id:topic_type_id,
                    topic_comment_state:topic_comment_state,
                    icon_img:icon_img,
                    topic_introduce:topic_introduce,
                    topic_total:topic_total,
                    topic_state: topic_state
                },
                success: function (data) {
                    layer.msg(data.msg, {icon: 1, time: 1500, shade: [0.8, '#393D49']});
                    setTimeout("parent.location.reload();", 1500);
                    parent.parent.layer.close(lay);
                }
            });
        });
    });
})( jQuery );

$(function(){
	 var ue = UE.getEditor('editor'); 
});
</script>
  </body>
</html>
