<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
 input{
 	border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;  /* 테두리 없애기 */
 }
 button{
  margin: 0;
  padding: 0;
  background: none;
  border: none;
  border-radius: 0;
  outline: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}
.slider-for{
	width:800px !important; 
	height:550px;
}
.slider-nav{
	width: 800px; 
	height: 200px !important;
}
.slide-arrow{
  position: absolute;
  top: 50%;
  margin-top: -15px;
}
.prev-arrow{
  left: -40px;
  width: 0;
  height: 0;
  border-left: 0 solid transparent;
  border-right: 15px solid #113463;
  border-top: 10px solid transparent;
  border-bottom: 10px solid transparent;
}
.next-arrow{
  right: -40px;
  width: 0;
  height: 0;
  border-right: 0 solid transparent;
  border-left: 15px solid #113463;
  border-top: 10px solid transparent;
  border-bottom: 10px solid transparent;
}
.content > th {
	width:15%;
	border-bottom-width: 1px !important; 
	font-weight:bold;
}
.content > td {
	width:85%;
	text-align:left;
	padding-left:15px;
}
</style>

<body>
	<input type="hidden" value="${getlist.into_no}" name="into_no">
	<input type="hidden" value="${getlist.into_title}" name="into_title">
<table class="table table-hover">
	<thead class="text-center">
		<tr class="content">
			<th class="text-center">체험명</th>
			<td>${getlist.into_title}</td>
		</tr>
		<tr class="content">
			<th class="text-center">체험기간</th>
			<td>${getlist.into_date}</td>
		</tr>
		<tr class="content">
			<th class="text-center">상세주소</th>
			<td>${getlist.into_detailadr}</td>
		</tr>
		<tr class="content">
			<th class="text-center">모집 인원 수 </th> 
			<td>${getlist.into_entry}</td>
		</tr>
		<tr class="content">
			<th class="text-center" style="vertical-align:top">체험 내용</th>
			<td>${getlist.into_info}</td>
		</tr>
		<tr class="content">
			<th class="text-center">문의 전화번호</th>
			<td>${getlist.into_phone}</td>
		</tr>
		
	</thead>
</table>

<div class="sliderDiv" align="center">
	<div class="slider slider-for">
		<c:forEach items="${images}" var="image" >
		<div  style="width:800px ; height:550px;" >
			<img src="resources/images/intofarm/${image}" style="width:100%; height:100%"/> 
		</div>		
		</c:forEach>
	</div>
	<div class="slider slider-nav">
		<c:forEach items="${images}" var="image">
			<div style="width:200px; height:150px">
				<img src="resources/images/intofarm/${image}" style="width:100%; height:100%"/>
			</div>
		</c:forEach>
	</div>
</div>	
<div class="modal-footer">
	<!-- 버튼 => 작성자가 본인일시 수정, 삭제 버튼 / 아니면 취소 문의하기 버튼 -->
	<c:if test="${getlist.user_id != user_id}">
		<button class="btn btn-primary" type="button" data-dismiss="modal">취소</button>
		<button class="btn btn-primary" type="button" data-bs-target="#myInquiry" data-dismiss="modal" onclick="fnInquiry()">문의하기</button>
	</c:if>
	<c:if test="${getlist.user_id == user_id}">
		<button class="btn btn-primary" type="button" data-bs-target="#myUpdate" data-bs-toggle="modal" data-bs-dismiss="modal"  onclick="fnUpdate('${getlist.into_no}')">수정</button>
		<button class="btn btn-primary" type="button" onclick="fnDelete('${getlist.into_no}')">삭제</button>
	</c:if>
</div>	


<script>
	$('.slider-for').slick({
		  slidesToShow: 1,
		  slidesToScroll: 1,
		  arrows: false,
		  fade: false,
		  variableWidth:true,
		  asNavFor: '.slider-nav'
		});
		
		$('.slider-nav').slick({
		  slide:"div",
		  slidesToShow: 2,
		  slidesToScroll: 1,
		  asNavFor: '.slider-for',
		  centerMode: true,
		  focusOnSelect: true,
		  variableWidth:true,
		  speed: 1000,
		  prevArrow: '<button class="slide-arrow prev-arrow"></button>',
		  nextArrow: '<button class="slide-arrow next-arrow"></button>'
		});
</script>
</body>