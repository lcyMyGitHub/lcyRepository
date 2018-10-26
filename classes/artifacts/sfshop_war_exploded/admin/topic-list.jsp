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

	<title>课题列表</title>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/css/style.css" />
	<link rel="stylesheet" href="<%=basePath%>admin/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>

<body class="pos-r">
<div class="pos-a" style="width:200px;left:0;top:0; bottom:0; height:100%; border-right:1px solid #e5e5e5; background-color:#f5f5f5; overflow:auto;">
	<ul id="treeDemo" class="ztree"></ul>
</div>
<div style="margin-left:200px;">
	<iframe ID="testIframe" Name="testIframe" FRAMEBORDER=0 SCROLLING=AUTO width=100%  height=660px SRC="<%=basePath%>topics/showTpopicsInfoPage_1"></iframe>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="<%=basePath%>admin/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>

<script type="text/javascript">
    function ajaxzNodes() {
        var str ;
        $.ajax({
            type: 'POST',
            url: '<%=basePath%>tt/getTopicsTypeInfoList',
            dataType: 'json',
            async:false,
            success: function(data){
                str = data;
            }
        });
        return str;
    }
    var setting = {
        view: {
            dblClickExpand: false,
            showLine: false,
            selectedMulti: false
        },
        data: {
            simpleData: {
                enable:true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: ""
            }
        },
        callback: {
            beforeClick: function(treeId, treeNode) {
                var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                // 通过 tid  获取节点
                var node = zTree.getNodeByTId(treeNode.tId);
                var url ="<%=basePath%>topics/showTpopicsInfoPage_1";
                url += "?type_id="+node.id
                demoIframe.attr("src",url);
                return true;
            }
        }
    };
    var zNodes;
    $(document).ready(function(){
        zNodes = ajaxzNodes();
        var t = $("#treeDemo");
        t = $.fn.zTree.init(t, setting, zNodes);
        demoIframe = $("#testIframe");
        var zTree = $.fn.zTree.getZTreeObj("tree");
    });
</script>
</body>
</html>
