<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"         uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"      uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring"    uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : egovSampleRegister.jsp
  * @Description : Sample Register 화면
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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <c:set var="registerFlag" value="${empty sampleVO.id ? 'create' : 'modify'}"/>
    <title>
    	 sample view
    </title>
      <style>
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
    
    <!--For Commons Validator Client Side-->
    <script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
    <validator:javascript formName="sampleVO" staticJavascript="false" xhtml="true" cdata="false"/>
    
    <script type="text/javaScript" language="javascript" defer="defer">
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
           	document.detailForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.detailForm.submit();
        }
        
        /* 글 삭제 function */
        function fn_egov_delete() {
           	document.detailForm.action = "<c:url value='/deleteSample.do'/>";
           	document.detailForm.submit();
        }
        
        /* 글 등록 function */
        function fn_egov_save() {
        	frm = document.detailForm;
        	if(!validateSampleVO(frm)){
                return;
            }else{
            	frm.action = "<c:url value="${registerFlag == 'create' ? '/addSample.do' : '/updateSample.do'}"/>";
                frm.submit();
            }
        }
        

    </script>
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">

<form:form commandName="sampleVO" id="detailForm" name="detailForm">
    <div id="content_pop">
    	<!-- 타이틀 -->
    	<div id="title">
    		<ul>
    			<li>
                    <c:if test="${registerFlag == 'modify'}"><form:input style="border:none; font-size:20px; color:#fff; background:rgba(0,0,0,0);" path="id" cssClass="essentiality" maxlength="10" readonly="true" /></c:if>
                </li>
    		</ul>
    	</div>
    	<!-- // 타이틀 -->
    	<div id="table">
    	<div class="name">
    		<c:if test="${registerFlag == 'modify'}"><form:input class="border:none" path="regUser" maxlength="10" cssClass="essentiality" readonly="true" /></c:if>
            <c:if test="${registerFlag != 'modify'}"><form:input class="border:none" path="regUser" maxlength="10" cssClass="txt"  /></c:if>
    	</div>
    		
    		
    		<form:textarea path="description"  rows="5" cols="58" style="overflow:hidden; resize:none; width:680px; height:550px; background:rgba(0,0,0,0);" />&nbsp;<form:errors path="description" />        
            
    	

      </div>

</form:form>
</body>
</html>