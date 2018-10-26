<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>选题列表</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/css/style.css" />
<link rel="stylesheet" href="<%=basePath%>admin/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>

<body class="pos-r">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统统计 <span class="c-gray en">&gt;</span> 选题 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="40">序号</th>
						<th width="60">课题名称</th>
						<th width="60">出题老师</th>
						<th width="40">用户班级</th>
						<th width="100">学号</th>
						<th width="60">姓名</th>
						<th width="100">限制名额</th>
						<th width="60">已选人数</th>
						<th width="60">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${SelectInfoList}" var="SelectInfo" varStatus="ind">
						<tr class="text-c va-m">
							<td>${ind.index+1 }</td>
							<td>${SelectInfo.topic_title }</td>
							<td>${SelectInfo.teacher_name }</td>
							<td>${SelectInfo.user_class }</td>
							<td>${SelectInfo.user_number }</td>
							<td>${SelectInfo.user_name }</td>
							<td>${SelectInfo.topic_total }</td>
							<td>${SelectInfo.topic_count }</td>
							<td class="f-12 td-manage">
								<c:if test="${SelectInfo.topic_user_del==0}">
									<span class="label label-success radius" style="cursor:pointer"  onclick="updateSelectInfo(${SelectInfo.topic_user_id},'topic_user_del',1)">启用</span>
								</c:if>
								<c:if test="${SelectInfo.topic_user_del==1}">
									<span class="label  radius" style="cursor:pointer"  onclick="updateSelectInfo(${SelectInfo.topic_user_id},'topic_user_del',0)">已删除</span>
								</c:if>
								<%--<a style="text-decoration:none;color: #5a98de;" onClick="second_del('${SelectInfo.topic_user_id }')" href="javascript:;">删除</a>--%>
							</td>
							<td>${SelectInfo.teacher_id }</td>
							<td>${SelectInfo.teacher_number }</td>
							<td>${SelectInfo.topic_id }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="<%=basePath%>admin/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>admin/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="<%=basePath%>admin/static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>admin/static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript" src="<%=basePath%>admin/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
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
         { "width": "20%" },
         { "width": "10%" },
         { "width": "10%" },
		{ "width": "20%" },
	    { "width": "10%" },
	    { "width": "5%" },
	    { "width": "5%" }
	  ],
	"aoColumnDefs": [
	  {"bVisible": false, "aTargets": [  9,10,11]} //控制列的隐藏显示
	  //{"orderable":false,"aTargets":[0,8]}// 不参与排序的列
	]
});

/*修改字段*/
function updateSelectInfo(topic_user_id,str,topic_user_del)
{
    var stemp='';
    if(topic_user_del==1){
        stemp='确认要禁用吗？';
    }else if(topic_user_del==0){
        stemp='确认要启用吗？';
    }else{
        stemp='传入参数有误';
    }
    layer.confirm(stemp,function(index){
        $.ajax({
            type: 'POST',
            url: '<%=basePath%>select/updateSelectInfo',
            data:{topic_user_id:topic_user_id,str:str,topic_user_del:topic_user_del},
            dataType: 'json',
            success: function(data){
                layer.msg(data.msg,{icon:1,time:1000});
                if(data.code==0)
                {
                    location.reload();
                }
            },
            error:function(data) {
                console.log(data.msg);
            }
        });
    });
}

/**/
function second_del(id) {
    $.ajax({
        type: 'POST',
        url: '<%=basePath%>select/delSelectInfo',
        data: {topic_user_id: id},
        dataType: 'json',
        success: function (data) {
            if (data.code == 0) {
                layer.msg(data.msg, {icon: 1, time: 1000});

            } else {
                layer.msg(data.msg, {icon: 2, time: 1000});
            }
            setTimeout("location.reload();", 1000);
        }
    });
}


	</script>
</body>
</html>
