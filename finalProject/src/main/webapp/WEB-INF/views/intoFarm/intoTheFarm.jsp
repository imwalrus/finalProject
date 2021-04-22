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
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
		     var classDates = document.getElementsByName("classDates");
		     var into_date = []; //빈 배열 선언
			 	for(i=0; i<classDates.length; i++){
			 		into_date.push(classDates[i].value); 
			 	}
			 	//배열을 string으로 묶어줌(join)
			 	frm.into_date.value=into_date.join(',');
		 	
			$.ajax({
				url:"updateFarm?into_no="+into_no,
				type:"post",
				data: {
						  into_title:$("input[name=into_title]").val(),
						  into_city:$("select[name=into_city]").val(),
						  into_product:$("input[name=into_product]").val(),
						  into_date:$("input[name=classDates]").val(),
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
 	#info{
 		display: block; 
 		margin: 0px auto;
 	}
 	#header{
 		width:200px;
 	}
 	.leftMenu {
	    list-style-type: none;
	    margin: 0;
		width: 230px !important;
	    background-color: #fff;
	    padding: 0;
	}
	.leftMenuBar{
		height:60px !important;
		width: 225px !important;
	}
	.leftMenuBar a {
		height:60px;
	    display: block;
	    color: #000;
	    padding: 15px 16px;
	    text-decoration: none;
	}
	.leftMenuBar a.active {
	    background-color: #78c2ad;
	    color: white;
	}
	.leftMenuBar a:hover:not(.active) {
	    background-color: #78c2ad59;
	    color: white;
	}
	.leftMenuDiv{
	    display: block;
	    z-index: 1028;
	    position: fixed;
	    box-shadow: 0 2px 10px -1px rgb(69 90 100 / 30%);
	    transition: all 0.3s ease-in-out;
	    width: 230px;
	    height: calc(100%);
	    margin-top: 50px;
	    border-radius: 0 6px 0 0;
	    top: 50px;
	    background: #fff;
	    color: #97a7c1;
	}
	.leftMenuDiv .leftMenuHeader{
		position: relative;
	    padding-top: 20px;
	    height: 116px;
	    text-align: center;
	}
	label{
		font-weight:border;
	}
	.searchInfoFarmDiv{
		border: 3px solid #dee2e6;
		padding:30px;
		border-radius:20px;
		width:900px;
}
</style>
</head>
<body class="goto-here">

	<!--농촌속으로 리스트  -->
	<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
	
	<div style="width: 60%; margin: auto;">
		<!--검색바  -->
		<div class="searchInfoFarmDiv" style="margin-left:2%">
		  <form id="getSearchFm" name="getSearchFm" action="getFarmList">
			<input type="hidden" name="page" value="1">
			  <legend style="font-weight: bold;">Search</legend>
			  <div class="form-group" style="display: inline-block;">
			      <label for="into_city">지역</label>
			      <input type="text" class="form-control" name="into_city" id="into_city" value="${intoTheFarmVO.into_city}" style="width:400px; !important;">
			  </div>
			  <div class="form-group" style="display: inline-block;">
			      <label for="into_city">농작물 종류</label>
			      <input type="text" class="form-control" name="into_product"  id="into_product" value="${intoTheFarmVO.into_product}" style="width:400px !important;">
			  </div>
			  <div class="form-group">
				    <label for="into_city">검색 기간</label>
				    <br>
				    <input type="date" class="form-control" name="s_date" id="s_date" value="${intoTheFarmVO.into_date}" style="width:400px !important; display: inline-block;"> - 
					<input type="date" class="form-control" name="e_date" id="e_date" value="${intoTheFarmVO.into_date}" style="width:400px !important; display: inline-block;">
			  </div>
			<button class="btn btn-warning" style="margin-left: 45%">검색</button>
		   </form>
		 </div> 
		 <!--검색바 끝-->	
		 <br><br>
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
</section> 	
		
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

<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 		
</body>
</html>