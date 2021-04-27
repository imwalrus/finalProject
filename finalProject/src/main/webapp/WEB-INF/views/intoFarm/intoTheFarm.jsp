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
		function fndoapply(intoNo,remain,into_date){
			$("#into_req_remain").val(remain);
			$("#into_no").val(intoNo);
			var apply_into_req_date=$("#into_req_date").val(into_date);
			var apply_into_req_date2=$("#into_req_date1").val(into_date);
			
			if(remain == 0){
				alert("신청인원이 초과되었습니다.")
			}else{
				$('#myReqModal').modal('show');
				$('#myReqModal .nav nav-tabs').on('show.bs.tab',function (e) {
					 e.target // newly activated tab
					 e.relatedTarget // previous active tab
					 $('#myTab a:first ').tab('show') // Select first tab
					});
				
				//개인신청 시 날짜 input:radio생성
				var a=$("#into_req_date").val()
				var b=a.split(",");
				   for(i=0; i<b.length; i++){ 
					var c= $("th#dateTh").append(
							"<input type='radio' name='selectdate' checked value='"+b[i]+"'></input>"+b[i]+"&nbsp;&nbsp;&nbsp;")
				 	 }
						   $("#dateTr").append(c);
						   $("input[name='selectdate']").empty();  
				    
				
				//그룹신청 시 날짜 input:radio생성
				var d=$("#into_req_date1").val()
				var e=d.split(",")
				for(i=0; i<e.length; i++){ 
				var f= $("th#dateTh1").append(
						"<input type='radio' name='selectdate1' checked value='"+e[i]+"'></input>"+e[i]+"&nbsp;&nbsp;&nbsp;")
						$("#dateTr1").append(f)
				}
					
			}
		}
	   /*모달-개인신청*/
	    function fnpersonalapply(){
	    	var frm=document.getElementById("applyPersonFrm");
	    	var into_req_date=frm.into_req_date.value;
	    		
	    	var yn = confirm("신청하시겠습니까?");
	    	if(yn) {
	    		$.ajax({
					url:"insertReqFarm",
					type:"post",
					data: {user_id:$("input[name=user_id]").val(),
					       user_name:$("input[name=user_name]").val(),
					       into_req_phone:$("input[name=into_req_phone]").val(),
					       into_req_reward:$('input[name="into_req_reward"]:checked').val(),
					       into_req_date:$('input[name="selectdate"]:checked').val(),
					       into_no:$("#into_no").val()
					},
					success:function(response){
						console.log("result:"+response);
						location.href="myIntoList";
						
						}  
					})
			} else {
				alert("취소 되었습니다.");
			}
	    	$('#myReqModal').modal('hide');
	    }
	   
	    /*단체신청-항목추가버튼 */
	    $(document).ready(function(){
	    	$("#groupForm").on("click",".addReq",function(){
	 		    var add = $("#groupForm tr:last").attr("class");
	 		    var new_user_name = $("#groupForm tr:eq(2)").clone();
	 		    new_user_name.find("input#user_name").attr("readonly",false);
	 		    new_user_name.find("input#user_name").attr("value",'');
	 		    new_user_name.find("input#user_name").attr("id","new_user_name");
	 		    new_user_name.find("input#user_name").attr("name","new_user_name");
	 		    new_user_name.find("input#user_name").attr("required",true);
	 		    $("#groupForm").append(new_user_name);
	 		    
	 		    var add1 = $("#groupForm tr:last").attr("class");
	 		    var new_into_req_phone = $("#groupForm tr:eq(3)").clone();
	 		    new_into_req_phone.find("input#into_req_phone").attr("readonly",false);
	 		    new_into_req_phone.find("input#into_req_phone").attr("value",'');
	 		    new_into_req_phone.find("input#into_req_phone").attr("id","new_into_req_phone");
	 		    new_into_req_phone.find("input#into_req_phone").attr("name","new_into_req_phone");
	 		    new_into_req_phone.find("input#into_req_phone").attr("required",true);
	 		    $("#groupForm").append(new_into_req_phone);
	 		    $("#groupForm").append('<hr style="margin-top:3px;">');
	 		                   
	 		    
	 	   });	
	    });
		   
	    /*모달-단체신청 */
	    function fnGroupapply(){
	    	var frm=document.getElementById("applyGroupFrm");
	    	var into_req_date=frm.into_req_date1.value;
	    	
	    	var into_register=frm.into_register.value;
	    	var new_user_name=$("input#new_user_name").val();
	    	var new_into_req_phone=$("input#new_into_req_phone").val();
	    	
	    	if (into_req_date1== ''){
	    		alert("날짜를 선택해주세요");
	    		return false;
	    	}
	    	if (into_register == ''){
	    		alert("인원수를 입력해주세요");
	    		return false;
	    	}
	    	 if (new_user_name == ''){
	    		alert("이름을 입력해주세요");
	    		return false;
	    	}
	    	if (new_into_req_phone == ''){
	    		alert("전화번호를 입력해주세요");
	    		return false;
	    	} 
	    	
	        var new_user_name1 = $('input[name=new_user_name]');
	    	var value='';
			
	    	for(var i=1; i<new_user_name1.length; i++){
	    	    value = $(new_user_name1[i]).val();
	    	    if(value[i] == null){
	    	      alert("이름을 입력하세요");
	    	      return false;
	    	    }
	    	  }
	    	
	    	var new_into_req_phone1 = $('input[name=new_into_req_phone]');
	    	var value1='';
	    	
	    	for(var i=1; i<new_into_req_phone1.length; i++){
	    		value1 = $(new_into_req_phone1[i]).val();
	    	    if(value1[i] == null){
	    	      alert("전화번호를 입력하세요"); 
	    	      return false;
	    	    }
	    	  } 
	    	
	    	var yn = confirm("신청하시겠습니까?");
	    	if(yn) {
	    		$.ajax({
					url:"insertGroupFarm",
					type:"post",
					data: {user_id:$("input[name=user_id]").val(),
					       user_name:$("input[name=user_name]").val(),
					       into_req_phone:$("input[name=into_req_phone]").val(),
					       into_req_reward:$('input[name="into_req_reward"]:checked').val(),
					       into_req_date:$("input[name='selectdate1']:checked").val(),
					       into_req_register:$("input[name=into_register]").val(),
					       into_no:$("#into_no").val()
					},
					success:function(response){
						console.log("result:"+response);
						location.href="myIntoList";
						
						}  
					})
	    	}else{
	    		alert("취소 되었습니다.");
	    	}
	    	$('#myReqModal').modal('hide');
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
			$('#myLargeModal').modal('hide');
		     var into_no = $("input[name=into_no]").val();
		     /* var into_product = document.getElementById("into_product"); */
		     var classDates = document.getElementsByName("classDates");
		     var into_date = []; //빈 배열 선언
		     var frm = document.getElementById("#updatefrm");
			 	for(i=0; i<classDates.length; i++){
			 		into_date.push(classDates[i].value); 
			 	}
			 	//배열을 string으로 묶어줌(join)
			 	 into_date.value=into_date.join(','); 
		 	
			$.ajax({
				url:"updateFarm?into_no="+into_no,
				type:"post",
				data: {
						  into_title:$("#myUpdate input[name=into_title]").val(),
						  into_city:$("select[name=into_city]").val(),
						  into_product:$("#myUpdate input[name=into_product]").val(), 
						  into_date:into_date,
						  into_entry:$("input[name=into_entry]").val(),
						  into_info:$("textarea[name=into_info]").val(),
						  into_phone:$("input[name=into_phone]").val()
						 /*  into_filename:$("input[name=into_filename]").val() */
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
			var into_req_remain=parseInt($("#into_req_remain").text());
			var into_entry=parseInt($("#into_entry").text());
			var into_no = $("input[name=into_no]").val();
		if(into_req_remain == into_entry ){
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
		} else {
			alert("삭제가 불가능합니다.");
		}		
		 
	} 
			
		/* 모달 - 문의하기 */
		function fnInquiry(){
			var into_no = $("input[name=into_no]").val();
			$('#myInquiry .modal-body').load("insertFarmInq?into_no="+into_no);
			$('#myLargeModal').modal('hide');
			$('#myInquiry').modal('show');
		}		 
		
		$(document).ready(function(){
			$("#myReqModal").on('hidden.bs.modal', function (e) {
				var event = e.target;
				window.location.reload();
		});  
		})
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

	label{
		font-weight:border;
	}
	.searchInfoFarmDiv{
		border: 3px solid #dee2e6;
		padding:30px;
		border-radius:20px;
		width:900px;
	}
	#btn{
	padding:10px;
}
/*input */
input{
 	border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;  /* 테두리 없애기 */
 }	
</style>
</head>
<body class="goto-here">

	<!--농촌속으로 리스트  -->
	<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
	
	<div style="width: 60%; margin: auto;">
		<!--검색바  -->
		<div class="searchInfoFarmDiv" style="margin-left:11%">
		  <form id="getSearchFm" name="getSearchFm" action="getFarmList">
			<input type="hidden" name="page" value="1">
			  <legend style="font-weight: bold;">Search</legend>
			  <div class="form-group" style="display: inline-block;">
			      <label for="into_city">지역</label>
			      <input type="text" class="form-control" name="into_city" id="into_city" value="${intoTheFarmVO.into_city}" style="width:400px; !important;">
			  </div>&nbsp;&nbsp;
			  <div class="form-group" style="display: inline-block;">
			      <label for="into_city">농작물 종류</label>
			      <input type="text" class="form-control" name="into_product"  id="into_product" value="${intoTheFarmVO.into_product}" style="width:400px !important;">
			  </div>
			  <div class="form-group">
				    <label for="into_city">검색 기간</label>
				    <br>
				    <input type="date" class="form-control" name="s_date" id="s_date" value="${intoTheFarmVO.s_date}" style="width:400px !important; display: inline-block;"> - 
					<input type="date" class="form-control" name="e_date" id="e_date" value="${intoTheFarmVO.e_date}" style="width:400px !important; display: inline-block;">
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
								<input type="hidden" name="into_progress" value="${intoTheFarmVO.into_progress}">
								<span>지역 :</span><span class="text" id="into_city"> ${listt.into_city}</span><br>
								<span>상세 주소 :</span><span class="text" id="into_detailadr"> ${listt.into_detailadr}</span><br>
								<span>농작물 :</span><span class="text" id="into_product"> ${listt.into_product}</span><br>
								<span>체험 기간 :</span><span class="text" id="into_date"> ${listt.into_date}</span><br>
								<span>모집 인원 수:</span><span class="text" id="into_entry"> ${listt.into_entry}</span><br>
								<span>남은 인원 수:</span><span class="text" id="into_req_remain"> ${listt.into_req_remain}</span><br><br>
								<a href="#" onclick="fngetSearchInfo('${listt.into_no}')" class="btn btn-primary" data-toggle="modal" data-target="#myLargeModal">
								<span></span><span class="text">상세보기</span></a>&nbsp;
								<a href="#" onclick="fndoapply('${listt.into_no}','${listt.into_req_remain}','${listt.into_date}')" class="btn btn-primary" >
								<span></span><span class="text">신청하기</span></a>
						</div>
					</div><br/>
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
					<div class="nav nav-tabs" role="tablist" id="btn">
						<a class="nav-item nav-link btn btn-info active" id="userApply" data-toggle="tab" href="#nav-userApply" role="tab" aria-controls="nav-userApply" aria-selected="true">개인</a>&nbsp;&nbsp;
						<a class="nav-item nav-link btn btn-warning" id="groupApply" data-toggle="tab" href="#nav-groupApply" role="tab" aria-controls="nav-groupApply" aria-selected="false">단체</a>
						
					</div>
				</nav>
				<!--개인 신청 -->
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-userApply" role="tabpanel" aria-labelledby="userApply">
						<div class="row">
							<div class="modal-body">
								<form id="applyPersonFrm" method="post" action="insertReqFarm" >
									<table class="table table-hover">
										<thead class="text-center">
											<tr class="content">
												<th class="text-left">회원 아이디 : <input type="text" style="border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" id="user_id" name="user_id" value="${uservo.user_id}" readonly >
												<input type="hidden" id="into_no" name="into_no"> 
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
														  <input type="radio" id="product" name="into_req_reward" value="작물" checked>
															  <label for="product">작물</label>
														  <input type="radio" id="cash" name="into_req_reward" value="현금">
															  <label for="cash">현금</label>
														  <input type="radio" id="valtime" name="into_req_reward" value="봉사시간">
															  <label for="valtime">봉사시간</label>
													</th>		  
												</tr>
											<tr class="content" id="dateTr" >
												<th class="text-left" id="dateTh" >날짜 선택: 
														<input type="hidden" id="into_req_date" name="into_req_date" >
												</th>
											</tr>
										</thead>
										
									</table>
									<div class="modal-footer">
										<button class="btn btn-primary" id="resetbtn" type="reset" data-dismiss="modal">취소</button>
										<button class="btn btn-primary" type="button" onclick="fnpersonalapply()">신청</button>
									</div>	
									</form>
							</div>
						</div>	
					</div>
					
					
					
					<!--그룹 신청 -->
					<div class="tab-pane fade" id="nav-groupApply" role="tabpanel" aria-labelledby="groupApply">
						<div class="row">
							<div class="modal-body">
								<form id="applyGroupFrm" method="post" action="insertGroupFarm" >
									<table class="table table-hover" id="groupForm">
										<thead class="text-center">
											<tr class="content">
													<td class="text-left">
														신청인원 수: <input type="number" style="border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" id="into_register" name="into_register">
														<button class="addReq" type="button" style="float: right;" >
															<span aria-hidden="true">+</span>
														</button>
													</td>
											</tr>
											<tr class="content">
												<th class="text-left">회원 아이디 : <input type="text" style="border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" id="user_id" name="user_id" value="${uservo.user_id}" readonly >
												<input type="hidden" id="into_no" name="into_no"> 
												</th>
											</tr>
											
												<tr class="content">
													<td class="text-left">
														이름 : <input type="text" style="border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" id="user_name" name="user_name" value="${uservo.user_name}" readonly></td>
												</tr>
												<tr class="content">
													<td class="text-left">연락처 : <input type="text" style="border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" id="into_req_phone" name="into_req_phone" value="${uservo.user_phone}" readonly></td>
												</tr>
												<!--보상선택  -->
												<tr class="content">  
													<td class="text-left">
													  보상선택:
														  <input type="radio" id="product" name="into_req_reward" value="작물" checked>
															  <label for="product">작물</label>
														  <input type="radio" id="cash" name="into_req_reward" value="현금">
															  <label for="cash">현금</label>
														  <input type="radio" id="valtime" name="into_req_reward" value="봉사시간">
															  <label for="valtime">봉사시간</label>
													</td>
												</tr>
											<tr class="content" id="dateTr1">
												<th class="text-left" id="dateTh1" >날짜 선택: 
														<input type="hidden" id="into_req_date1" name="into_req_date1" >
												</th>
											</tr>
										</thead>
										
									</table>
									<div class="modal-footer">
										<button class="btn btn-primary" type="reset" data-dismiss="modal">취소</button>
										<button class="btn btn-primary" type="button" onclick="fnGroupapply()">신청</button>
									</div>	
									</form>
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