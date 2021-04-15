<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="">
<meta name="author" content="Phoenixcoded" />
<!-- Favicon icon -->
<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">

<!-- vendor css -->
<link rel="stylesheet" href="resources/admin/css/style.css">
<style type="text/css">


.custom_calendar_table tr td {
	text-align: center;
	font-size: 20px;
	margin: 10px;
	padding-top: 40px;
	padding-bottom: 40px;
}

.custom_calendar_table thead.cal_date th {
	font-size: 2.0rem;
}

.custom_calendar_table thead.cal_date th button {
	font-size: 1.5rem;
	background: none;
	border: none;
}

.custom_calendar_table thead.cal_week th {
	font-size: 20px;
	background-color: #E3F1D4;
	color: #000;
}

.custom_calendar_table tbody td {
	cursor: pointer;
}

.custom_calendar_table tbody td:nth-child(1) {
	color: red;
}

.custom_calendar_table tbody td:nth-child(7) {
	color: #288CFF;
}

.custom_calendar_table tbody td.select_day {
	background-color: #E3F1D4;
	color: #000;
}
</style>


</head>
<body>
	<section class="pcoded-main-container">
		<!-- [ Main Content ] start -->
		<div class="pcoded-main-container">
			<div class="pcoded-content">
				<!-- [ breadcrumb ] start -->
				<div class="page-header">
					<div class="page-block">
						<div class="row align-items-center">
							<div class="col-md-12"></div>
						</div>
					</div>
				</div>
				<!-- [ breadcrumb ] end -->
				<!-- [ Main Content ] start -->
				<div class="row">
					<!-- [ vertically-modal ] start -->
					<div class="col-md-8">
						<div class="card">
							<div class="card-body" align="center">

								<div class="col-md-12">
									<!-- 달력내용 -->
									<div id="calendarForm">
									
									</div>
									<br>
									<div class="col-md-10" align="center">
										<button type='submit' class='btn  btn-outline-success' onclick="fnInsert()">일기작성</button>
									</div>
									

									<br>
								</div>
							</div>

						</div>


					</div>



				</div>
			</div>
<!-- 일기보기시작 -->
			<div class="modal fade bd-example-modal-lg" id="diaryModal"
				tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
				aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button class="close" type="button" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">x</span>
							</button>
						</div>
						<div class="modal-body"></div>
					</div>
				</div>
			</div>
<!-- 모달끝 -->
			
			
<!-- 등록시작 -->
			<div class="modal fade bd-example-modal-lg" id="insertF"
				tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
				aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button class="close" type="button" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">x</span>
							</button>
						</div>
						<div class="modal-body"></div>
					</div>
				</div>
			</div>
<!-- 모달끝 -->
		</div>
	</section>


	<script type="text/javascript">
		(function() {
			calendarMaker($("#calendarForm"), new Date());
		})();

		var nowDate = new Date();
		function calendarMaker(target, date) {
			if (date == null || date == undefined) {
				date = new Date();
			}
			nowDate = date;
			if ($(target).length > 0) {
				var year = nowDate.getFullYear();
				var month = nowDate.getMonth() + 1;
				$(target).empty().append(assembly(year, month));
			} else {
				console.error("custom_calendar Target is empty!!!");
				return;
			}

			var thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth(),
					1);
			var thisLastDay = new Date(nowDate.getFullYear(), nowDate
					.getMonth() + 1, 0);

			var tag = "<tr>";
			var cnt = 0;
			//빈 공백 만들어주기
			for (i = 0; i < thisMonth.getDay(); i++) {
				tag += "<td></td>";
				cnt++;
			}

			//날짜 채우기
			for (i = 1; i <= thisLastDay.getDate(); i++) {
				if (cnt % 7 == 0) {
					tag += "<tr>";
				}

				tag += "<td id='days' onclick='selectDay("  + i  + ")' >" + i + "</td>";			//daySelect[i] -> 날짜 클릭 이벤트
				cnt++;
				if (cnt % 7 == 0) {
					tag += "</tr>";
				}
			}
			$(target).find("#custom_set_date").append(tag);
			calMoveEvtFn();

			function assembly(year, month) {
				var calendar_html_code = "<table class='custom_calendar_table' id='calTable'>"
						+ "<colgroup>"
						+ "<col style='width:81px'/>"
						+ "<col style='width:81px'/>"
						+ "<col style='width:81px'/>"
						+ "<col style='width:81px'/>"
						+ "<col style='width:81px'/>"
						+ "<col style='width:81px'/>"
						+ "<col style='width:81px'/>"
						+ "</colgroup>"
						+ "<thead class='cal_date'>"
						+ "<th><button type='button' class='prev'><</button></th>"
						+ "<th colspan='5'><p><span id='years'>"
						+  year
						+ "</span>년 <span id='months'>"
						+  month
						+ "</span>월</p></th>"
						+ "<th><button type='button' class='next'>></button></th>"
						+ "</thead>"
						+ "<thead  class='cal_week'>"
						+ "<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>"
						+ "</thead>"
						+ "<tbody id='custom_set_date'>"
						+ "</tbody>" + "</table>"						
				return calendar_html_code;
			}

			function calMoveEvtFn() {
				//전달 클릭
				$(".custom_calendar_table").on(
						"click",
						".prev",
						function() {
							nowDate = new Date(nowDate.getFullYear(), nowDate
									.getMonth() - 1, nowDate.getDate());
							calendarMaker($(target), nowDate);
						});
				//다음날 클릭
				$(".custom_calendar_table").on(
						".next",
						function() {
							nowDate = new Date(nowDate.getFullYear(), nowDate
									.getMonth() + 1, nowDate.getDate());
							calendarMaker($(target), nowDate);
						});
				//일자 선택 클릭
				$(".custom_calendar_table").on(
						"click",
						"td",
						function() {
							$(".custom_calendar_table .select_day")
									.removeClass("select_day");
							$(this).removeClass("select_day").addClass(
									"select_day");
						});
			}
			

		}

		//날짜 클릭시 일기 상세조회
		function selectDay(){
			
		$('#diaryModal' .modal-body).load("getfDiary?user_id="+ '${user_id}');
		$('#diaryModal').modal('show');
	}

		

		//등록 버튼 클릭시 입력 화면
			function fnInsert(){
				$('#insertF .modal-body').load("insertFdiary");
				$('#insertF').modal('show');
			}
	</script>
</body>
</html>