<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/main/css/style.css">
<div class="card-body">
<div class="row" id="diaryList" align="center">
		
	</div>
</div>
<style>
.table th {
    font-weight: bolder;
    background-color: #E3F1D4 !important;
    text-align: center !important;
}
.card-image{
    border-top-left-radius: calc(0.25rem - 0px);
    border-top-right-radius: calc(0.25rem - 0px);
    flex-shrink: 0;
    width: 50%;
    max-width: 100%;
    height: auto;
    vertical-align: middle;
    border-style: none;
    }
.btn-sm { 
    margin-bottom:15px; 
    margin-left:10px;
    }
.badge-warning { 
    margin-bottom:15px; 
    }
.table td{ 
    border:1px !impotant;
    }
h6{
font-weight: bolder;
}
</style>
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
			var nbsp = "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
		$("#diaryList").append(
						"<span class='badge badge-warning'><h6>"+ data[i].crop_name +"</h6></span>"+nbsp+nbsp+nbsp+nbsp+nbsp+nbsp
						+"<span><button type='button' class='btn btn-outline-info btn-sm' onclick='fdiaryUpdate(" + data[i].fdiary_no + ")'>수정</button></button>&nbsp&nbsp<button type='button' class='btn  btn-outline-danger btn-sm' onclick='deleteAlert(" + data[i].fdiary_no + ")'>삭제</button></span>"
						+ "<table class='table table-bordered' id='table'><tr><th>" + "작업날짜" + "</th><td id='day'>"
						+ data[i].fdiary_day.substring(0,10) + "</td><th>"
						+ "시작시간" + "</th><td>"
						+ data[i].fdiary_stime + "</td><th>"
						+ "종료시간" + "</th><td>"
						+ data[i].fdiary_etime + "</td></tr>"
					+"<tr><th>" + "날씨" + "</th><td colspan='3'>"
						+ data[i].fdiary_weather + "</td><th>"
						+ "작업인력" + "</th><td>"
						+ data[i].fdiary_worker	+ "명</td></tr>"
					+"<tr><td colspan='6'><img align='center' class='card-image' width='500px' height='320px' src='./resources/images/mypage/" + data[i].fdiary_filename  + "'\></td></tr>"
					+"<tr><th>" + "내용" + "</th><td colspan='5'>"
					+"<textarea class='form-control' rows='5' readonly='readonly'>" + data[i].fdiary_content
					+ "</textarea><input type='hidden' value='"+ data[i].fdiary_no +"'></td></tr>"						
					+"</table><br><hr>"
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