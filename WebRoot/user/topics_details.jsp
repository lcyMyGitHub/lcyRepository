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
		<title>课题详情</title>
		<link rel="stylesheet" href="<%=basePath%>user/css/style.css">
		<link rel="stylesheet" href="<%=basePath%>user/bootstrap-3.3.7-dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=basePath%>user/css/swiper.min.css">
		<link rel="stylesheet" href="<%=basePath%>user/css/details_goods.css">
<%-- 		<link rel="stylesheet" href="<%=basePath%>user/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css">
 --%>
  </head>
  
  <body>
   <!-- 轮播图 -->
		    <div class="swiper-container" >
		        <div class="swiper-wrapper" >
		        	<c:forEach var="topicsImg" items="${TopicsImgLunBoList }">
          				<img  class="swiper-slide" src="<%=basePath%>${topicsImg.img_url}" style="max-width: 100%;" />
          			</c:forEach>
		        </div>
		        <!-- Add Pagination -->
		        <div class="swiper-pagination "></div>
		    </div>
 			<span  class="glyphicon glyphicon-circle-arrow-left fh" onclick="history.back(-1);" ></span>
			
			<nav id="navdis" class="navbar navbar-default navbar-fixed-top" style="opacity:1;background-color: #fff;">
			 <div class="container-fluid" style="padding-right: 0px;">
			    <div class="navbar-header" style="text-align: center;width: 100%;">
			      <a class="navbar-brand" style="padding-right: 15px;" href="javascript:history.back(-1);" >
			        <span class="glyphicon glyphicon-chevron-left" ></span>
			      </a>
			      
			     <span class="navbar-brand title_name"  >
			      	课题列表
			      </span>
			      
			    </div>
			  </div>
		 	</nav>
		 	<div class="col-xs-12 title_goods" >
		 		${TopicsInfo.topic_title }
		 	</div>
		 	<div class="col-xs-12 title_price" >
				<div class="col-xs-4  " >
					<span style="font-size:10px">剩余名额：</span>
					<span>${TopicsInfo.topic_total-TopicsInfo.topic_count }</span>
				</div>
				<div class="col-xs-8 text-right">
					<em class="rm-jiage-xian">
						导师：<span id="user_name">${TopicsInfo.user_name }</span>
					</em>
				</div>
		 	</div>
		 	<div class="col-xs-12 title_jies" >
		 		<div class="col-xs-8 text-right">
					已选人数：<span>${TopicsInfo.topic_count }</span>人
		 		</div>
		 		<div class="col-xs-4 text-right">
					限制名额<span>${TopicsInfo.topic_total }</span>人
		 		</div>
		 	</div>
		 	<div class="col-xs-12 title_icon" >
				<div class="col-xs-4">
					<img src="<%=basePath%>user/img/icon_xp.png" style="max-width: 32%;vertical-align: middle;" />热门课题
				</div>
		 		<div class="col-xs-4" >
		 			<img src="<%=basePath%>user/img/icon_7tian.png"style="vertical-align: middle;" />喜爱老师
		 		</div>

		 		<div class="col-xs-4">
		 			<img src="<%=basePath%>user/img/icon_tui.png"style="vertical-align: middle;" /> 赞
		 		</div>
		 	</div>
		 	<div class="col-xs-12 title_xq" >
		 		<div class="col-xs-12 text-center">
		 			<img src="<%=basePath%>user/img/shouye_08.png" />
		 			文图详情
		 		</div>
		 	</div>
		 	<div class="col-xs-12 xq" >
		 			${TopicsInfo.topic_introduce }
		 	</div>
		 	<div class="goumai">
		 		<div class="divgoumai" onclick="submitgoods()">立即选题</div>
		 	</div>
	</body>
	<div class="col-xs-12" id="contdiv" style="display: none;">
		<div class="col-xs-12 div1">
			<div class="col-xs-3 guige_jiage_1">
				 <span id="msg_show"></span>
			 </div>
		</div>
		<div class="col-xs-12 text-center dibu" onclick="submitgoods()">
			&nbsp;选&nbsp;&nbsp;题
		</div>
	</div>
  <script type="text/javascript" src="<%=basePath%>admin/lib/jquery/1.9.1/jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>user/js/swiper.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>user/layer_mobile/layer.js"></script>
  <script type="text/javascript" src="<%=basePath%>admin/lib/layer/2.4/layer.js"></script>

  <script type="text/javascript">
		// 设置cookie
		function setCookie(c_name,value,expiredays) {
			var exdate=new Date();
			exdate.setDate(exdate.getDate()+expiredays);
			document.cookie=c_name+ "=" +escape(value)+((expiredays==null) ? "" : ";expires="+exdate.toGMTString());
		};
		
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
	
		// 隐藏顶部标题栏
	 	$("#navdis").hide();
	    var swiper = new Swiper('.swiper-container', {
	        pagination: '.swiper-pagination',
	        paginationClickable: true
	    });
	        
	    // 顶部标题栏的显示与隐藏
	    window.onscroll = function () {
		  	if($(document).scrollTop()==1||$(document).scrollTop()<40){
	   	  		$("#navdis").hide();	
	      	}else{
	      		$("#navdis").show();	
	      	}
		};
	  	
		$(function(){
			// “立即购买”层弹出并加载样式函数
			var title_guige = function(){
				var contdiv = $("#contdiv").html();
			 //页面层
			  layer.open({
			  	type:1,
			    content: contdiv,
			    anim: 'up',
			    style: 'background-color: #f8f3f3;position:fixed; bottom:0; left:0; width: 100%; height: auto; padding:0px; border:none;'
			  });
			};

			$(".ww").click(function() {
                title_guige();
            });
		});

		// 购买按钮点击
		function submitgoods() {
			// 验证cookie中是否有用户信息
			var user_number = getCookie("user_id");
			if (user_number != null && user_number != "") {
                var amount_last = ${TopicsInfo.topic_total-TopicsInfo.topic_count }
				if(amount_last==0) {
					 //提示
                     layer.open({
                        content: "已达到限制人数",
                        skin: 'msg',
                        time: 2 //2秒后自动关闭
                      });
				} else {
				    var topic_id=${TopicsInfo.topic_id};
                    $.ajax({ //
                        type: 'POST',
                        url: '<%=basePath%>userTopics/addUserSelect',
                        dataType: 'json',
                        async: false,
                        data: {user_id: user_number,topic_id:topic_id},
                        success: function(data) {
                            if (data.code ==2) {
                                layer.msg(data.msg);
                                       /*layer.open({
                                            content:data.msg,
                                            skin: 'msg',
                                            time: 2 //2秒后自动关闭
                                        });*/
                            } else{
                                layer.msg(data.msg);
                            }
                        }
                    });
				}
            }
			else {
				// 将当前路径存入cookie
				setCookie("url", window.location.href, 1);
				location.href="<%=basePath%>user/login.jsp";
			}	
		}
    </script>
</html>
	
	