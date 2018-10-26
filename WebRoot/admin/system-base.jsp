<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>"/>
	<link rel="Bookmark" href="/favicon.ico" />
	<link rel="Shortcut Icon" href="/favicon.ico" />
	<title>基本设置</title>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/h-ui.admin/css/style.css" />
	
	<link rel="stylesheet" href="<%=basePath%>admin/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css"/>
	
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span>
	系统管理
	<span class="c-gray en">&gt;</span>
	基本设置
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
	<form class="form form-horizontal" id="form-systembase-add">
		<input  type="hidden"  id="config_id" name="config_id"  value="${systemBaseInfo.config_id}"/>
		<div id="tab-system" class="HuiTab">
			<div class="tabBar cl">
				<span>基本设置</span>
				<span>支付宝设置</span>
				<span>短信设置</span>
				<span>广告设置</span>
			</div>
			
			<div class="tabCon">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">
						<span class="c-red">*</span>
						网站名称：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" id="config_title"  name="config_title"  placeholder="控制在25个字、50个字节以内" value="${systemBaseInfo.config_title}" class="input-text" />
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">
						<span class="c-red">*</span>
						关键词：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" id="config_keywords" name="config_keywords" placeholder="5个左右,8汉字以内,用英文,隔开" value="${systemBaseInfo.config_keywords}" class="input-text"/>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">
						<span class="c-red">*</span>
						描述：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" id="config_description" name="config_description" placeholder="空制在80个汉字，160个字符以内" value="${systemBaseInfo.config_description}" class="input-text">
					</div>
				</div>
			<!-- 	
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">
						<span class="c-red">*</span>
						上传目录配置：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" id="config_upload"  name="config_upload"  placeholder="默认为uploadfile" value="${systemBaseInfo.config_upload}" class="input-text"/>
					</div>
				</div> -->
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">
						<span class="c-red">*</span>
						底部版权信息：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" id="config_copyright" name="config_copyright" placeholder="&copy; 2016 H-ui.net" value="${systemBaseInfo.config_copyright}" class="input-text"/>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">备案号：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" id="config_record" name="config_record" placeholder="京ICP备00000000号" value="${systemBaseInfo.config_record}" class="input-text"/>
					</div>
				</div>
				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">屏蔽词：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<textarea id="config_shield" name="config_shield" class="textarea" style="width:98%; height:100px; resize:none">${systemBaseInfo.config_shield}</textarea>
					</div>
				</div>
			</div>
			<div class="tabCon">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">支付账户：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${systemBaseInfo.payment_account}" id="payment_account" name="payment_account"/>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">支付KEY：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<textarea class="textarea" name="paymentkey" id="paymentkey" >${systemBaseInfo.paymentkey}</textarea>
					</div>
				</div>
			</div>
			
			<div class="tabCon">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">短信账号：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${systemBaseInfo.sms_account}" id="sms_account" name="sms_account" />
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">短信密码：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${systemBaseInfo.sms_password}" id="sms_password" name="sms_password"/>
					</div>
				</div>	
			</div>
		
			<div class="tabCon">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">全新市场：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${systemBaseInfo.new_market}" id="new_market" name="new_market" />
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">二手市场：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${systemBaseInfo.secondhand_market}" id="secondhand_market" name="secondhand_market" />
					</div>
				</div>
			</div>
		
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">		
				<button type="submit" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存</button>
				<button onClick="systembase_layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</div>


<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="<%=basePath%>admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>

<script type="text/javascript" src="<%=basePath%>admin/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript">

$(function(){
	
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	$("#tab-system").Huitab({
		index:0
	});
	
	
	$("#form-systembase-add").validate({
		rules:{
			config_title:{
				required:true,
				minlength:3,
				maxlength:30
			}
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
		
		  $.post('<%=basePath%>systembase/updateSystemBaseInfo',
			{
			  	//基本设置
			config_id:$("#config_id").val(),   //网站id
      		config_title:$("#config_title").val(),//网站名称
  			config_keywords:$("#config_keywords").val(),//关键词
  			config_description:$("#config_description").val(),//描述
  			config_copyright:$("#config_copyright").val(),//底部版权信息
  			config_record:$("#config_record").val(),//备案号
  			config_shield:$("#config_shield").val(),//屏蔽词
  			//支付宝设置
  			paymentkey:$("#paymentkey").val(),           //支付账户
  			payment_account:$("#payment_account").val(), //支付KEY 
    		//短信信息设置	
    		sms_account:$("#sms_account").val(),   //短信账户
  			sms_password:$("#sms_password").val(), //短信密码 
  			//广告图片设置
  			new_market:$("#new_market").val(),              //全新市场
  			secondhand_market:$("#secondhand_market").val() //二手市场
			},
				function(data){
				
					if(data.code==0)
					{
						layer.msg(data.msg, {icon:1,time:1500});
						
						setTimeout("location.reload();",1500);
					}else
					{
						layer.msg(data.msg, {icon:2,time:1500});
						
					}
					parent.layer.close(lay);
					
				}
				,'json');
	
		}
	});
	
	
	
	
	
	
	
});

function systembase_layer_close(){
	parent.layer.close(lay);
}



</script>

</body>
</html>
