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
    
    <title>搜索商品</title>
    
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<link rel="stylesheet" href="<%=basePath%>user/css/style.css">
	<link rel="stylesheet" href="<%=basePath%>user/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=basePath%>user/css/query_goods.css">

  </head>
  
  <body>
    <nav class="navbar navbar-default navbar-fixed-top" style="background-color: #fff;">
		 <div class="container-fluid" style="padding-right: 0px;">
		    <div class="navbar-header" style="text-align: center;width: 100%;">
		      <a class="navbar-brand" href="javascript:history.back(-1);" >
		        <span class="glyphicon glyphicon-chevron-left" ></span>
		      </a>
		      <div class="input-group input-group-sm" style="padding: 10px;height: 0px;">
                <input type="text" id="topic_title" style="background-color: #f8f3f3;font-size: 12px;" class="form-control" placeholder="搜索课题" maxlength="20">
            	<span class="input-group-btn" onclick="indexListTopics()">
						<button  class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search" ></span>
							搜索
						</button>
				</span>
		      </div>
		     
		    </div>
		  </div>
	 	</nav>
		<div class="container" id="class_goods" >
			<div class="col-xs-12" style="padding-left: 0px;">
				<span class="glyphicon glyphicon-fire " ></span>
				课题分类
			</div>
			<c:forEach items="${TopicsTypeInfoList }" var="TopicTypeInfo">
			 	<c:if test="${TopicTypeInfo.type_pid!=0 }">
			 		<div class="text-center class_goods" onclick="indexListTopic1(${TopicTypeInfo.type_id})" >
						${TopicTypeInfo.type_name }
					</div>
			 	</c:if>
			</c:forEach>
		</div>
  </body>
  <script type="text/javascript">
  	function indexListTopics() {
  		var topic_title = document.getElementById("topic_title").value;
  		window.location.href='<%=basePath%>indexListTopics?topic_title='+topic_title;
  	}
  	function indexListTopic1(type_id) {
  		window.location.href='<%=basePath%>indexListTopics?topic_type_id='+type_id;
	}
  </script>
  
</html>
