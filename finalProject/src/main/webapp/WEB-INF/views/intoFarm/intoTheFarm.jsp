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
	
	   /*모달-신청하기 모달열기 */	
		function fndoapply(){
			$('#myReqModal .nav nav-tabs').on('show.bs.tab',function (e) {
				 e.target // newly activated tab
				 e.relatedTarget // previous active tab
				 $('#myTab a:first ').tab('show') // Select first tab
				});
		}
	   /*모달-개인신청*/
	    function fnpersonalapply(str5){
	    	var yn = confirm("신청하시겠니까?");
	    	if(yn) {
	    		applyReqFrm.action = "insertReqFarm";
	    		applyReqFrm.submit();
			} else {
				alert("취소 되었습니다.");
			}
	    		
	    	}
		   
		/*모달-체험종료  */ 
		function fndoexit(str4){
			var yn = confirm("체험을 종료하시겠습니까?");
			if (yn) {
				$.ajax({
					url:"updateFarmExit?into_no="+str4,
					type:"post",
					data: str4,
					success:function(response){
						console.log("result:"+response);
						}  
					})
			} else {
				alert("취소 되었습니다.");
			}
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
			    /* slides[slideIndex-1].style.display = "block"; */  
			    /* dots[slideIndex-1].className += " active"; */
			    setTimeout(showSlides, 2000); // Change image every 2 seconds
			}
			
		/* 모달 - 문의하기 */
		function fnInquiry(no,title){
			$('#myInquiry .modal-body').load("insertFarmInq?into_no="+no+"&into_title="+title);
			$('#myLargeModal').modal('hide');
			$('#myInquiry').modal('show');
		}
					 
</script>


<style>
.modal.modal-center {
  text-align: center;
}

/*이미지 슬라이드  */
.slider{
    width: 340px;
    height: 509px;
    position: relative;
    margin: 0 auto;
}
.slider input[type=radio]{
    display: none;
}
ul.imgs{
    padding: 0;
    margin: 0;
}
ul.imgs li{
    position: absolute; /* 슬라이드가 겹쳐서 모여야 하므로 absolute 속성으로 배치 */
    opacity: 0; /* 체크한 라디오박스 순서의 슬라이드만 표시되도록 기본 투명도 설정 */
    list-style: none;
    padding: 0;
    margin: 0;
}
.bullets{
    position: absolute;
    left: 50%; /* 가로로 가운데 정렬 */
    transform: translateX(-50%);
    bottom: 20px; /* 슬라이드 밑에서 20px 간격 띄움 */
    z-index: 2; /* 슬라이드 위에 보이도록 레이어 순위를 높임 */
}
.bullets label{
    display: inline-block; /* 한 줄로 불릿 나열*/
    border-radius: 50%; /* 원형 불릿으로 처리 */
    background-color: rgba(0,0,0,0.55);
    width: 20px; /* 불릿 너비 */
    height: 20px; /* 불릿 높이 */
    cursor: pointer;
}
.slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(4):checked~.bullets>label:nth-child(4){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1){
    opacity: 1;
    transition: 1s;
    z-index: 1;
}
.slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2){
    opacity: 1;
    transition: 1s;
    z-index: 1;
}
.slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3){
    opacity: 1;
    transition: 1s;
    z-index: 1;
}
.slider input[type=radio]:nth-child(4):checked~ul.imgs>li:nth-child(4){
    opacity: 1;
    transition: 1s;
    z-index: 1;
}
ul.imgs li{
    position: absolute;
    opacity: 0;
    list-style: none;
    padding: 0;
    margin: 0;
    transition-delay: 0.9s; /* 트랜지션 지연 시간 지정 */
}
/*모달  */
.modal-dialog.modal-fullsize {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}
.modal-content.modal-fullsize {
  height: auto;
  min-height: 100%;
  border-radius: 0; 
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
	<form id="doExit" name="doExit" action="updateFarmExit">		
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
						<div class="card-body" id="allList">
								<input type="hidden" id="into_progress" value="${intoTheFarmVO.into_progress}">
								<span></span><span class="text" id="into_city">지역 : ${listt.into_city}</span><br>
								<span></span><span class="text" id="into_product">농작물 : ${listt.into_product}</span><br>
								<span></span><span class="text" id="into_date">기간 : ${listt.into_date}</span><br>
								<span></span><span class="text" id="into_entry">모집 인원 수&남은 인원 수 : ${listt.into_entry}</span><br><br>
								<a href="#" onclick="fngetSearchInfo('${listt.into_no}')" class="btn btn-primary" data-toggle="modal" data-target="#myLargeModal">
								<span></span><span class="text">상세보기</span></a>
								<a href="#" onclick="fndoexit('${listt.into_no}')" class="btn btn-primary">
								<span></span><span class="text">종료</span></a>
								<a href="#" onclick="fndoapply()" class="btn btn-primary" data-toggle="modal" data-target="#myReqModal">
								<span></span><span class="text">신청하기</span></a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	   <my:paging paging="${paging}" jsFunc="goPage" />  
	</form>   	
		
	</div>
	
		
	<!--모달 상세보기 -->
	
	<div class="modal fade" id="myLargeModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">상세보기</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
				</div>
				<div class="modal-body"></div> <!--내용 append -->
				
				</div>
			</div>
		</div>
	
	<!--모달 신청하기  -->
		<div class="modal fade" id="myReqModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl" role="document">
				<div class="modal-content">
				<nav>
					<div class="modal-header">
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
					</div>
					<div class="nav nav-tabs" role="tablist">
						<a class="nav-item nav-link btn btn-danger active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">개인</a> 
						<a class="nav-item nav-link btn btn-danger" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">단체</a>
					</div>
				</nav>

				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
						<div class="row">
							<div class="modal-body">
								<form id="applyReqFrm" method="post" action="insertReqFarm" >
									<table class="table table-hover">
										<thead class="text-center">
											<tr class="content">
												<th class="text-left">회원 아이디 : <input type="text" style="border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" id="user_id" name="user_id" value="${uservo.user_id}" readonly >
												<input type="hidden" value="${reqSearchList.into_req_num}" name="into_req_num">
												<input type="hidden" value="${reqSearchList.into_no}" name="into_no">
												</th>
											</tr>
											<tr class="content">
												<th class="text-left">이름 : <input type="text" style="border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" id="user_name" name="user_name" value="${uservo.user_name}" readonly></th>
											</tr>
											<tr class="content">
												<th class="text-left">연락처 : <input type="text" style="border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" id="into_req_phone" name="into_req_phone" value="${uservo.user_phone}" readonly></th>
											</tr>
											<!--보상선택  -->
											<tr class="content">  
												<th class="text-left">
												  보상선택:
													  <input type="radio" id="product" name="req_reward" value="작물" checked>
														  <label for="product">작물</label>
													  <input type="radio" id="cash" name="req_reward" value="현금">
														  <label for="cash">현금</label>
													  <input type="radio" id="valtime" name="req_reward" value="봉사시간">
														  <label for="valtime">봉사시간</label>
												</th>		  
											</tr>
											<tr class="content">
												<th class="text-left"><input type="text" style="border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" id="into_req_phone" name="into_req_phone" value="${reqSearchList.into_req_date}" readonly></th>
											</tr>
										</thead>
										
									</table>
									<div class="modal-footer">
										<button class="btn btn-primary" type="reset" data-dismiss="modal">취소</button>
										<button class="btn btn-primary" type="button" onclick="fnpersonalapply('${intoFarmReqVO.into_req_num}')">신청</button>
									</div>	
									</form>
							</div>
						</div>	
					</div>

					<div class="tab-pane fade" id="nav-profile" role="tabpanel"
						aria-labelledby="nav-profile-tab">
						<div class="row">
							<div class="modal-body">
								<img width="100%"
									src="https://media.wired.com/photos/5c1ae77ae91b067f6d57dec0/master/pass/Comparison-City-MAIN-ART.jpg"
									alt="">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>

		<!--모달 수정화면 -->
	<div style="overflow: scroll; " class="modal fade" id="myUpdate" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" style="max-width: 100%; width: auto; display: table;">
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
	
		<!--모달 문의화면 -->
	<div style="overflow: scroll; " class="modal fade" id="myInquiry" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="max-width: 100%; width: 1000px;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">농촌속으로 문의하기</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
				</div>
				<div class="modal-body"></div> <!--내용 append -->
			</div>
		</div>
	</div>

         
 <!--이미지 슬라이드 -->
	<div class="slider">
	    <input type="radio" name="slide" id="slide1" checked>
	    <input type="radio" name="slide" id="slide2">
	    <input type="radio" name="slide" id="slide3">
	    <input type="radio" name="slide" id="slide4">
	    <ul id="imgholder" class="imgs">
	        <li><img src="images/"></li>
	        <li><img src="image/a.jpg"></li>
	        <li><img src="image/b.jpg"></li>
	        <li><img src="image/b.jpg"></li>
	    </ul>
	    <div class="bullets">
	        <label for="slide1">&nbsp;</label>
	        <label for="slide2">&nbsp;</label>
	        <label for="slide3">&nbsp;</label>
	        <label for="slide4">&nbsp;</label>
	    </div>
	</div>
 <!--end of 이미지  -->
 		
</body>
</html>