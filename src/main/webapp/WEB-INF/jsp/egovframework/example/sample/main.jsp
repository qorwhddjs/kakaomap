<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
  <link rel="shortcut icon" type="image/x-icon" href="https://png.pngtree.com/element_our/20190528/ourmid/pngtree-gold-coin-icon-image_1130438.jpg">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><spring:message code="title.sample" /></title>
    
    <style>
    #map {
        width:100%;
        height: 800px;
        background-color: grey;
        float:left;
      }

    body{
    	width: 100%;
    	height: 100%;
    	background: #666;
    }
    #content_pop {position:relative; padding:0 0 0 0; width:680px; left:50%;transform:translate(-50%);}
    	.for_box{
    		width: 100%;
    		height: auto;
    		float: left;
    		border:1px solid #c1c1c1;
    		border-radius: 20px;
    		background: #fff;
    	}
    	.for_id{
			width: 90%;
			height: 20px;
			border-bottom:1px solid #c1c1c1;
			line-height: 10px;
			float: left;
		}
		.pic{
			width: 10%;
			height: 20px;
			border-bottom:1px solid #c1c1c1;
			line-height: 20px;
			float: left;
			text-align: center;
			
		}
		.for_name{
			display: inline-block;
			width: 100%;
			height: 15px;
			font-size:10px;
			border-bottom:1px solid #c1c1c1;
			line-height: 15px;
		}
		.for_des{
			position:relative;
			font-size:20px;
			width: 80%;
			left:50%;
			transform:translate(-50%);
			padding-top:20px;
			padding-bottom:20px;
			
		}
		.blank{
			width:100%;
			height: 100px;
			float: left;
		}
		#title{
			margin-bottom: 30px;
		}
    </style>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javaScript" language="javascript" defer="defer">
        
        /* 글 수정 화면 function */
        function fn_egov_select(id) {
        	document.listForm.selectedId.value = id;
           	document.listForm.action = "<c:url value='/updateSampleView.do'/>";
           	document.listForm.submit();
        }
        
        /* 글 등록 화면 function */
        function fn_egov_addView() {
           	document.listForm.action = "<c:url value='/addSample.do'/>";
           	document.listForm.submit();
        }
        
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.listForm.submit();
        }
        /* 글 등록 화면 function */
        function fn_egov_view(id) {
        	document.listForm.selectedId.value = id;
           	document.listForm.action = "<c:url value='/viewSample.do'/>";
           	document.listForm.submit();
        }
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/main.do'/>";
           	document.listForm.submit();
        }
        
        
    </script>
   <style>
       *{text-align: left;}
        #map {
            width: 100vw; height: 100vh;
        }
        .level{
        	width: 100vw; height: 1vh;
        	float: left;
        }
        div.wrap {
            width: 200px;
        }
        div.text-box {
            text-align: center;
        }
        h4 {
            margin: 10px auto 0;
        }
        div.img-box {
            max-height: 100px;
            overflow: hidden;
        }
        img {
            width: 150px;
            margin: -20px auto 0;
        }
        a {
            text-decoration: none;
            color: #000;
        }
        
        
        /* 확대/축소 등 구글 지도의 기본 UI 감추기 */
        .gmnoprint, .gm-control-active.gm-fullscreen-control {
            display: none;
        }
        #floating-panel {
        position: absolute;
        top: 3000px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
        .map_wrap {position:relative;width:100vw;height:100vh;float: left;}
.radius_border{border:1px solid #919191;border-radius:5px;}     
.custom_typecontrol {position:relative;top:10px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
.custom_typecontrol span {display:block;width:65px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;}
.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
.custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
.custom_typecontrol .selected_btn:hover {color:#fff;}   
.custom_zoomcontrol {position:absolute;top:50px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
.custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;}             
.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}
#clickLatlng{float: left;width: 100vw; height: 50px;color: #fff}
.overlaybox {position:relative;width:360px;height:350px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/box_movie.png') no-repeat;padding:15px 10px;}
.overlaybox div, ul {overflow:hidden;margin:0;padding:0;}
.overlaybox li {list-style: none;}
.overlaybox .boxtitle {color:#fff;font-size:16px;font-weight:bold;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png') no-repeat right 120px center;margin-bottom:8px;}
.overlaybox .first {position:relative;width:247px;height:136px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumb.png') no-repeat;margin-bottom:8px;}
.first .text {color:#fff;font-weight:bold;}
.first .triangle {position:absolute;width:48px;height:48px;top:0;left:0;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/triangle.png') no-repeat; padding:6px;font-size:18px;}
.first .movietitle {position:absolute;width:100%;bottom:0;background:rgba(0,0,0,0.4);padding:7px 15px;font-size:14px;}
.overlaybox ul {width:247px;}
.overlaybox li {position:relative;margin-bottom:2px;background:#2b2d36;padding:5px 10px;color:#aaabaf;line-height: 1;}
.overlaybox li span {display:inline-block;}
.overlaybox li .number {font-size:16px;font-weight:bold;}
.overlaybox li .title {font-size:13px;}
.overlaybox ul .arrow {position:absolute;margin-top:8px;right:25px;width:5px;height:3px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/updown.png') no-repeat;} 
.overlaybox li .up {background-position:0 -40px;}
.overlaybox li .down {background-position:0 -60px;}
.overlaybox li .count {position:absolute;margin-top:5px;right:15px;font-size:10px;}
.overlaybox li:hover {color:#fff;background:#d24545;}
.overlaybox li:hover .up {background-position:0 0px;}
.overlaybox li:hover .down {background-position:0 -20px;}   
.search_menu{
	display:inline-block;
	width: 100px;height: 100px;
	position: absolute;
	background: #fff;
	border-radius: 20px;
	top:50px;
	left: 25px;
	z-index: 10000;
	border : 1px solid #c1c1c1;
}       
.search_menu:hover{
	background: #f1f1f1;
}          
.search_menu:active{
	background: #c1c1c1;
}         
input[name="box"]{
	display:none;
	width: 100px;height: 100px;
	top:0;
	left: 0;
}
input[name="box2"]{
	display:none;
	width: 100px;height: 100px;
	top:0;
	left: 0;
}
.search_menu2{
	display:inline-block;
	width: 100px;height: 100px;
	position: absolute;
	background: #fff;
	border-radius: 20px;
	top:50px;
	left: 150px;
	z-index: 10000;
	border : 1px solid #c1c1c1;
}       
.search_menu2:hover{
	background: #f1f1f1;
}          
.search_menu2:active{
	background: #c1c1c1;
}   


	.right_boxs{
		width:100%;
		height:100vh;
		background: #fff;
		position:fixed;
		top:0;
		left: 100%;
		z-index: 1111;
		transition:0.5s;
		
	}
	#box2:checked ~ .right_boxs {
		left:0px;
	}	 

	.left_box{
		width: 300px;
		height: 100vh;
		background: #fff;
		position:fixed;
		top:0;
		left: -300px;
		z-index: 1112;
		transition:0.5s;
		border-right: 1px solid #c1c1c1;
		box-sizing: border-box;
		
	}
	/* SCROLL */
::-webkit-scrollbar { display: none; }
/* 스크롤바의 width */
::-webkit-scrollbar-track { background-color: #f0f0f0; }
/* 스크롤바의 전체 배경색 */
::-webkit-scrollbar-thumb { 
    background: #FFC81E; border-radius: 50px;
}
/* 스크롤바 색 */
::-webkit-scrollbar-button { display: none; }
	.left_boxs{
		width: 300px;
		height: 706px;
		float:left;
		overflow-x: hidden;
	}
	#box:checked ~ .left_box {
		left:0px;
	}	 
	.searchs{
		margin: 0 auto;
		 padding:10px 10px 10px 10px; 
	}
	.jsons{position: relative;}

	.jsons:active{background: #c1c1c1;}
	.act{
		background: #c1c1c1;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
.dot {overflow:hidden;float:left;width:12px;height:12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
.number {font-weight:bold;color:#ee6152;}
.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
.distanceInfo .label {display:inline-block;width:50px;}
.distanceInfo:after {content:none;}
	
	
*{color: #000;}	
	/*                */
.ball{
	width: 300px;height: 300px;
	position: relative;
	z-index: 10000;
	top:35px;
	left:81%;
	transform:rotate(115deg);

}
	.in{
	width: 300px;
	height: 300px;
	top: calc(50% - 150px);
	left: calc(50% - 100px);
	position: absolute;
	border-radius: 50%;
	/* background: radial-gradient(#fff,#d1fffc,#37c6fb,#00a8ff); */
	background: #000;
}
.box{
	width: 300px;
	height: 300px;
	top: calc(50% - 150px);
	left: calc(50% - 100px);  
	position: absolute;
	transform: perspective(2000px) rotateX(0deg);
	transform-style: preserve-3d;
	transition: 0.5s;
 	background: #000;
	border-radius: 50%;
}
.box .b{
	top: 0;
	left: 0;
	transform-style: preserve-3d;
	position: absolute;
	width: 100%;
	height: 100%;
	animation:drive 16s linear infinite;
	transform:rotateX(0deg) rotateY(0deg) rotateX(0deg);
}
.box .b>span{
	width: 300px;
	height: 300px;
	display: block;
	border-radius: 50%;
	position: absolute;
	top: 0;
	left: 0;
	transition: 0.5s;
	perspective:800px;
	transform-style: preserve-3d;
	
}
.box .b>span:nth-child(1){transform: rotateX(0deg)}
.box .b>span:nth-child(2){transform: rotateX(30deg)}
.box .b>span:nth-child(3){transform: rotateX(60deg)}
.box .b>span:nth-child(4){transform: rotateX(90deg)}
.box .b>span:nth-child(5){transform: rotateX(120deg)}
.box .b>span:nth-child(6){transform: rotateX(150deg)}
@keyframes drive{
	0%{transform: perspective(1000px) rotateX(180deg)  }
	100%{transform: perspective(1000px) rotateX(540deg)}
} 
.box .a{
	top: 0;
	left: 0;
	transform-style: preserve-3d;
	position: absolute;
	width: 100%;
	height: 100%;
	transform:rotateX(60deg) rotateY(0deg) rotateX(0deg);
	animation:drives 16s linear infinite;
	
}
.box .a>span{
	width: 300px;
	height: 300px;
	display: block;
	border-radius: 50%;
	position: absolute;
	top: 0;
	left: 0;
	transition: 0.5s;
	perspective:800px;
	transform-style: preserve-3d;
	
}
.box .a>span:nth-child(1){transform: rotateX(0deg)}
.box .a>span:nth-child(2){transform: rotateX(30deg)}
.box .a>span:nth-child(3){transform: rotateX(60deg)}
.box .a>span:nth-child(4){transform: rotateX(90deg)}
.box .a>span:nth-child(5){transform: rotateX(120deg)}
.box .a>span:nth-child(6){transform: rotateX(150deg)}



*{
  margin: 0;
  padding: 0;
}


span > p{
	display:inline-block;
	width: 50px;
	height: 50px;
	background: url(https://us.123rf.com/450wm/imagecatalogue/imagecatalogue1604/imagecatalogue160400380/54750346-%ED%9A%8C%EC%A0%84-%EB%B2%A1%ED%84%B0-%EC%9B%90-%EC%95%84%EC%9D%B4%EC%BD%98%EC%9E%85%EB%8B%88%EB%8B%A4-%EC%8A%A4%ED%83%80%EC%9D%BC%EC%9D%80-%EC%96%87%EC%9D%80-%EB%9D%BC%EC%9D%B8-%EC%95%84%EC%9D%B4%EC%BD%98-%EA%B8%B0%ED%98%B8-%EA%B2%80%EC%9D%80-%EC%83%89-%ED%9D%B0%EC%83%89-%EB%B0%B0%EA%B2%BD%EC%9D%B4%EB%8B%A4-.jpg?ver=6);
	background-size:50px;
	transform-style: preserve-3d;
	float: left;
	transition:0.5s;
	position: relative;
	border-radius: 50%;
	overflow:hidden;
	text-align: center;
	line-height: 50px;
	font-size: 0px;
	
	
}
span > p:hover{
	opacity: 0.5;
}	
span > p:nth-child(1){
	transform:rotate3d(-1, 1, 0, 90deg) rotate(40deg);
	top:40px;
	animation:drives1 4s linear infinite;
}
span > p:nth-child(2){
	transform:rotate3d(-2, 1, 0, 90deg) rotate(90deg);
	animation:drives2 4s linear infinite;
}
span > p:nth-child(3){
	transform:rotate3d(-3, 1, 0, 90deg) rotate(90deg);
	top:-15px;
	animation:drives3 4s linear infinite;
}
span > p:nth-child(4){
	transform:rotate3d(3, 1, 0, 90deg) rotate(90deg);
	top:-15px;
	animation:drives4 4s linear infinite;
}
span > p:nth-child(5){
	transform:rotate3d(2, 1, 0, 90deg) rotateZ(90deg);
	animation:drives5 4s linear infinite;
}
span > p:nth-child(6){
	transform:rotate3d(1, 1, 0, 90deg) rotate(90deg);
	top:40px;
	animation:drives6 4s linear infinite;
}
@keyframes drives{
	0%{transform: perspective(1000px) rotateX(0deg) rotateX(0deg)  }
	100%{transform: perspective(1000px) rotateX(0deg)  rotateX(359deg)}
} 




/**/
@keyframes drives1{
	0%{transform:rotate3d(-1, 1, 0, 90deg) rotate(40deg);  }
	100%{transform:rotate3d(-1, 1, 0, 90deg) rotate(400deg);}
} 
@keyframes drives2{
	0%{transform:rotate3d(-2, 1, 0, 90deg) rotate(90deg)  }
	100%{transform:rotate3d(-2, 1, 0, 90deg) rotate(450deg)}
} 
@keyframes drives3{
	0%{transform:rotate3d(-3, 1, 0, 90deg) rotate(90deg);  }
	100%{transform:rotate3d(-3, 1, 0, 90deg) rotate(450deg);}
} 
@keyframes drives4{
	0%{transform:rotate3d(3, 1, 0, 90deg) rotate(90deg); }
	100%{transform:rotate3d(3, 1, 0, 90deg) rotate(450deg);}
} 
@keyframes drives5{
	0%{transform:rotate3d(2, 1, 0, 90deg) rotateZ(90deg);}
	100%{transform:rotate3d(2, 1, 0, 90deg) rotateZ(450deg);}
} 
@keyframes drives6{
	0%{transform:rotate3d(1, 1, 0, 90deg) rotate(90deg); }
	100%{transform:rotate3d(1, 1, 0, 90deg) rotate(450deg);}
} 
/**/



.lat{
display:inline-block;
font-size: 1px;
opacity: 0;
width: 1px;
height: 1px;
}
.lng{
display:inline-block;
font-size: 1px;
opacity: 0;
width: 1px;
height: 1px;
}
.poi{cursor: pointer;}

    </style>
 
</head>

<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">



   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6df6b38277b708d2bba500c7d1ddd771"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$( function() {
    $( ".left_boxs" ).sortable();
    $( ".left_boxs" ).disableSelection();
  } );
</script>

   <div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div> 
    <!-- 지도타입 컨트롤 div 입니다 -->
  	<div class="ball">
  	<div class="in"></div>
		<div class="box">
			<div class="b">
			
			</div>	
			<div class="a">
				
			</div>
		</div>

			

		
  	</div>
    
    <input name="box" id="box" type="checkbox"/>
    
    
    
    
    <label for="box" id="boxs">
    	<div class="search_menu close" ></div>	
    </label>
     <input name="box2" id="box2" type="checkbox"/>
    
    
    
    
    <label for="box2" id="boxs2">
    	<div class="search_menu2 close" ></div>	
    </label>

    

    	

    
    
    <div class="left_box" id="search_checking" name="address_and_marking">
    	<div class="fill" style="width: 300px; height: 200px; float: left;"></div>
	    <div class="searchs">
	    	<input type="text" id="searchs" name="searchs" style="width: 250px; height: 30px; font-size:30px;" class="searchs"/>
	    </div>	
    
    
	    <div class="left_boxs">
	    
	    </div>
    	
    	
    	
    	
    	
    	
    </div>
    
    <div class="right_boxs">
	    <div id="roadview" style="width:100%;height:100vh;"></div>
	</div>
    
  
    <div id="clickLatlng" style="position: fixed;width: 94vw;height: 30px;background: #c1c1c1;top:0;z-index: 1000"></div>
</div>




<script type="text/javascript">
$(document).ready(function () {
	
	
	var Json = '{"awesome":[' +
	'{"address":"서울시 양천구 신월2동","roadars":"오목로 90 506-1","mailnum":"08028","lat":"37.52325933872621","lng":"126.8477850796552"},'+
	'{"address":"서울시 양천구 신월3동","roadars":"오목로 90 506-2","mailnum":"08028","lat":"37.53266091798328","lng":"126.82783657500902"},'+
	'{"address":"서울시 양천구 신월5동","roadars":"오목로 90 506-3","mailnum":"08028","lat":"37.540268410658356","lng":"126.82994630991479"},'+
	'{"address":"서울시 양천구 신월4동","roadars":"오목로 90 501-2","mailnum":"08058","lat":"37.522037674762636","lng":"126.84034973966389"},'+
	'{"address":"서울시 양천구 신정4동","roadars":"등촌로 20 506-1","mailnum":"08018","lat":"37.52584639702217","lng":"126.85965266263439"},'+
	'{"address":"서울시 성북구 석관동","roadars":"한천로81길  7 189-37","mailnum":"02783","lat":"37.60083828652933","lng":"127.00900274540975"},'+
	'{"address":"서울시 용산구 이태원2동","roadars":"회나무로12길  27 214-4","mailnum":"04346","lat":"37.53913809545183","lng":"126.99067654675825"},'+
	'{"address":"서울시 양천구 신정4동","roadars":"오목로32길 23-16","mailnum":"08025","lat":"37.52298635305064","lng":"126.85643398007824"},'+
	'{"address":"서울시 중구 명동","roadars":"세종대로 110","mailnum":"04524","lat":"37.56677014497083","lng":"126.97866359329848"},'+
	'{"address":"서울시 양천구 신정동","roadars":"신월로339 23-16","mailnum":"08035","lat":"37.52192401588894","lng":"126.86478446474726"},'+
	'{"address":"서울시 구로구 구로4동","roadars":"구로중앙로 48","mailnum":"03035","lat":"37.494470118570845","lng":"126.89060518451546"},'+
	'{"address":"서울시 마포구 망원2동","roadars":"방울내로 31","mailnum":"03035","lat":"37.55917839610888","lng":"126.89885193962573"},'+
	'{"address":"성남시 수정구 삼평동","roadars":"창업로 42","mailnum":"03135","lat":"37.412252328387446","lng":"127.09412188642872"},'+
	'{"address":"서울시 양천구 신월2동","roadars":"중앙로 55길 45","mailnum":"03135","lat":"37.52617853123727","lng":"126.84428911820243"},'+
	'{"address":"서울시 강북구 삼양동","roadars":"월계로 221","mailnum":"03135","lat":"37.62350713091376","lng":"127.04707769512643"},'+
	'{"address":"인천시 계양구 효성동","roadars":"길마로 92-1","mailnum":"03135","lat":"37.53356596441121","lng":"126.7158811341125"},'+
	'{"address":"서울 강북구 삼양동","roadars":"삼양로 49길 17","mailnum":"03135","lat":"37.62337807747321","lng":"127.01569725816182"},'+
	'{"address":"서울 강북구 삼양동","roadars":"솔샘로 195","mailnum":"03135","lat":"37.62046130189815","lng":"127.01435154182239"},'+
	'{"address":"서울 강북구 삼양동","roadars":"삼양로 19길 141","mailnum":"03135","lat":"37.616454016931684 ","lng":"127.01546643930587"},'+
	'{"address":"서울 강북구 삼양동","roadars":"이현구 18련 141","mailnum":"03135","lat":"37.616206021342414","lng":"127.0170889145271"},'+
	'{"address":"서울시 동작구 대방동","roadars":"대방동1길 46","mailnum":"03135","lat":"37.501333827404935","lng":"126.92226081766789"},'+
	'{"address":"부천시 계안구 신중동","roadars":"신중동1길 46","mailnum":"03135","lat":"37.50511142224995 ","lng":"126.76440712301701 "},'+
	'{"address":"부천시 계안구 신중동","roadars":"신중동1길 46","mailnum":"03135","lat":"37.523362262129304  ","lng":"126.76720614208627  "},'+
	/**/
	'{"address":"서울시 강남구 논현동","roadars":"창업로 42","mailnum":"03135","lat":"37.5050123793611 ","lng":"127.02598266355172 "},'+
	'{"address":"서울시 양천구 신월동","roadars":"창업로 42","mailnum":"03135","lat":"37.52948372566151 ","lng":"126.83652691170981 "},'+
	'{"address":"서울시 양천구 신월2동","roadars":"중앙로 55길 45","mailnum":"03135","lat":"37.52617853123727","lng":"126.84428911820243"},'+
	'{"address":"서울시 강북구 삼양동","roadars":"월계로 221","mailnum":"03135","lat":"37.62350713091376","lng":"127.04707769512643"},'+
	'{"address":"인천시 계양구 효성동","roadars":"길마로 92-1","mailnum":"03135","lat":"37.53356596441121","lng":"126.7158811341125"},'+
	'{"address":"서울 강북구 삼양동","roadars":"삼양로 49길 17","mailnum":"03135","lat":"37.62337807747321","lng":"127.01569725816182"},'+
	'{"address":"서울 강북구 삼양동","roadars":"솔샘로 195","mailnum":"03135","lat":"37.62046130189815","lng":"127.01435154182239"},'+
	'{"address":"서울 강북구 삼양동","roadars":"삼양로 19길 141","mailnum":"03135","lat":"37.616454016931684 ","lng":"127.01546643930587"},'+
	'{"address":"서울 강북구 삼양동","roadars":"이현구 18련 141","mailnum":"03135","lat":"37.616206021342414","lng":"127.0170889145271"},'+
	'{"address":"서울시 동작구 대방동","roadars":"대방동1길 46","mailnum":"03135","lat":"37.501333827404935","lng":"126.92226081766789"},'+
	'{"address":"부천시 계안구 신중동","roadars":"신중동1길 46","mailnum":"03135","lat":"37.50511142224995 ","lng":"126.76440712301701 "},'+
	'{"address":"부천시 계안구 신중동","roadars":"신중동1길 46","mailnum":"03135","lat":"37.523362262129304  ","lng":"126.76720614208627  "},'+
	'{"address":"서울시 양천구 목2동","roadars":"오목로 130 306-1","mailnum":"08048","lat":"37.54397349875468","lng":"126.8747702674006"}]}';

	var obj = JSON.parse(Json);
	for(var i = 0; i < obj.awesome.length; i++){
		$(".left_boxs").append("<div class='jsons poi' style='position:relative;width:260px; height:100px;padding:10px 20px;cursor:pointer;border-bottom:1px solid #c1c1c1;'>"+
		"<h1 style='font-size:20px;'>"+obj.awesome[i].address+"</h1>"+
		"<p>"+obj.awesome[i].roadars+"</p>"+
		"<span>"+obj.awesome[i].mailnum+"&nbsp;&nbsp;&nbsp;&nbsp;</span><br>"+
		"X: <span class='lat'>"+obj.awesome[i].lat+"&nbsp;</span><br>"+
		"Y: <span class='lng'>"+obj.awesome[i].lng+"</span>"+
		"</div>");
		
		
	}	
	for(var i = 0; i < 6; i++){
		$(".a,.b").append("<span></span>");
	}
	
	for(var j = 0; j < obj.awesome.length; j++){
		if(j < 6){
			$(".a > span:eq(0)").append("<p class='poi'>"+obj.awesome[j].address+""+"Y: <span class='lat'>"+obj.awesome[j].lat+"</span>"+""+"X: <span class='lng'>"+obj.awesome[j].lng+"</span>"+"</p>");
			$(".b > span:eq(0)").append("<p class='poi'>"+obj.awesome[j].address+""+"Y: <span class='lat'>"+obj.awesome[j].lat+"</span>"+""+"X: <span class='lng'>"+obj.awesome[j].lng+"</span>"+"</p>");
		}else if(j < 12){
			$(".a > span:eq(1)").append("<p class='poi'>"+obj.awesome[j].address+""+"Y: <span class='lat'>"+obj.awesome[j].lat+"</span>"+""+"X: <span class='lng'>"+obj.awesome[j].lng+"</span>"+"</p>");
			$(".b > span:eq(1)").append("<p class='poi'>"+obj.awesome[j].address+""+"Y: <span class='lat'>"+obj.awesome[j].lat+"</span>"+""+"X: <span class='lng'>"+obj.awesome[j].lng+"</span>"+"</p>");
		}else if(j < 18){
			$(".a > span:eq(2)").append("<p class='poi'>"+obj.awesome[j].address+""+"Y: <span class='lat'>"+obj.awesome[j].lat+"</span>"+""+"X: <span class='lng'>"+obj.awesome[j].lng+"</span>"+"</p>");
			$(".b > span:eq(2)").append("<p class='poi'>"+obj.awesome[j].address+""+"Y: <span class='lat'>"+obj.awesome[j].lat+"</span>"+""+"X: <span class='lng'>"+obj.awesome[j].lng+"</span>"+"</p>");
		}else if(j < 24){
			$(".a > span:eq(3)").append("<p class='poi'>"+obj.awesome[j].address+""+"Y: <span class='lat'>"+obj.awesome[j].lat+"</span>"+""+"X: <span class='lng'>"+obj.awesome[j].lng+"</span>"+"</p>");
			$(".b > span:eq(3)").append("<p class='poi'>"+obj.awesome[j].address+""+"Y: <span class='lat'>"+obj.awesome[j].lat+"</span>"+""+"X: <span class='lng'>"+obj.awesome[j].lng+"</span>"+"</p>");
		}else if(j < 30){
			$(".a > span:eq(4)").append("<p class='poi'>"+obj.awesome[j].address+""+"Y: <span class='lat'>"+obj.awesome[j].lat+"</span>"+""+"X: <span class='lng'>"+obj.awesome[j].lng+"</span>"+"</p>");
			$(".b > span:eq(4)").append("<p class='poi'>"+obj.awesome[j].address+""+"Y: <span class='lat'>"+obj.awesome[j].lat+"</span>"+""+"X: <span class='lng'>"+obj.awesome[j].lng+"</span>"+"</p>");
		}else{
			$(".a > span:eq(5)").append("<p class='poi'>"+obj.awesome[j].address+""+"Y: <span class='lat'>"+obj.awesome[j].lat+"</span>"+""+"X: <span class='lng'>"+obj.awesome[j].lng+"</span>"+"</p>");
			$(".b > span:eq(5)").append("<p class='poi'>"+obj.awesome[j].address+""+"Y: <span class='lat'>"+obj.awesome[j].lat+"</span>"+""+"X: <span class='lng'>"+obj.awesome[j].lng+"</span>"+"</p>");
		}
	}
	
	
	$("#searchs").on("keyup", function() {
	    var k = $(this).val();
	    $(".jsons").hide();
	    var temp = $(".jsons > h1:contains('"+k+"')")
	    $(temp).parent().show();
	  });
	
	
	
	
	
	/*                     */
	
	/*                     */
	
	
	
	/*
	var roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
	var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
	var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체
	
	var position = new kakao.maps.LatLng(33.450701, 126.570667);
	
	// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
	roadviewClient.getNearestPanoId(position, 50, function(panoId) {
	    roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
	});
	*/	
	

    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
   
    var options = { //지도를 생성할 때 필요한 기본 옵션
    	center: new kakao.maps.LatLng(37.553836 , 126.969652), //지도의 중심좌표.
    	 level: 5, // 지도의 확대 레벨
	     mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
    };
    var roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
	var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
	var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

	var position = new kakao.maps.LatLng(37.553836, 126.969652);

	// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
	roadviewClient.getNearestPanoId(position, 50, function(panoId) {
	    roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
	});
    var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
    var markerPosition  = new kakao.maps.LatLng(37.553836, 126.969652);
    var tap = 0;	
    
    $(document).on("click",".poi",function(){
    	var lat = $(this).children('.lat').text();
   		var lng = $(this).children('.lng').text();
   		var position = new kakao.maps.LatLng(lat, lng);
   		tap = $(this).index();    
   		function setCenter() {            
   		    // 이동할 위도 경도 위치를 생성합니다 
   		    
   		}
   	  	var moveLatLon = new kakao.maps.LatLng(lat,lng);
   		map.setCenter(moveLatLon);
		console.log(lat,lng)
   		roadviewClient.getNearestPanoId(position, 50, function(panoId) {
   		    roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
   		});
   		$(".poi").eq(tap).addClass('act')
   		$(".poi").not($(this)).removeClass('act')
    });
    
//     $(".poi").click(function () {
    	
   		
// 	})
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
/*    
    var lay = 101;
    $(document).on('keydown',function(e){
    	if(e.keyCode == 38){
    		tap--;
    		if(tap < 0){
    			tap = 0;
    		}
    		$(".jsons").eq(tap+1).removeClass('act')
    		$(".jsons").eq(tap).addClass('act')
    		$(".jsons").css({"top":-lay*tap+"px"})

    		
    	}else if(e.keyCode == 40){
    		tap++;
    		if(tap >= obj.awesome.length-1){
    			tap = obj.awesome.length-1;
    		}
    		$(".jsons").eq(tap-1).removeClass('act')
    		$(".jsons").eq(tap).addClass('act')
    		if(tap > 6){
    			$(".jsons").css({"top":-lay*(tap-6)+"px"})
    		}
    		
    		
    	}else if(e.keyCode == 13){
    		$(".jsons").eq(tap).each(function () {
    			var lat = $(this).children('.lat').text();
           		var lng = $(this).children('.lng').text();
           		    
           		function setCenter() {            
           		    // 이동할 위도 경도 위치를 생성합니다 
           		    
           		}
           	  	var moveLatLon = new kakao.maps.LatLng(lat,lng);
           		map.setCenter(moveLatLon);	
			})
    		
    }

    	console.log(tap)
    	
    })
          
 */   	
    	
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	// 마커를 생성합니다
	for (var i = 0; i < obj.awesome.length; i ++) {
    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    var markerPosition  = new kakao.maps.LatLng(obj.awesome[i].lat, obj.awesome[i].lng); 
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: markerPosition, // 마커를 표시할 위치
	        
	        image : markerImage // 마커 이미지 
	    });
	}
	 
	
   
	
	
	
	
	
    var circle = new kakao.maps.Circle({
        center : new kakao.maps.LatLng(37.553836, 126.969652),  // 원의 중심좌표 입니다 
        radius: 50, // 미터 단위의 원의 반지름입니다 
        strokeWeight: 1, // 선의 두께입니다 
        strokeColor: '#75B8FA', // 선의 색깔입니다
        strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
        strokeStyle: 'solid', // 선의 스타일 입니다
        fillColor: '#CFE7FF', // 채우기 색깔입니다
        fillOpacity: 0.7  // 채우기 불투명도 입니다   
    }); 

    var circle2 = new kakao.maps.Circle({
        center : new kakao.maps.LatLng(37.555886, 126.069652),  // 원의 중심좌표 입니다 
        radius: 200, // 미터 단위의 원의 반지름입니다 
        strokeWeight: 1, // 선의 두께입니다 
        strokeColor: '#fff', // 선의 색깔입니다
        strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
        strokeStyle: 'solid', // 선의 스타일 입니다
        fillColor: '#ff00ff', // 채우기 색깔입니다
        fillOpacity: 0.7  // 채우기 불투명도 입니다   
    });
 
	

	// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomIn() {
	    map.setLevel(map.getLevel() - 1);
	}

	// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomOut() {
	    map.setLevel(map.getLevel() + 1);
	}

	
	
	
	
	
	 circle2.setMap(map); 
	 
	 circle.setMap(map);
	 
	 marker.setMap(map);
	
	// 지도에 클릭 이벤트를 등록합니다
	// 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
		var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
		var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
		var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
		var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
		var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.	 
	// 지도에 마우스무브 이벤트를 등록합니다
	// 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        


		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    
		    // 마커 위치를 클릭한 위치로 옮깁니다
		    marker.setPosition(latlng);
		    
		    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		    message += '경도는 ' + latlng.getLng() + ' 입니다';
		    
		    var resultDiv = document.getElementById('clickLatlng'); 
		    resultDiv.innerHTML = message;
		    
		    

		    // 마우스로 클릭한 위치입니다 
		    var clickPosition = mouseEvent.latLng;

		    // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
		    if (!drawingFlag) {

		        // 상태를 true로, 선이 그리고있는 상태로 변경합니다
		        drawingFlag = true;
		        
		        // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
		        deleteClickLine();
		        
		        // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
		        deleteDistnce();

		        // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
		        deleteCircleDot();
		    
		        // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
		        clickLine = new kakao.maps.Polyline({
		            map: map, // 선을 표시할 지도입니다 
		            path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
		            strokeWeight: 3, // 선의 두께입니다 
		            strokeColor: '#db4040', // 선의 색깔입니다
		            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		            strokeStyle: 'solid' // 선의 스타일입니다
		        });
		        
		        // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
		        moveLine = new kakao.maps.Polyline({
		            strokeWeight: 3, // 선의 두께입니다 
		            strokeColor: '#db4040', // 선의 색깔입니다
		            strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		            strokeStyle: 'solid' // 선의 스타일입니다    
		        });
		    
		        // 클릭한 지점에 대한 정보를 지도에 표시합니다
		        displayCircleDot(clickPosition, 0);

		            
		    } else { // 선이 그려지고 있는 상태이면

		        // 그려지고 있는 선의 좌표 배열을 얻어옵니다
		        var path = clickLine.getPath();

		        // 좌표 배열에 클릭한 위치를 추가합니다
		        path.push(clickPosition);
		        
		        // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
		        clickLine.setPath(path);

		        var distance = Math.round(clickLine.getLength());
		        displayCircleDot(clickPosition, distance);
		    }
		    
		});	
	kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

	    // 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
	    if (drawingFlag){
	        
	        // 마우스 커서의 현재 위치를 얻어옵니다 
	        var mousePosition = mouseEvent.latLng; 

	        // 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
	        var path = clickLine.getPath();
	        
	        // 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
	        var movepath = [path[path.length-1], mousePosition];
	        moveLine.setPath(movepath);    
	        moveLine.setMap(map);
	        
	        var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // 선의 총 거리를 계산합니다
	            content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다
	        
	        // 거리정보를 지도에 표시합니다
	        showDistance(content, mousePosition);   
	    }             
	});                 

	// 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
	// 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
	kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

	    // 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
	    if (drawingFlag) {
	        
	        // 마우스무브로 그려진 선은 지도에서 제거합니다
	        moveLine.setMap(null);
	        moveLine = null;  
	        
	        // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
	        var path = clickLine.getPath();
	    
	        // 선을 구성하는 좌표의 개수가 2개 이상이면
	        if (path.length > 1) {

	            // 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
	            if (dots[dots.length-1].distance) {
	                dots[dots.length-1].distance.setMap(null);
	                dots[dots.length-1].distance = null;    
	            }

	            var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
	                content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
	                
	            // 그려진 선의 거리정보를 지도에 표시합니다
	            showDistance(content, path[path.length-1]);  
	             
	        } else {

	            // 선을 구성하는 좌표의 개수가 1개 이하이면 
	            // 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
	            deleteClickLine();
	            deleteCircleDot(); 
	            deleteDistnce();

	        }
	        
	        // 상태를 false로, 그리지 않고 있는 상태로 변경합니다
	        drawingFlag = false;          
	    }  
	});    

	// 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
	function deleteClickLine() {
	    if (clickLine) {
	        clickLine.setMap(null);    
	        clickLine = null;        
	    }
	}

	// 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
	// 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
	function showDistance(content, position) {
	    
	    if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
	        
	        // 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
	        distanceOverlay.setPosition(position);
	        distanceOverlay.setContent(content);
	        
	    } else { // 커스텀 오버레이가 생성되지 않은 상태이면
	        
	        // 커스텀 오버레이를 생성하고 지도에 표시합니다
	        distanceOverlay = new kakao.maps.CustomOverlay({
	            map: map, // 커스텀오버레이를 표시할 지도입니다
	            content: content,  // 커스텀오버레이에 표시할 내용입니다
	            position: position, // 커스텀오버레이를 표시할 위치입니다.
	            xAnchor: 0,
	            yAnchor: 0,
	            zIndex: 3  
	        });      
	    }
	}

	// 그려지고 있는 선의 총거리 정보와 
	// 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
	function deleteDistnce () {
	    if (distanceOverlay) {
	        distanceOverlay.setMap(null);
	        distanceOverlay = null;
	    }
	}

	// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
	// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
	function displayCircleDot(position, distance) {

	    // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
	    var circleOverlay = new kakao.maps.CustomOverlay({
	        content: '<span class="dot"></span>',
	        position: position,
	        zIndex: 1
	    });

	    // 지도에 표시합니다
	    circleOverlay.setMap(map);

	    if (distance > 0) {
	        // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
	        var distanceOverlay = new kakao.maps.CustomOverlay({
	            content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
	            position: position,
	            yAnchor: 1,
	            zIndex: 2
	        });

	        // 지도에 표시합니다
	        distanceOverlay.setMap(map);
	    }

	    // 배열에 추가합니다
	    dots.push({circle:circleOverlay, distance: distanceOverlay});
	}

	// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
	function deleteCircleDot() {
	    var i;

	    for ( i = 0; i < dots.length; i++ ){
	        if (dots[i].circle) { 
	            dots[i].circle.setMap(null);
	        }

	        if (dots[i].distance) {
	            dots[i].distance.setMap(null);
	        }
	    }

	    dots = [];
	}

	// 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
	// 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
	// HTML Content를 만들어 리턴하는 함수입니다
	function getTimeHTML(distance) {

	    // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
	    var walkkTime = distance / 67 | 0;
	    var walkHour = '', walkMin = '';

	    // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
	    if (walkkTime > 60) {
	        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
	    }
	    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

	    // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
	    var bycicleTime = distance / 227 | 0;
	    var bycicleHour = '', bycicleMin = '';

	    // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
	    if (bycicleTime > 60) {
	        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
	    }
	    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

	    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
	    var content = '<ul class="dotOverlay distanceInfo">';
	    content += '    <li>';
	    content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
	    content += '    </li>';
	    content += '    <li>';
	    content += '        <span class="label">도보</span>' + walkHour + walkMin;
	    content += '    </li>';
	    content += '    <li>';
	    content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
	    content += '    </li>';
	    content += '</ul>'

	    return content;
	}
	
}) 	


    

// 커스텀 오버레이가 표시될 위치입니다 

// 커스텀 오버레이를 지도에 표시합니다

 // 마커가 지도 위에 표시되도록 설정합니다
 // 지도에 교통정보를 표시하도록 지도타입을 추가합니다
 //map.addOverlayMapTypeId(kakao.maps.MapTypeId.TERRAIN);   
//map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);  
//map.addOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW);    



    
    </script>
    
    <!-- key= 뒤에 API 키 입력 -->
  



</body>
</html>
