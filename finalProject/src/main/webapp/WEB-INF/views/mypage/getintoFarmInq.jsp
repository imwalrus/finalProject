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
				<th style="width: 120px">제목</th>
				<td colspan="4">${ilist.into_inq_title }</td>
				<td>
					<c:if test="${ilist.user_id eq user_id }">
						<button class="btn  btn-outline-warning" onclick="iQNAupdate('${ilist.into_inq_no}')">수정</button>
						<button type="button" class="btn  btn-outline-danger" onclick="deleteAlert('${ilist.into_inq_no }')">삭제</button>
					</c:if>
					<c:if test="${ilist.user_id ne user_id }">
						<!-- id값 다르면 수정,삭제 버튼 안보임 -->
					</c:if>
				</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td colspan="2">${ilist.into_inq_date }</td>
				<th>작성자</th>
				<td>${ilist.user_id}</td>
				<td>
					<c:if test="${ilist.into_inq_check eq '1'}">
						<img src="resources/images/mypage/secrete.JPG" width="30" height="40">
					</c:if>
					<c:if test="${ilist.into_inq_check eq '0'}">
						<img src="resources/images/mypage/nosecrete.JPG" width="30" height="40">
					</c:if>
				</td>			
			</tr>
			<tr>
				<th>문의 할 체험(번호_이름)</th>
				<td colspan="5">${ilist.into_no}_ ${ilist.into_title }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="5"><textarea class="form-control"
						name="pur_inq_content" rows="6" readonly="readonly">
							${ilist.into_inq_content}
					</textarea></td>
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
		<textarea class="form-control" id="into_inq_rep_content"
			name="into_inq_rep_content" rows="1" placeholder="댓글은 34자까지 입력 가능합니다"
			maxlength="34"></textarea>
		<input type="hidden" name="user_id" value="${user_id }">
		<div class="input-group-append">
			<button type="button" id="btnAdd"
				class="btn  btn-outline-success btn-sm">등록</button>
			<button type="reset" class="btn  btn-outline-danger btn-sm">지우기</button>
		</div>
	</div>
</form>
<!-- 모달바디 끝 -->

<script type="text/javascript">

//문의글삭제 (댓글 있는 경우 삭제 안됨)
function deleteAlert(str) {
		if (  $("#replyDate").val() != null ) {
				confirm("댓글이 있는글은 삭제 할 수 없습니다.")			
	} else {
		location.href = "deleteintoFarmInq?into_inq_no=" + str;
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
				if(response[i].user_id != '${user_id}' ){
					$("#reply").append(
							"<tr id='replyItem'><td width='70%' style='text-align : left !important;'>" + response[i].into_inq_rep_content + "</td><td width='5%'>"
							+ response[i].user_id + "</td><td id='replyDate' width='15%'>"
							+ response[i].into_inq_rep_date + "</td><td width='5%'>"
							+ " "
							+ "</td></tr>"						
							);
					}
				else{
					$("#reply").append(
							"<tr id='replyItem'><td width='70%' style='text-align : left !important;'>" + response[i].into_inq_rep_content + "</td><td width='5%'>"
							+ response[i].user_id + "</td><td id='replyDate' width='15%'>"
							+ response[i].into_inq_rep_date + "</td><td width='5%'>"
							+ "<button type='button' class='btn  btn-outline-danger btn-sm' onclick='deleteReply("+response[i].into_inq_rep_no+")'>" + "삭제" + "</button>"
							+ "</td></tr>"						
							);
				}
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
			$('[name=into_inq_rep_content]').val(''); //댓글 작성 후 초기화
			$("#reply").append(
					"<tr><td>" +  response.into_inq_rep_content + "</td><td>"
					+ response.user_id + "</td><td>"
					+ response.into_inq_rep_date + "</td></tr>"						
					);
		}
	});		
});

	</script>
