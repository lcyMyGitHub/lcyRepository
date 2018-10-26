<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>商品列表</title>

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>admin/static/h-ui.admin/skin/default/skin.css"
	id="skin" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>admin/static/h-ui.admin/css/style.css" />
<link rel="stylesheet"
	href="<%=basePath%>admin/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css"
	type="text/css">

</head>

<body class="pos-r">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 评论管理 <span class="c-gray en">&gt;</span> 意见反馈 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="40">序号</th>
						<th width="40">用户名</th>
						<th width="100">反馈内容</th>
						<th width="60">反馈时间</th>
						<th width="60">处理人</th>
						<th width="100">处理意见</th>
						<th width="60">处理状态</th>
						<th width="60">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${OpinionInfoList}" var="OpinionInfo" varStatus="ind">
						<tr class="text-c va-m">
							<td>${ind.index+1 }</td>
							<td>${OpinionInfo.user_name }</td>
							<td>${OpinionInfo.opinion_content }</td>
							<td>${OpinionInfo.opinion_time }</td>
							<td>${OpinionInfo.admin_name }</td>
							<td>${OpinionInfo.opinion_result }</td>
							<td>
								<c:if test="${OpinionInfo.opinion_state==0}">
									未处理
								</c:if>
								<c:if test="${OpinionInfo.opinion_state==1}">
									已处理
								</c:if>
							</td>
							<c:if test="${OpinionInfo.opinion_state==0}">
								<td class="f-12 td-manage"><a style="text-decoration:none;color: #5a98de;" onClick="opinion_shenhe('${OpinionInfo.opinion_id }')" href="javascript:;" title="审核">审核</a></td>
							</c:if>
							<c:if test="${OpinionInfo.opinion_state==1}">
								<td class="f-12 td-manage"><a style="text-decoration:none;color: #5a98de;" onClick="opinion_shenhe('${OpinionInfo.opinion_id }')" href="javascript:;" title="审核">查看</a></td>
							</c:if>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript"
		src="<%=basePath%>admin/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>admin/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>admin/static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>admin/static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="<%=basePath%>admin/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 		

	<script type="text/javascript">
$('.table-sort').dataTable({
	"aLengthMenu": [10, 25, 50, -1],
	"order": [[ 0, "asc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"pading":false,
	"autoWidth": false,
	 "columns": [
	 	{ "width": "5%" },
		{ "width": "5%" },
	    { "width": "20%" },
	    { "width": "10%" },
	    { "width": "5%" },
	    { "width": "15%" },
	    { "width": "5%" },
	    { "width": "10%" }
	  ],
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  //{"orderable":false,"aTargets":[0,8]}// 不参与排序的列
	]
});		
/*资讯-编辑*/
function opinion_shenhe(id){
/* 	var index = layer.open({
		type: 2,
		title: '审核',
		content: 'opinion/shenheOpinion?opinion_id='+id
	}); */
	//layer.full(index);
	layer_show('审核','<%=basePath%>opinion/shenheOpinion?opinion_id='+id, 800, 600);
}
	</script>
</body>
</html>
