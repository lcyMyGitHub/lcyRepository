<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>意见反馈</title>
    <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
		<link rel="stylesheet" href="<%=basePath%>user/css/style.css">
		<link rel="stylesheet" href="<%=basePath%>user/bootstrap-3.3.7-dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=basePath%>user/css/opinion.css">
  </head>
 <body>
		<nav class="navbar navbar-default navbar-fixed-top" style="background-color: #fff;">
		 <div class="container-fluid" style="padding-right: 0px;">
		    <div class="navbar-header" style="text-align: center;width: 100%;">
		      <a class="navbar-brand" href="javascript:history.back(-1);" >
		        <span class="glyphicon glyphicon-chevron-left"  ></span>
		      </a>
		      
		     <span class="navbar-brand " style="padding-left: 0px;">
		      意见反馈
		      </span>
		      
		    </div>
		  </div>
	 	</nav>
		<div class="col-xs-12 div_textarea" >
			<textarea placeholder="输入您要告诉我们的内容...." maxlength="200"  id="opinion_content"  name="opinion_content"></textarea>
		</div>
		<div class="col-xs-12 btn1" onclick="submitopinion()">
			保存提交
		</div>
	</body>
	<script type="text/javascript" src="<%=basePath%>user/js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>user/js/swiper.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>user/layer_mobile/layer.js"></script>
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
		}
		
	function submitopinion(){
			// 验证cookie中是否有用户信息
			var user_id = getCookie("user_id");
			var opinion_content=$("#opinion_content").val();
			if (user_id != null && user_id != "") {
				//提交表单,获取反馈内容和cookie中的user_number
				location.href = "<%=basePath%>userOpinion/saveOpinion?opinion_content="+opinion_content;
			}
			else {
				// 将当前路径存入cookie
				setCookie("url", window.location.href, 1);
				window.location.href="<%=basePath%>user/login.jsp";
			}	
		}
		 </script>
</html>
