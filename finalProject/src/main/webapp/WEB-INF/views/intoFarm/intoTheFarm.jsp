  
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						  into_city:$("input[name=into_city]").val(),
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
				data:into_no,
				success:function(response){
					console.log("result:"+response);
					if(response != null){
						alert("삭제 완료");
						location.reload();
					}
				}
		})
	} 
		 
</script>

<style>
.modal.modal-center {
  text-align: center;
}
</style>
</head>
<body class="goto-here">
	

	
	<!--농촌속으로 리스트  -->
	<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
	
	 <div class="container">
		<div class="row">
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
	
	<div class="modal fade" id="myUpdate" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
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
	
		
	
</body>
</html>