<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
 <base href="<%=basePath%>">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>添加用户 - H-ui.admin v3.1</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container">
	<form  method="post" class="form form-horizontal" id="form-member-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="长度在2位到16位之间" id="user_name" name="user_name">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="radio-box">
					<input name="user_sex" value="1" type="radio" id="user_sex1" checked>
					<label for="user_sex1">男</label>
				</div>
				<div class="radio-box">
					<input type="radio" value="2" id="user_sex2" name="user_sex">
					<label for="user_sex2">女</label>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" value="" placeholder="长度在6位到16位之间" id="user_password" name="user_password">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>班级：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="xx学院xx专业xx班级" id="user_class" name="user_class">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>学号/工号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="长度9位" id="user_number" name="user_number">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>年龄：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="user_age" name="user_age">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机号码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="长度为11位" id="user_phone" name="user_phone">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">邮箱：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="xxxx@xxx.xxx" name="user_email" id="user_email">
			</div>
		</div><!--
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">创建时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="" name="user_addtime" id="user_addtime">
			</div>
		</div>
		--><div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>状态：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="radio-box">
					<input  type="radio"  name="user_state" value="0" id="user_state1" checked>
					<label for="user_state1">正常</label>
				</div>
				<div class="radio-box">
					<input type="radio" value="1" id="user_state2" name="user_state">
					<label for="user_state2">禁用</label>
				</div>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;"/>
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="<%=basePath%>admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="<%=basePath%>admin/static/h-ui.admin/js/H-ui.admin.js"></script>
 <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript" src="<%=basePath%>admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-member-add").validate({
		rules:{
			user_name:{
				required:true,
				minlength:2,
				maxlength:16
			},
			user_password:{
				required:true,
				minlength:6,
				maxlength:16
			},
			user_class:{
				required:true,
			},
			user_phone:{
				required:true,
			},
			user_number:{
				required:true,
			},
			user_age:{
				required:true,
			},
			user_email:{
				required:true,
			},
			user_sex:{
				required:true,
			},
/*			user_addtime:{
				required:true,
			},*/
			user_state:{
				required:true,
			}
			
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			
		  $.post('<%=basePath%>userInfo/saveMemberInfo',
				{
			user_name:$("#user_name").val(),   //用户名
      		user_password:$("#user_password").val(), //密码
  			user_class:$("#user_class").val(), //班级
  			user_phone:$("#user_phone").val(), //手机号
  			user_number:$("#user_number").val(),  //学号
  			user_age:$("#user_age").val(),  //年龄
  			user_email:$("#user_email").val(), //邮件
  			user_sex:$("input[name='user_sex']:checked").val(),//性别
//  			user_addtime:$("#user_addtime").val(), //创建时间
    		user_state:$("input[name='user_state']:checked").val() //状态
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
		}
	});
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>