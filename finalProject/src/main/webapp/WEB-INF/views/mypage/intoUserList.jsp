<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row" id="printme" align="center">
	<h4>신청명단</h4>

	<table class="table">
	<thead>	
		<tr class="table-success">
			<th class="table-success">이름</th>
			<th class="table-success">연락처</th>
			<th class="table-success">체험일자</th>
			<th class="table-success">보상선택</th>
			<th class="table-success">신청인원</th>
			<th class="table-success">신청취소</th>
		</tr>
	</thead>
	<tbody id="user">
	</tbody>	
	</table>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button" value="Print" class="btn  btn-success btn-sm"
			onclick="javascript:printIt(document.getElementById('printme').innerHTML)">출력</button>
</div>

	<script type="text/javascript">
		function deleteUser(str) {
			var yn = confirm("정말 삭제할까요?");
			if (yn) {
				location.href = "deleteUserList?into_req_num=" + str;
				
				
			} else {
				alert("삭제하지 못하였습니다.  ");
			}
		}
		
			$.ajax({
				url: "ajaxintoUserList",
				data: "into_no=" + "<%= request.getAttribute("into_no") %>",
				dataType: "json",
				success: function(response) {
					for(i=0; i<response.length; i++){	
					$("#user").append(
						"<tr><td>" + response[i].user_name + "</td><td>"		
						+ response[i].into_req_phone + "</td><td>"
						+ response[i].into_req_dates + "</td><td>"	
						+ response[i].into_req_reward + "</td><td>"	
						+ response[i].into_req_entry+ "</td><td>"	
						+ "<button type='button' class='btn  btn-danger btn-sm' onclick=\"deleteUser('" + response[i].into_req_num + "\')\">" + "신청취소"+ "</button>"
						+"</td></tr>"
					
					);
					}
					}
				
				
			});
	//출력

		function printIt(printThis)
		{
   				 var win = null;
    			win = window.open();
   				 self.focus();
    				win.document.open();
   					 win.document.write(printThis);
    				win.document.close();
   				 win.print();
    			win.close();
		}
</script>
	</script>
