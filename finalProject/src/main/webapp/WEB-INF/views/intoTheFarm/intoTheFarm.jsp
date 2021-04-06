  
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>청년농장</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<script>
		/*모달*/
		function fngetSearchInfo(str) { //into_no 가지고 보냄
			//event.preventDefault ? event.preventDefault() : (event.returnValue = false);
			/* $('#myUpdate').hide(); */
			$('#myLargeModal .modal-body').load("getSearchFarm?into_no="+str);
			$('#myLargeModal').modal('show');
			$('#myUpdate').modal('hide');
			/*만약 myUpdate를 누르면 수정폼이 보이게..*/
			
		}
		
		 function fnUpdate(str1){
			 	$('#myUpdate .modal-body').load("updateFarm?into_no=1");
				$('#myLargeModal').modal('hide');
				$('#myUpdate').modal('show');
		}
		
</script>
<script type="text/javascript">
//Bootstrap multiple modal
	var count = 0; // 모달이 열릴 때 마다 count 해서  z-index값을 높여줌
	$(document).on(
			'show.bs.modal',
			'.modal',
			function() {
				var zIndex = 1040 + (10 * count);
				$(this).css('z-index', zIndex);
				setTimeout(function() {
					$('.modal-backdrop').not('.modal-stack').css('z-index',
							zIndex - 1).addClass('modal-stack');
				}, 0);
				count = count + 1
			});
	
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

	<div class="modal fade" id="myLargeModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="false">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">상세보기</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
				</div>
				<div class="modal-body"></div> <!--내용 append -->
				<div class="modal-footer">
					<button class="btn btn-primary" type="button" data-dismiss="modal">취소</button>
					<!--농업인& 관리자 수정-->
					<a href="#" onclick="fnUpdate('${upFarm.into_no}')" class="btn btn-primary" data-toggle="modal">수정</a>
					
					<%-- <button class="btn btn-primary" id="firstUpdate" onclick="fnUpdate('${upFarm.into_no}')" type="button" data-dismiss="modal">수정</button> --%>
					<!-- <button type="button" id="updateFarm" class="btn btn-default" data-dismiss="modal">Update</button> -->
				</div>
			</div>
		</div>
	</div>
	
	<!--모달 수정화면 -->
	
	<div class="modal fade" id="myUpdate" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="false">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">수정하기</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
				</div>
				<div class="modal-body"></div> <!--내용 append -->
				<div class="modal-footer">
					<button class="btn btn-primary" type="button" data-dismiss="modal">취소</button>
					<!--농업인& 관리자 수정-->
					<button class="btn btn-primary" type="button" data-dismiss="modal">저장</button>
					<!-- <button type="button" id="updateFarm" class="btn btn-default" data-dismiss="modal">Update</button> -->
				</div>
			</div>
		</div>
	</div>
	
	
	
</body>
</html>