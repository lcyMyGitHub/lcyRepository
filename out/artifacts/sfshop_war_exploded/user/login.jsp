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
		<title>登录</title>
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
	</head>
	<style>
		*{padding: 0px;margin: 0px;}
		body{
			width: 100%;
			height: 100%;
			background: url(img/login_bg.jpg) no-repeat ;
			background-size: cover;
		}
		.logo{
			width: 100px;
			height:100px;
			margin:10% auto;
			background: url(img/logo.png)  no-repeat;
			border-radius: 20%;
			background-size: cover;
		}
		.login{
			padding: 0px;
			margin-top: 15%;
		}
		.login input{
			border-radius: 20px;
			border: 1px #498FFF solid;
			opacity: .5;
			color: #0d0d0d;
			width: 100%;
			padding: 5px 0px;
			box-sizing: border-box;
			line-height: 38px;
			padding-left: 38px;
			margin-top: 5%;
		}
		
		.username input{
			/*background: url(img/username.png) no-repeat 5px;*/
		}
		.pwd input{
		/*	background: url(img/password.png) no-repeat 5px;*/
		}
		.login_but{
			margin-top: 5%;
		}
		.login_but button{
			width: 100%;
			color: #fff;
			letter-spacing:15px;
			font-weight: 600;
			font-size: 1.3em;
			padding: 10px;
			background-color: #2bade9;
			border-radius: 20px;
			border: 0px;
		}
	.tishi{
		position: fixed;
		font-size: 18px;
		bottom: 10px;
		color: #498FFF;
	}
	
	</style>
	<body >

		<nav class="navbar  navbar-fixed-top" style="opacity:0.8">
			<div class="container-fluid" style="padding-right: 0px;">
				<div class="navbar-header" style="text-align: center;width: 100%;">
					<a class="navbar-brand"  href="javascript:history.back(-1);" >
						<span class="glyphicon glyphicon-chevron-left" ></span>
					</a>
				</div>
			</div>
		</nav>
		<div class="logo"></div>
		<div class="login">
			<div class="col-xs-12 text-center username ">
				<input type="text" style="" placeholder="用户名/学号" maxlength="18" id="studentId" />
			</div>
			<div class="col-xs-12 text-center pwd">
				<input type="password" style="" placeholder="密码" maxlength="12" id="pass" />
			</div>
			<div class="col-xs-12 text-center login_but">
				<button onclick="submit()">登录</button>
			</div>
		</div>
		<div class="col-xs-12 text-center tishi ">
			<div class="col-xs-6 text-right zhuce" onclick="location='<%=basePath%>user/register.jsp'">
				快速注册
			</div>
			<div class="col-xs-6 text-left wangji" onclick="location='<%=basePath%>user/forgot_pass.jsp'">
				忘记密码
			</div>
		</div>
	</body>
	<script type="text/javascript" src="<%=basePath%>admin/lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="<%=basePath%>admin/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript">
		// 获取cookie
		function getCookie(c_name) {
			if (document.cookie.length>0) {
		  		c_start=document.cookie.indexOf(c_name + "=");
		  		if (c_start!=-1) { 
		    		c_start=c_start + c_name.length+1;
		    		c_end=document.cookie.indexOf(";",c_start);
		    		if (c_end==-1) c_end=document.cookie.length;
		    			return unescape(document.cookie.substring(c_start,c_end));
		    	} 
		  	}
			return "";
		};
		
		// 设置cookie
		function setCookie(c_name,value,expiredays) {
			var exdate=new Date();
			exdate.setDate(exdate.getDate()+expiredays);
			document.cookie=c_name+ "=" +escape(value)+((expiredays==null) ? "" : ";expires="+exdate.toGMTString());
		};
	
		// 登录按钮点击
		function submit() {
			var studentId = document.getElementById('studentId').value;
			var pass = document.getElementById('pass').value;
			if (studentId == "" || studentId == null) {
				layer.msg('用户名/学号不能为空！');
				return;
			}
			else if (pass == "" || pass == null) {
				layer.msg('密码不能为空！');
				return;
			}
			$.ajax({
				type: 'POST',
				url: '<%=basePath%>userInfo/loginUser',
				dataType: 'json',
				async: false,
				data: {studentId: studentId, pass: pass},
				success: function(data) {
					if (data.msg == "登录成功！") {
						var url = getCookie("url");
						if (url == "")
							location.href="<%=basePath%>";
						else
							location.href = url;
					}
					else {
						layer.msg(data.msg);
						//window.location.href="<%=basePath%>user/login.jsp";
					}
				}
			});
		};
	</script>
</html>
