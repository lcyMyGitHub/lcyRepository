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
    
    <title>轮播图设置</title>
    
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/css/style.css" />

  </head>
  
  <body>
  <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统管理 <span class="c-gray en">&gt;</span> 轮播图设置 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5"> 
		<span class="l"> 
		
		<a class="btn btn-primary radius" href="javascript:;" onclick="lunbotu_add_edit('添加轮播图','<%=basePath%>lunbotu/addLunbotuPage?type=0','800')">
		<i class="Hui-iconfont">&#xe600;</i> 添加轮播图
		</a> 
		</span>  
	</div>
	<table class="table table-border table-bordered table-hover table-bg">
		<thead>
			
			<tr class="text-c">
				<th width="40">ID</th>	
				<th width="40">排序</th>
				<th>图片</th>
				<th width="80">创建日期</th>
				<th width="70">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${LunbotuList }" var="lunbotu">
			
				<tr class="text-c">
					<td>${lunbotu.img_id }</td>
					<td>${lunbotu.img_sort }</td>
					<td><img alt="" src="<%=basePath%>${lunbotu.img_url}" width="80"></td>
					<td>${role.img_addtime }</td>
					<td class="f-14">
						<a title="编辑" href="javascript:;" onclick="lunbotu_add_edit('轮播图编辑','<%=basePath%>lunbotu/addLunbotuPage?lunbotu_id=${lunbotu.img_id}&type=1','800',500)" style="text-decoration:none">
							<i class="Hui-iconfont">&#xe6df;</i>
						</a> 
						<a title="删除" href="javascript:;" onclick="lunbotu_del(this,${lunbotu.img_id })"   class="ml-5" style="text-decoration:none">
							<i class="Hui-iconfont">&#xe6e2;</i>
						</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="<%=basePath%>admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="<%=basePath%>admin/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">
/*管理员-角色-添加编辑*/
function lunbotu_add_edit(title,url,w,h){
	layer_show(title,url,w,h);
}

/*管理员-角色-删除*/
function lunbotu_del(obj,id){
	layer.confirm("确认要删除吗？",function(index){
	
		$.ajax({
			type: 'POST',
			url: '<%=basePath%>lunbotu/deleteLunbotu',
			data:{lunbotu_id:id},
			dataType: 'json',
			success: function(data){
			if(data.code==0)
			{
				$(obj).parents("tr").remove();
				layer.msg(data.msg,{icon:1,time:1000});
			}else
			{
				layer.msg(data.msg,{icon:2,time:1000});
			}
				
			}
		});
		
		
				
	});
}
</script>
</body>
  </body>
</html>
