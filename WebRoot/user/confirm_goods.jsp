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
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
		<title>提交订单</title>
		<link rel="stylesheet" href="<%=basePath%>user/css/style.css">
		<link rel="stylesheet" href="<%=basePath%>user/bootstrap-3.3.7-dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=basePath%>user/css/confirm_goods.css">
  </head>
  <body>
    <nav class="navbar navbar-default navbar-fixed-top" style="background-color: #fff;">
		 <div class="container-fluid" style="padding-right: 0px;">
		    <div class="navbar-header" style="text-align: center;width: 100%;">
		      <a class="navbar-brand" href="javascript:history.back(-1);" >
		        <span class="glyphicon glyphicon-chevron-left"  ></span>
		      </a>
		      

		      
		    </div>
		  </div>
	 	</nav>

		<div class="col-xs-12 queren" >
			<div class="col-xs-8 text-right queren_heji">
			</div>
			<div class="col-xs-4 text-center queren_button" onclick="submit()">
				确认提交
			</div>
		</div>
  </body>
	<%--<div class="col-xs-12" id="deliveryMethod" style="display: none;">
  		<div class="col-xs-12 guige_jiage_title">选择配送方式</div>
  		<div class="container">
	  		<c:forEach var="array" items="${deliveryMethodArray }">
	  			<div onclick="onDeliveryMethod(this)"  class="wzy text-center class_goods"
	  			 array="${array }" >
					${array}
				</div>
	  		</c:forEach>
  		</div>
	</div>--%>
	<input type="hidden" value="" id="addressId" />
  	<script type="text/javascript" src="<%=basePath%>admin/lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="<%=basePath%>admin/lib/layer/2.4/layer.js"></script>
  	<script type="text/javascript">
  		// 默认显示送货上门
  		document.getElementById("deliveryMethodChoice").innerHTML = "送货上门";
		
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
		
	  	// 点击加号按钮
	  	function addQuantity() {
	  		var number = parseInt(document.getElementById("number").innerHTML) + 1;
	  		document.getElementById("number").innerHTML = number;
	  		var totalPrice = (parseFloat(document.getElementById("price").innerHTML) * number).toFixed(2);
	  		document.getElementById("totalPrice").innerHTML = totalPrice;
	  	};
  	
	  	// 点击减号按钮
		function reducedQuantity() {
			var number = parseInt(document.getElementById("number").innerHTML);
			if (number < 2) {
				layer.msg('购买数量不可少于1件');
				return;
			}
			number = number - 1;
			document.getElementById("number").innerHTML = number;
			var totalPrice = (parseFloat(document.getElementById("price").innerHTML) * number).toFixed(2);
	  		document.getElementById("totalPrice").innerHTML = totalPrice;
		};
		
		// 单击配送方式
		function deliveryMethod() {
			var deliveryMethod = $("#deliveryMethod").html();
			layer.open({
				type: 1,
				title: false,
			    content: deliveryMethod,
			    style: 'background-color: #f8f3f3;position:fixed; bottom:0; left:0; width: 100%; height: auto; padding:0px; border:none;'
			});
		};
		



		
		// 点击确认提交订单信息
		function submit() {
			var address_id = document.getElementById("addressId").value;
			if (address_id == null || address_id == "") {
				layer.msg('请选择收货人信息！');
				return;
			}
			var order_total_price = document.getElementById("totalPrice").innerHTML;
			var order_payment_type = 1;
			if ("支付宝" == document.getElementById("paymentMethodChoice").innerHTML)
				order_payment_type = 1;
			var order_delivery_mode = 1;
			if ("送货上门" == document.getElementById("deliveryMethodChoice").innerHTML)
				order_delivery_mode = 1;
			else if ("门店自提" == document.getElementById("deliveryMethodChoice").innerHTML)
				order_delivery_mode = 2;
			$.ajax({ // 提交数据创建订单
				type: 'POST',
				url: '<%=basePath%>ordersInfo/addOrders',
				dataType: 'json',
				async: false,
				data: {address_id: address_id, order_total_price: order_total_price, order_payment_type: order_payment_type, order_delivery_mode: order_delivery_mode},
				success: function(data_add) {
					if (data_add.msg == "1") {
						var orders_number = getCookie("orders_number");
						$.ajax({ // 根据订单编号查找订单主键Id
							type: 'POST',
							url: '<%=basePath%>ordersInfo/findOrdersByOrderNumber',
							dataType: 'json',
							async: false,
							data: {orders_number: orders_number},
							success: function(data_ByOrderNumber) {
								if (data_ByOrderNumber.msg > 0) {
									var goods_id = ${goodsinfo.goods_id};
									var specifications_id = ${specifications.specifications_id};
									var order_id = data_ByOrderNumber.msg;
									var order_total = document.getElementById("number").innerHTML;
									var goods_remark = document.getElementById("goods_remark").value;
									$.ajax({ // 添加订单商品信息
										type: 'POST',
										url: '<%=basePath%>ordersInfo/addOrderGoods',
										dataType: 'json',
										async: false,
										data: {goods_id: goods_id, specifications_id: specifications_id, order_id: order_id, order_total: order_total, goods_remark: goods_remark, goods_total_price: order_total_price},
										success: function(data_Goods) {
											if (data_Goods.msg == "1") {
												// 调用支付宝接口付款
											}
											else
												layer.msg(data_Goods.msg);
										}
									});
								}
								else 
									layer.msg('查找订单数据出错！');
							}
						});
					}
					else
						layer.msg(data_add.msg);
				}
			});
		};
  	</script>
</html>
