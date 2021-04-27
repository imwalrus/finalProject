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
<form action="updatepuchasInq" method="post">
	<div class="row">

		<table class="table">
			<tr>
				<th>제목</th>
				<td colspan="4">${plist.pur_inq_title }</td>
				<td>
					<c:if test="${plist.user_id eq user_id }">
									<!-- 작성자와 아이디가 같으면 수정,삭제 버튼 보인  -->
						<button class="btn  btn-outline-warning" onclick="pQNAupdate('${plist.pur_inq_no}')">수정</button>
						<button type="button" class="btn  btn-outline-danger" onclick="deleteAlert('${plist.pur_inq_no }')">삭제</button>
					</c:if>
					<c:if test="${plist.user_id ne user_id}">
						<!-- id값 다르면 수정,삭제 버튼 안보임 -->
					</c:if>
				</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td colspan="2">${plist.pur_inq_date }</td>
				<th>작성자</th>
				<td>${plist.user_id}</td>
				<td>
					<c:if test="${plist.pur_inq_check eq '1'}">
						<img src="resources/images/mypage/secrete.JPG" width="30" height="40">
					</c:if>
					<c:if test="${plist.pur_inq_check eq '0'}">
						<img src="resources/images/mypage/nosecrete.JPG" width="30" height="40">
					</c:if>
				</td>
			</tr>
			<tr>
				<th>문의 할 제품(번호_이름)</th>
				<td colspan="5">${plist.pro_no}_ ${plist.pro_name}
			</tr>
			<tr>
				<td colspan="6" text-align="center" style="width: 795px; height: 280px;">
					<c:if test="${plist.pur_inq_filename eq null }">
							등록된 사진이 없습니다.
					</c:if>
					<c:if test="${plist.pur_inq_filename ne null }">
						<img class="img-fluid card-img-top" src="resources/images/mypage/${plist.pur_inq_filename}"
						style="width: 80%; max-width: 100%; height: auto;"
						alt="Card image cap">
					</c:if>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="5"><textarea class="form-control"
						name="pur_inq_content" rows="6" readonly="readonly">${plist.pur_inq_content}</textarea>
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
		<input type="text" class="form-control" name="pur_inq_rep_content"
			placeholder="댓글은 34자까지 입력 가능합니다" aria-describedby="basic-addon2"
			maxlength="34"> <input type="hidden" name="user_id"
			value="${user_id }">
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
			location.href = "deletepuchasInq?pur_inq_no=" + str;
		}
	}
	
 //댓글삭제
	function deleteReply(obj) {
	    if (!confirm("삭제하시겠습니까?")) {
	        return;
	    }
		$.ajax({
			url:'deletepuchasReply',
			type: 'post',
			data: { "pur_inq_rep_no" : obj },
			success: function(result){
					$("#replyItem").remove();
					 alert("삭제 되었습니다.");

				}
		});
 }
	
	
//댓글 목록 조회
$.ajax({
		url: "getpuchasReplyList",
		data:{ pur_inq_no : ${plist.pur_inq_no} },
		dataType:"json",
		success: function(response) {
			for(i=0; i<response.length; i++){
				if(response[i].user_id != '${user_id}' ){
					$("#reply").append(						
							"<tr id='replyItem'><td width='70%' style='text-align : left !important;'>" + response[i].pur_inq_rep_content + "</td><td width='5%'>"
							+ response[i].user_id + "</td><td id='replyDate' width='15%'>"
							+ response[i].pur_inq_rep_date + "</td><td width='5%'>"
							+ " "
							+ "</td></tr>"						
							);
				}	
				else{
					$("#reply").append(						
							"<tr id='replyItem'><td width='70%' style='text-align : left !important;'>" + response[i].pur_inq_rep_content + "</td><td width='5%'>"
							+ response[i].user_id + "</td><td id='replyDate' width='15%'>"
							+ response[i].pur_inq_rep_date + "</td><td width='5%'>"
							+ "<button type='button' class='btn  btn-outline-danger btn-sm' onclick='deleteReply("+response[i].pur_inq_rep_no+")'>" + "삭제" + "</button>"
							+ "</td></tr>"						
							);

				}
			}
		}
		
	});

//댓글 등록
$("#btnAdd").on("click", function(){
	$.ajax({
		url:"insertpuchasReply",
		data:{ pur_inq_no : ${plist.pur_inq_no}
				, pur_inq_rep_content:$("[name=pur_inq_rep_content]").val()	
				, user_id:$("[name=user_id]").val()
				},	
		dataType:"json",
		success:function(response){
			/* $("#reply").append(response.content + "<br>"); */
			$('[name=pur_inq_rep_content]').val(''); //댓글 작성 후 초기화
			$("#reply").append(
					"<tr><td>" +response.pur_inq_rep_content + "</td><td>"
					+ response.user_id + "</td><td>"
					+ response.pur_inq_rep_date + "</td></td>"
					+ response.pur_inq_rep_content + "</td><tr>"
					);
		}

	});		
});


	</script>
