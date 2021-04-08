<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>청년농장</title>

<link href="http://api.nongsaro.go.kr/css/api.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://api.nongsaro.go.kr/js/framework.js"></script>	
<script type="text/javascript" src="http://api.nongsaro.go.kr/js/openapi_nongsaro.js"></script>
	
<script type="text/javascript">
nongsaroOpenApiRequest.apiKey = "202104051O622XQYJUSXVTUNGUZ75Q";//변경할 부분 1
nongsaroOpenApiRequest.serviceName = "agriTechVideo";
nongsaroOpenApiRequest.operationName = "insttList";
nongsaroOpenApiRequest.htmlArea="nongsaroApiLoadingAreaInstt";
nongsaroOpenApiRequest.operationName1 = "mainCategoryList";
nongsaroOpenApiRequest.htmlArea1="nongsaroApiLoadingArea";
nongsaroOpenApiRequest.operationName2 = "subCategoryList";
nongsaroOpenApiRequest.htmlArea2="nongsaroApiLoadingArea1";
nongsaroOpenApiRequest.callback = "ajax_local_callback";//변경할 부분 2
</script>
</head>
<body class="goto-here">
   <div class="hero-wrap hero-bread" style="background-image: url('resources/main/images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>About us</span></p>
            <h1 class="mb-0 bread">About us</h1>
          </div>
        </div>
      </div>
    </div>
   
    
     <section class="ftco-section testimony-section">
     <div id="nongsaroApiLoadingAreaInstt"></div><!-- 기관명 목록 HTML 로딩 영역 -->
     <div id="nongsaroApiLoadingArea"></div><!-- 메인카테고리 HTML 로딩 영역 -->
     <div id="nongsaroApiLoadingArea1"></div><!-- 서브카테고리 HTML 로딩 영역 -->
     <div id="nongsaroApiLoadingArea2"></div><!-- 농업기술동영상 HTML 로딩 영역 -->
    </section>
</body>
</html>