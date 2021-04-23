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
				<th colspan="1">제목</th>
				<td colspan="7" style="border: 1px solid black; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${plist.pur_inq_title }</td>
				<c:if test="${plist.pur_inq_check eq '1'}">				<!-- 비밀글일경우 -->
					<td>
						<img src="resources/images/mypage/secrete.JPG" width="30" height="40">
					</td>
				</c:if>
				<c:if test="${plist.pur_inq_check eq '0'}">				<!-- 비밀글 아닐경우 -->
					<td colspan="1">
						<img src="resources/images/mypage/nosecrete.JPG" width="30" height="40">
					</td>
				</c:if>
				<c:if test="${plist.user_id eq user_id }">			<!-- 작성자와 아이디가 같으면 수정,삭제 버튼 보인  -->
					<td colspan="1">
						<button class="btn  btn-outline-warning"
							onclick="pQNAupdate('${plist.pur_inq_no}')">수정</button>
						<button type="button" class="btn  btn-outline-danger"
							onclick="deleteAlert('${plist.pur_inq_no }')">삭제</button>
					</td>
				</c:if>
				<c:if test="${plist.user_id ne user_id}">
							<td colspan="1">											<!-- id값 다르면 수정,삭제 버튼 안보임 -->
							</td>
				</c:if>
			</tr>
			<tr>
				<th colspan="1">작성일</th>
				<td colspan="7">${plist.pur_inq_date }</td>
				<th colspan="1">작성자</th>
				<th colspan="2">${plist.user_id}</th>
			</tr>
			<tr>
			<c:if test="${plist.pur_inq_filename eq null }">
				<td colspan="10" text-align="center" style="width: 795px; height: 280px;" >
					등록된 사진이 없습니다.
				</td>
			</c:if>
			<c:if test="${plist.pur_inq_filename ne null }">
				<td colspan="10"><img class="img-fluid card-img-top"
					src="resources/images/mypage/${plist.pur_inq_filename}"
					style="width: 50%; max-width: 100%; height: auto;"
					alt="Card image cap">
				</td>
			</c:if>
			</tr>
			<tr>
				<th colspan="1">내용</th>
				<td colspan="9"><textarea class="form-control"
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
			placeholder="댓글을 입력하세요" aria-describedby="basic-addon2"> <input
			type="hidden" name="user_id" value="${user_id }">
		<div class="input-group-append">
			<button type="button" id="btnAdd" class="btn  btn-outline-success btn-sm">등록</button>
			<button type="reset" class="btn  btn-outline-danger btn-sm">지우기</button>
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
							"<tr id='replyItem'><td width='70%' style='border: 1px solid black; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;'>" + response[i].pur_inq_rep_content + "</td><td width='5%'>"
							+ response[i].user_id + "</td><td id='replyDate' width='15%'>"
							+ response[i].pur_inq_rep_date + "</td><td width='5%'>"
							+ " "
							+ "</td></tr>"						
							);
				}	
				else{
					$("#reply").append(						
							"<tr id='replyItem'><td width='70%' style='border: 1px solid black; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;'>" + response[i].pur_inq_rep_content + "</td><td width='5%'>"
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
