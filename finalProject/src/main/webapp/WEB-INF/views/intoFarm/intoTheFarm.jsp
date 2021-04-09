<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>청년농장</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<!-- include summernote-ko-KR -->
<script src="./resources/gotoFarm/js/summernote-ko-KR.js"></script>

<!--이미지 슬라이드-->
 <link rel="stylesheet" type="text/css" href="slick/slick.css"/>
 <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
<script>
 function cgsummernote(){
	 $('#summernote')
		.summernote(
				{
					height : 300,
					minHeight : null,
					maxHeight : null,
					/* focus: true,  */
					lang : 'ko-KR',
					toolbar : [
							// [groupName, [list of button]]
							[ 'fontname', [ 'fontname' ] ],
							[ 'fontsize', [ 'fontsize' ] ],
							[ 'style',[ 'bold', 'italic', 'underline','strikethrough', 'clear' ] ],
							[ 'color', [ 'forecolor', 'color' ] ],
							[ 'table', [ 'table' ] ],
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							[ 'height', [ 'height' ] ],
							[ 'insert', [ 'picture', 'link', 'video' ] ],
							[ 'view', [ 'fullscreen', 'help' ] ] ],
					fontNames : [ 'Arial', 'Arial Black','Comic Sans MS', 'Courier New', '맑은 고딕','궁서', '굴림체', '굴림', '돋움체', '바탕체' ],
					fontSizes : [ '8', '9', '10', '11', '12', '14','16', '18', '20', '22', '24', '28', '30','36', '50', '72' ]
				});
 }
		
</script>  
<script>
			/*페이징 값 넣기*/
			$(document).ready(function(){
				$("#into_city").val($(this).val());
				$("#into_product").val($(this).val());
				$("#into_date").val($(this).val());
			});	
			
			/*페이징*/
	         function goPage(p) {
				getSearchFm.page.value=p;
				getSearchFm.submit(); 
			    } 
			
		
		/*모달-상세보기*/
		function fngetSearchInfo(str) { //into_no 가지고 보냄
			$('#myLargeModal .modal-body').load("getSearchFarm?into_no="+str);
				$('#myLargeModal').modal('show');
				$('#myUpdate').modal('hide'); 
		}	
		
		function fnUpdate(str1){
					 	$('#myUpdate .modal-body').load("updateFarm?into_no="+str1,cgsummernote);
						$('#myLargeModal').modal('hide');
						$('#myUpdate').modal('show');
				}
		
		/*모달-수정*/
		 function goupdate(str2){
		     var into_no = $("input[name=into_no]").val();
		     
			$.ajax({
				url:"updateFarm?into_no="+into_no,
				type:"post",
				data: {
						  into_title:$("input[name=into_title]").val(),
						  into_city:$("select[name=into_city]").val(),
						  into_product:$("input[name=into_product]").val(),
						  into_date:$("input[name=into_date]").val(),
						  into_entry:$("input[name=into_entry]").val(),
						  into_info:$("textarea[name=into_info]").val(),
						  into_phone:$("input[name=into_phone]").val(),
						  into_filename:$("input[name=into_filename]").val()
						 },

				success:function(response){
					console.log("result:"+response);
					 if(response != null){
						alert("수정 완료");
						location.reload();
					} 
				}
			})
		 }  
		
		/*모달-삭제*/
		 function fnDelete(str3){
			var into_no = $("input[name=into_no]").val();
			
			$.ajax({
				url:"deleteFarm?into_no="+into_no,
				type:"post",
				success:function(response){
					console.log("result:"+response);
					if(response != null){
						alert("삭제 완료");
						location.reload();
					}
				}
		})
	} 
		 /*이미지 슬라이드 */
		 var slideIndex = 0;
			 showSlides();
			
			function showSlides() {
			    var i;
			    var slides = document.getElementsByClassName("mySlides");
			    var dots = document.getElementsByClassName("dot");
			    for (i = 0; i < slides.length; i++) {
			       slides[i].style.display = "none";  
			    }
			    slideIndex++;
			    if (slideIndex > slides.length) {slideIndex = 1}    
			    for (i = 0; i < dots.length; i++) {
			        dots[i].className = dots[i].className.replace(" active", "");
			    }
			    slides[slideIndex-1].style.display = "block";  
			    dots[slideIndex-1].className += " active";
			    setTimeout(showSlides, 2000); // Change image every 2 seconds
			}
					 
</script>


<style>
.modal.modal-center {
  text-align: center;
}

* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

</style>
</head>
<body class="goto-here">

	<!--농촌속으로 리스트  -->
	<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
	
		<!--검색바  -->
		
		<div style="width: 60%; margin: auto;">
		  <form id="getSearchFm" name="getSearchFm" action="getFarmList">
			<input type="hidden" name="page" value="1">
			지역 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="into_city" id="into_city" value="${intoTheFarmVO.into_city}" style="margin-top: 1%;"><br>
			농작물 종류 &nbsp; <input name="into_product" id="into_product" value="${intoTheFarmVO.into_product}" style="margin-top: 1%;"><br>
			기간 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="date" name="s_date" id="s_date" value="${intoTheFarmVO.into_date}" style="margin-top: 1%;"> ~ 
				<input type="date" name="e_date" id="e_date" value="${intoTheFarmVO.into_date}" style="margin-top: 1%;">
				<br>
			<button>검색</button>
		   </form>	
			
	 <div class="container">
		<div class="row">
		<c:if test="${empty list}">
			검색 결과가 없습니다.
		<div style="margin-right:150px;">
			<button type="button" onclick="location.href='getFarmList?page=1'" >목록보기</button>
		</div>	
		</c:if>
		
			<c:forEach items="${list}" var="listt">
				<div class="col-6">
					<div class="card">
						<div class="card-header">${listt.into_title}</div>
						<div class="card-body">
							
								<span></span><span class="text">지역 : ${listt.into_city}</span><br>
								<span></span><span class="text">농작물 : ${listt.into_product}</span><br>
								<span></span><span class="text">기간 : ${listt.into_date}</span><br>
								<span></span><span class="text">모집 인원 수&남은 인원 수 : ${listt.into_entry}</span><br><br>
								<a href="#" onclick="fngetSearchInfo('${listt.into_no}')" class="btn btn-primary" data-toggle="modal" data-target="#myLargeModal">
								<span></span><span class="text">상세보기</span></a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	   <my:paging paging="${paging}" jsFunc="goPage" />  
	   	
		
	</div>
	
	<!--이미지 슬라이드 -->
	<div class="slideshow-container">
			<c:forEach items="${list}" var="images">
				<div class="mySlides fade">
				  <div class="numbertext">1 / 3</div>
				  	<img src="${images.into_filename}" style="width:100%">
				  <div class="text">Caption One</div>
				</div>
			</c:forEach>
		
		
		<!-- <div class="mySlides fade">
		  <div class="numbertext">2 / 3</div>
		  <img src="http://placehold.it/300x100" style="width:100%">
		  <div class="text">Caption Two</div>
		</div>
		
		<div class="mySlides fade">
		  <div class="numbertext">3 / 3</div>
		  <img src="http://placehold.it/300x100" style="width:100%">
		  <div class="text">Caption Three</div>
		</div> -->
		
		</div>
		<br>
		
		<div style="text-align:center">
		  <span class="dot"></span> 
		</div>
	</section>
	<!--모달 상세보기 -->
	
	<div class="modal fade" id="myLargeModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<!-- <div class="modal-dialog modal-lg" role="document"> -->
		<!-- <div class="modal-dialog modal-dialog-centered"> -->
		<div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">상세보기</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
				</div>
				<div class="modal-body"></div> <!--내용 append -->
				
					<!--농업인& 관리자 수정-->
				</div>
			</div>
		</div>
	
	
	<!--모달 수정화면 -->
	<!--  -->
	<div style="overflow: scroll; " class="modal fade" id="myUpdate" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">수정하기</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
				</div>
				<div class="modal-body"></div> <!--내용 append -->
			</div>
		</div>
	</div>
	
 <!--이미지 슬라이드 -->
 <script type="text/javascript" src="slick/slick.min.js"></script>
 		
</body>
</html>