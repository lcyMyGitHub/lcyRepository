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
    <title>首页</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
  	<link rel="stylesheet" href="<%=basePath%>user/css/style.css">
	<link rel="stylesheet" href="<%=basePath%>user/bootstrap-3.3.7-dist/css/bootstrap.min.css">
 	<link rel="stylesheet" href="<%=basePath%>user/css/index.css">
	<link rel="stylesheet" href="<%=basePath%>user/css/swiper.min.css">
  </head>
  <style>
  .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
    }
    </style>
  <body>
  	<!-- Swiper -->
    <div class="swiper-container wzy" style="height: 30%;">
        <div class="swiper-wrapper">
        	<c:forEach var="goodsImg" items="${ImgLunBoList }">
          		<img  class="swiper-slide" src="<%=basePath%>${goodsImg.img_url}" style="max-width: 100%;" />
          </c:forEach> 
        </div>
    </div>
    <script src="<%=basePath%>user/js/swiper.min.js"></script>
	<script type='text/javascript'>
		      var swiper = new Swiper('.wzy', {
        pagination: '.swiper-pagination',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        paginationClickable: true,
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: 3000,
        autoplayDisableOnInteraction: false
    });
	</script>
 	 <!-- Demo styles -->
   <style>
  
    .swiper-container {
        width: 100%;
        height: 17%;
    }
    .swiper-slide {
       
        background: #fff;
        width: 100%;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
    }
    
    </style>
 	<div class="container" style="box-sizing: border-box;padding-left: 15px;padding-bottom: 5px;padding-top: 5px;background-color: #fff;">
	 
	 <div class="row">
			<div class="col-xs-1">
				<img src="<%=basePath%>user/img/shouye_08.png" style="max-height: 20px;" />
			</div>
			<div class="col-xs-11 rm-title" >热门课题</div>
		</div>

	</div>
	 <div class="swiper-container">
        <div class="swiper-wrapper">
        
        	<c:forEach items="${TopicsInfoList1}" var="TopicInfo">
	            <div class="swiper-slide" onclick="location.href='<%=basePath%>userTopics?topic_id=${TopicInfo.topic_id }'">
		            	<div class="col-xs-12 bg-rm" style="padding:0px 15px;">
							<div class="col-xs-5 " style="padding: 5px;height: 100px;box-sizing: border-box;">
									<img src="<%=basePath%>${TopicInfo.img_url}" class="rm-goods-img" />
							</div>
							<div class="col-xs-7 rm-cont">
								<div class="rm-title1" style="font-size:0.7em;text-align: left;">
									${TopicInfo.topic_title }
								</div>
								<div class="rm-xiao">
									限制名额：${TopicInfo.topic_total}&nbsp;&nbsp;&nbsp;导师${TopicInfo.user_name}
								</div>
								<div class="rm-bottom">
									<span style="font-size:10px">已选人数：</span><span class="rm-jiage">${TopicInfo.topic_count}</span>
								</div>
							</div>
						</div>
	            </div>
            </c:forEach>
        </div>
        
    		</div> 
 	<div class="container" style="padding-top: 10px;margin-bottom: 70px;background-color: #fff;">
	   <div class="row">
		
			<div class="col-xs-1">
				<img src="<%=basePath%>user/img/shouye_08.png" style="max-height: 20px;" />
			</div>
			<div class="col-xs-11 rm-title" >推荐</div>
		
		</div>
		<c:forEach items="${TopicsInfoList2}" var="TopicInfo">
		
		<div class="row marg" onclick="location.href='<%=basePath%>userTopics?topic_id=${TopicInfo.topic_id}'">
			<div class="col-xs-12 bg-rm" >
				<div class="col-xs-5 " style="padding: 5px;height: 100px;box-sizing: border-box;">
					<img src="<%=basePath%>${TopicInfo.img_url}" class="rm-goods-img" />
				</div>
				<div class="col-xs-7 rm-cont">
					<div class="rm-title1">
						${TopicInfo.topic_title}
					</div>
					<div class="rm-xiao">
						限制名额：${TopicInfo.topic_total}&nbsp;&nbsp;&nbsp;导师${TopicInfo.user_name}
					</div>
					<div class="rm-bottom">
						<span style="font-size:10px">已选人数：</span><span class="rm-jiage">${TopicInfo.topic_count}</span>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
		
	</div>
	<jsp:include   page="bottom.jsp" flush="true"> 
		<jsp:param value="sy" name="newsId"/>
	</jsp:include>
	<script type='text/javascript'>
	
		 var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        slidesPerView: 'auto',
        paginationClickable: true,
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: 2000,
        autoplayDisableOnInteraction: false
    }); 
       
	</script>
  </body>
</html>
