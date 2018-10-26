<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>user/css/bottom.css">
  </head>
  <%  String newsId=request.getParameter("newsId");%>
  <body>
  <input type="hidden" id="newsId" value="<%=newsId %>" />
   	<nav class="nav">
   		<ul>
   			<li>
                 <a class="onclicks" wzy="sy" href="<%=basePath%>" ><span><img src="<%=basePath%>user/img/sy1.png" height="23" ></span><span class="fontSelected">首页</span></a>
            </li>
   			<li>
   			 	<a class="onclicks" wzy="qx"  href="<%=basePath%>indexNewTopics"><span><img src="<%=basePath%>user/img/qx1.png" height="23"></span><span class="fontSelected">课题</span></a>
            </li>
            <li>
                 <a class="onclicks" wzy="wd"  href="<%=basePath%>user/personal.jsp"><span><img src="<%=basePath%>user/img/wd1.png" height="23"></span><span class="fontSelected">我的</span></a>
            </li>
   		</ul>
   	</nav>
  </body>
</html>
<script src="<%=basePath%>user/js/jquery-1.9.0.min.js"></script>
<script>
$(function(){
	
	$(".onclicks").each(function(){
	
		if($(this).attr("wzy")==$("#newsId").val())
		{
			var src = '<%=basePath%>user/img/'+$(this).attr("wzy")+'.png';
			$(this).children("span").children("img").attr("src",src);
		}
	
		 	
		 	
	});


 	$(".onclicks").click(function(){
 	
		if($(this).attr("wzy")!=$("#newsId").val())
		{
			window.location.href=$(this).attr("href"); 
		}
		
	}); 

});

</script>


