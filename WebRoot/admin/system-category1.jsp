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
    
    <title>栏目管理</title>
    
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/css/style.css" />
  </head>
  
  <body>
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span>
	管理员管理
	<span class="c-gray en">&gt;</span>
	栏目管理
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">

	<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
				<tr class="text-c">
					<th width="100">父菜单</th>
					<th width="60">排序</th>
					<th width="100">栏目名称</th>
					<th>路径</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ResourceInfoList }" var="ResourceInfo">
					
					
					<tr class="text-c">
						<td><i class="Hui-iconfont">${ResourceInfo.presource_iocnclass };</i>${ResourceInfo.presource_name }</td>
						<td>${ResourceInfo.resource_sorts }</td>
						<td >${ResourceInfo.resource_name }</td>
						<td >${ResourceInfo.resource_url }</td>
						
					</tr>
				</c:forEach>
				
				
			</tbody>
		</table>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<%-- <script type="text/javascript" src="<%=basePath%>admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->
 --%>
<!--请在下方写此页面业务相关的脚本-->
<%-- <script type="text/javascript" src="<%=basePath%>admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/laypage/1.2/laypage.js"></script> --%>
<script type="text/javascript">
/* $('.table-sort').dataTable({
	
}); */


</script>
  </body>
</html>
