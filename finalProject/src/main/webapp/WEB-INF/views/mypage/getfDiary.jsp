<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="card-body">

	<div class="row" id="diaryList">

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
		for(i=0; i<data.length; i++){								
			$("#diaryList").append(
				"<table border='1'><tr><th>" + "날짜" + "</th><td>"
					+ data[i].fdiary_day + "</td><th>"
					+ "시작시간" + "</th><td>"
					+ data[i].fdiary_stime + "</td><th>"
					+ "종료시간" + "</th><td>"
					+ data[i].fdiary_etime + "</td></tr>"
				+"<tr><th>" + "날씨" + "</th><td colspan='3'>"
					+ data[i].fdiary_weather + "</td><th>"
					+ "작업인력" + "</th><td>"
					+ data[i].fdiary_worker	+ "</td></tr>"
				+"<tr><td colspan='6'>" + "사진넣을곳" + "</td></tr>"
				+"<tr><th>" + "내용" + "</th><td colspan='5'>"
					+ data[i].fdiary_content + "</td></tr>"			
				+"</table>"
			);
		}
	}
	
	
});

/* http://localhost:8666/temp/getfDiary?user_id=hgd&fdiary_day=2021-04-14 */





</script>