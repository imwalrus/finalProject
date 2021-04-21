<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.table {
    width: 100%;
    border: 2px solid #b1bfa3;
  }

th{
background-color: #e3f1d4;
}
div .row{
	text-align: center;
}
</style>
<div class="card-body">
	<div class="row" id="diaryList"  align="center">
		
	</div>
</div>
<script src="resources/admin/js/vendor-all.min.js"></script>
<script src="resources/admin/js/plugins/bootstrap.min.js"></script>
<script src="resources/admin/js/ripple.js"></script>
<script src="resources/admin/js/pcoded.min.js"></script>
<script type="text/javascript">
$.ajax({
	url:"ajaxgetfDiary",
	data:"user_id=" + '${user_id}' + "&fdiary_day=" + "<%= request.getAttribute("fdiary_day") %>",
	dataType: "json",
	success: function(data) {
		var user = '${user_id}';
		
		if(data == null || data  == ''){ //data값 없을 경우
			$("#diaryList").append(
			"<div class='col-md-12'><h4>등록된 일지가 없습니다.</h4>"
			+"<button type='submit' class='btn  btn-outline-success' onclick='moveInsert()'>" + "일기작성" + "</button></div>"	
				);
			
		}else{
		for(i=0; i<data.length; i++){ //data값 있을 경우
		$("#diaryList").append(
						"<h5>" + data[i].crop_name + "</h5>"
						+ "<table class='table' id='table'><tr><th>" + "작업날짜" + "</th><td id='day'>"
						+ data[i].fdiary_day.substring(0,10) + "</td><th>"
						+ "시작시간" + "</th><td>"
						+ data[i].fdiary_stime + "</td><th>"
						+ "종료시간" + "</th><td>"
						+ data[i].fdiary_etime + "</td></tr>"
					+"<tr><th>" + "날씨" + "</th><td colspan='3'>"
						+ data[i].fdiary_weather + "</td><th>"
						+ "작업인력" + "</th><td>"
						+ data[i].fdiary_worker	+ "명</td></tr>"
					+"<tr><td colspan='6'><img class='img-fluid d-block w-100' src='./resources/images/mypage/" + data[i].fdiary_filename  + "'\></td></tr>"
					+"<tr><th>" + "내용" + "</th><td colspan='5'>"
						+ data[i].fdiary_content
					+ "<input type='hidden' value='"+ data[i].fdiary_no +"'></td></tr>"						
					+"<tr><td colspan='6'>"
					+ "<button type='button' class='btn  btn-warning btn-sm' onclick='fdiaryUpdate(" + data[i].fdiary_no + ")'>수정</button></button>&nbsp&nbsp"	
					+ "<button type='button' class='btn  btn-danger btn-sm' onclick='deleteAlert(" + data[i].fdiary_no + ")'>삭제</button>" +"</td></td>"						
	
					+"</table>"
				);
			}
		}
}
	
});

//일지삭제
function deleteAlert(str) {
	var yn = confirm("정말 삭제할까요?");
	if (yn) {
		location.href = "deleteFdiary?fdiary_no=" + str;
	} else {
		alert("삭제하지 못하였습니다.  ");
	}
}

//일지수정
function fdiaryUpdate(no,day,user) {  /* updateFdiary?fdiary_no=1&user_id=kkd&fdiary_day=20210419*/
		location.href = "diarySelect?fdiary_no=" + no ;
}

function select(no) {
	location.href = "diarySelect?fdiary_no=" + no;
}



//값 비어있을 경우 
function moveInsert(){
    location.href = "insertFdiary";
}

</script>