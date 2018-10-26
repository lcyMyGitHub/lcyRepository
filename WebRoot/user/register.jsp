<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
		<title>注册</title>
		<link rel="stylesheet" href="user/css/style.css">
		<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/register.css">
	</head>
	<body>
		<nav class="navbar navbar-default navbar-fixed-top" style="background-color: #fff;">
		 <div class="container-fluid" style="padding-right: 0px;">
		    <div class="navbar-header" style="text-align: center;width: 100%;">
		      <a class="navbar-brand" href="javascript:history.back(-1);" >
		        <span class="glyphicon glyphicon-chevron-left"  ></span>
		      </a>
		     <span class="navbar-brand " style="padding-left: 0px;">
		      	快速注册
		      </span>
		    </div>
		  </div>
	 	</nav>
	 	<div class="col-xs-12 text-center username" >
	 		<input type="text" placeholder="学工号/教职工号" id="studentId" />
	 	</div>
	 	<div class="col-xs-12 text-center phone" >
	 		<input type="tel" placeholder="手机号" id="phone" />
	 	</div>
	 	<div class="col-xs-8 text-center phone_val" >
	 		<input type="text" placeholder="输入验证码" id="phone_val" />
	 	</div>
	 	<div class="col-xs-4 text-right phone_val" >
	 		<input style="background-color: #1296DB;color: white;" type="button" value="获取验证码" onclick="verificationCode(this)" />
	 	</div>
	 	<div class="col-xs-12 text-center password" >
	 		<input type="password" placeholder="密码" id="pass_old" />
	 	</div>
	 	<div class="col-xs-12 text-center password" >
	 		<input type="password" placeholder="重复密码" id="pass_new" />
	 	</div>
	 	<div class="col-xs-12 text-right register_btn" >
	 		<button onclick="register()">立即注册</button>
	 	</div>
	 	<div class="col-xs-12 text-left xieyi" >
	 		<input type="checkbox" checked="checked" id="checkboxId" /><a href="#">《校乐购相关注册协议》</a>
	 	</div>
	</body>
	<script type="text/javascript" src="<%=basePath%>admin/lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="<%=basePath%>admin/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript">
		var clock = '';
		var count = 60; //间隔函数，1秒执行
		var btn;
	
		// 验证手机号函数
		verifyCellPhoneNumber = function (value) {
			var pattern = /^1[34578]\d{9}$/;
			if (pattern.test(value)) {
				return true;
			}
			return false;
		};
		
		// time时间处理函数
		function doLoop() {
			 count--;
			 if(count > 0) 
			 	btn.value = count +"秒后获取";
			 else{
				  clearInterval(clock); //清除js定时器
				  btn.disabled = false;
				  btn.value = "获取验证码";
				  count = 10; //重置时间
			}
		 }
	
		// 点击注册按钮
		function register() {
			var studentId = document.getElementById('studentId').value;
			var phone_val = document.getElementById('phone_val').value;
			var phone = document.getElementById('phone').value;
			var pass_old = document.getElementById('pass_old').value;
			var pass_new = document.getElementById('pass_new').value;
			if (!document.getElementById("checkboxId").checked) {
				layer.msg('必须选择<校乐购相关注册协议>');
				return;
			}
			else if (studentId == "" || studentId == null) {
				layer.msg('学工号/教职工号不能为空！');
				return;
			}
			else if (studentId.length < 9) {
				layer.msg('学工号/教职工号长度不能少于九位！');
				return;
			}
			else if (!(/(^[1-9]\d*$)/.test(studentId))) {
				layer.msg('学工号/教职工号只能为纯数字！');
				return;
			}
			else if (phone == "" || phone == null) {
				layer.msg('手机号不能为空！');
				return;
			}
			else if (verifyCellPhoneNumber(phone) == false) {
				layer.msg('手机号码格式不正确！');
				return;
			}
			else if (phone_val == "" || phone_val == null) {
				layer.msg('验证码不能为空！');
				return;
			}
			else if (!(/(^[1-9]\d*$)/.test(phone_val))) {
				layer.msg('验证码格式不正确！');
				return;
			}
			if (pass_old == "" || pass_old == null) {
				layer.msg('密码不能为空！');
				return;
			}
			else if (pass_old.length < 6) {
				layer.msg('密码长度不能少于六位！');
				return;
			}
			else if (pass_new == "" || pass_new == null) {
				layer.msg('重复密码不能为空！');
				return;
			}
			else if  (pass_new.length < 6) {
				layer.msg('重复密码长度不能少于六位！');
				return;
			}
			else if (pass_old != pass_new) {
				layer.msg('两次密码不一致！');
				return;
			}
			$.ajax({ // 验证收到的验证码
				type: 'POST',
				url: '<%=basePath%>SMSAuthenticationCode/getAuthenticationCode',
				dataType: 'json',
				async: false,
				data: {phone: phone, phone_val: phone_val},
				success: function(data_code) {
					if (data_code.msg != "2") {
						if (data_code.msg == "1") {
							$.ajax({ // 验证学号和手机号是否重复
								type: 'POST',
								url: '<%=basePath%>userInfo/studentIDOrPhoneByUser',
								dataType: 'json',
								async: false,
								data: {studentId: studentId, phone: phone},
								success: function(data_user) {
									if (data_user.msg == "1") {
										$.ajax({ // 添加注册信息
											type: 'POST',
											url: '<%=basePath%>userInfo/insertUserLoginInfo',
											dataType: 'json',
											async: false,
											data: {studentId: studentId, pass_new: pass_new, phone: phone},
											success: function(data_info) {
												if  (data_info.msg == "1")
													window.location.href="<%=basePath%>user/login.jsp";
												else {
													layer.msg(data_info.msg);
													//window.location.href="<%=basePath%>user/register.jsp";
												}
											}
										});
									}
									else
										layer.msg(data_user.msg);
								}
							});
						}
						else
							layer.msg(data_code.msg);
					}
					else
						layer.msg('验证出错！');
				}
			});
		};
		
		// 点击获取验证码按钮
		function verificationCode(thisBtn) {
			var phone = document.getElementById('phone').value;
			if (phone == "" || phone == null) {
				layer.msg('手机号不能为空！');
				return;
			}
			else if (verifyCellPhoneNumber(phone) == false) {
				layer.msg('手机号码格式不正确！');
				return;
			}
			$.ajax({
				type: 'POST',
				url: '<%=basePath%>SMSAuthenticationCode/setAuthenticationCode',
				dataType: 'json',
				async: false,
				data: {phone: phone},
				success: function(data){
					if (data.msg != "1") {
						layer.msg('发送验证码出错！');
					}
					else {
						btn = thisBtn;
						btn.disabled = true; //将按钮置为不可点击
						btn.value = count + "秒后获取";
						clock = setInterval(doLoop, 1000); //一秒执行一次
					}
				}
			});
		};
	</script>
</html>