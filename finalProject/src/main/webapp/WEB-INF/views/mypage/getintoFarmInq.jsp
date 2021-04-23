<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/main/css/style.css">

<style>
.table th {
	background-color: #c3e6cb;
	font-weight: bold;
}

h4 {
	font-weight: bold;
}

h2 {
	font-weight: bold;
}
</style>
<!-- 모달바디 시작 -->
<form action="updateintoFarmInq" method="post">
	<div class="row">
		<table class="table">
			<tr>
				<th colspan="1">제목</th>
				<td colspan="7">${ilist.into_inq_title }</td>
				<c:if test="${ilist.into_inq_check eq '1'}">
					<td colspan="1" align="rigth"><img
						src="resources/images/mypage/secrete.JPG" width="30" height="40">
					</td>
					<td colspan="1">
					<c:if test="${ilist.user_id eq user_id }">
						<button class="btn  btn-outline-warning"
							onclick="iQNAupdate('${ilist.into_inq_no}')">수정</button>
						<button type="button" class="btn  btn-outline-danger"
							onclick="deleteAlert('${ilist.into_inq_no }')">삭제</button>
					</c:if>
					</td>
				</c:if>
				<c:if test="${ilist.into_inq_check eq '0'}">
					<td colspan="1" align="rigth"><img src="resources/images/mypage/nosecrete.JPG" width="30" height="40">
					</td>
					<td colspan="1">
						<button class="btn  btn-outline-warning"
							onclick="iQNAupdate('${ilist.into_inq_no}')">수정</button>
						<button type="button" class="btn  btn-outline-danger"
							onclick="deleteAlert('${ilist.into_inq_no }')">삭제</button>
					</td>
				</c:if>
			</tr>
			<tr>
				<th colspan="1">작성일</th>
				<td colspan="7">${ilist.into_inq_date }</td>
				<th colspan="1">작성자</td>
				<th colspan="2">${ilist.user_id}</th>
			</tr>			
			<tr>
				<th colspan="1">내용</th>
				<td colspan="9"><textarea class="form-control"
						name="pur_inq_content" rows="6" readonly="readonly">${ilist.into_inq_content}</textarea>
				</td>
			</tr>
		</table>
	</div>
</form>

<br>

<div class="row">
	<h4>댓글</h4>
	<table class="table" id="reply">
		<tr>
			<th class="table-success" width='70%'>댓글내용</th>
			<th class="table-success" width='5%'>작성자</th>
			<th class="table-success" width='15%'>날짜</th>
			<th class="table-success" width='15%'>삭제</th>
		</tr>
	</table>
</div>

<form>
	<div class="input-group mb-3">
		<textarea class="form-control" id="into_inq_rep_content" name="into_inq_rep_content" rows="1"  placeholder="댓글을 입력하세요" required="required"></textarea>
		<input type="hidden" name="user_id" value="${user_id }">
		<div class="input-group-append">
			<button type="button" id="btnAdd" class="btn  btn-outline-success btn-sm">등록</button>
		</div>
	</div>
</form>
<!-- 모달바디 끝 -->

<!-- Required Js -->
<script src="resources/admin/js/vendor-all.min.js"></script>
<script src="resources/admin/js/plugins/bootstrap.min.js"></script>
<script src="resources/admin/js/ripple.js"></script>
<script src="resources/admin/js/pcoded.min.js"></script>
<script type="text/javascript">

//문의글삭제 (댓글 있는 경우 삭제 안됨)
function deleteAlert(str) {
		if (  $("#replyDate").val() != null ) {
				confirm("댓글이 있는글은 삭제 할 수 없습니다.")			
	} else {
		location.href = "deleteIntoFarmInq?into_inq_no=" + str;
	}
}
//댓글삭제
	function deleteReply(obj) {
	    if (!confirm("삭제하시겠습니까?")) {
	        return;
	    }
		$.ajax({
			url:'deleteintoFarmReply',
			type: 'post',
			data: { "into_inq_rep_no" : obj },
			success: function(result){
					$("#replyItem").remove();
					 alert("삭제 되었습니다.");

				}
		});
 }
	
	
	//댓글 목록 조회
	$.ajax({
		url: "getintoFarmReplyList",
		data:{ into_inq_no : ${ilist.into_inq_no} },
		dataType:"json",
		success: function(response) {
			for(i=0; i<response.length; i++){
				$("#reply").append(
						"<tr  id='replyItem'><td width='70%'>" + response[i].into_inq_rep_content + "</td><td width='5%'>"
						+ response[i].user_id + "</td><td id='replyDate' width='15%'>"
						+ response[i].into_inq_rep_date + "</td><td width='5%'>"
						+ "<button type='button' class='btn  btn-outline-danger btn-sm' onclick='deleteReply("+response[i].into_inq_rep_no+")'>" + "삭제" + "</button>"
						+ "</td></tr>"						
						);
			}
		}
		
	});
	
	//댓글 등록
	$("#btnAdd").on("click", function(){
	$.ajax({
		url:"insertintoFarmReply",
		data:{ into_inq_no : ${ilist.into_inq_no},
				into_inq_rep_content:$("[name=into_inq_rep_content]").val(),
				user_id:$("[name=user_id]").val()
				},	
		dataType:"json",
		success:function(response){
			$("#reply tbody").append(
					"<tr><td>" +  response.into_inq_rep_content + "</td><td>"
					+ response.user_id + "</td><td>"
					+ response.into_inq_rep_date + "</td></tr>"						
					);
		}

	});		
});

	</script>
