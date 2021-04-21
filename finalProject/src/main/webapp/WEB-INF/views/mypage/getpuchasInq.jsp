<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.table {
	width: 100%;
	border: 1px solid #444444;
	 min-width: 500px !important;
	
}

.table td, .table th {
	border-top: 0px;
	white-space: nowrap;
	padding: 1.05rem 0.75rem;
}
</style>
<!-- 모달바디 시작 -->
<form action="updatepuchasInq" method="post">
	<div class="row" align="center">

		<table class="table">			
			<tr>
				<th class="table-success" colspan="1">제목</th>
				<td colspan="5">${plist.pur_inq_title }</td>
				<th class="table-success" colspan="1">비밀</th>
					<c:if test="${plist.pur_inq_check eq '1'}">
       					<td colspan="2">
       						<img src="resources/images/mypage/secrete.JPG">
       					</td>
       				</c:if>		
       				<c:if test="${plist.pur_inq_check eq '0'}">
       					<td colspan="2">
       						<img src="/resources/images/mypage/nosecrete.JPG">
       					</td>
       				</c:if>				
			</tr>
			<tr>
				<th class="table-success" colspan="1">작성일</th>
				<td colspan="5">${plist.pur_inq_date }</td>
				<th class="table-success" colspan="1"> 작성자</th>
				<th colspan="2">${plist.user_id}</th>
			</tr>
			<tr>
				<td colspan="9">
					<img class="img-fluid card-img-top" alt="Card image cap">${plist.pur_inq_filename}
				</td>
			</tr>
			<tr>
				<th class="table-success" colspan="1">내용</th>
				<td colspan="8">${pupdate.pur_inq_content}</td>
			</tr>
			<tr>
				<td  colspan="9">
					<button class="btn  btn-outline-warning" onclick="pQNAupdate('${plist.pur_inq_no}')">수정</button>
					<button type="button" class="btn  btn-outline-danger" onclick="deleteAlert('${plist.pur_inq_no }')">삭제</button>
				</td>
			</tr>
		</table>
	</div>
</form>

<br>


<div class="row" align="center">
	<h4>댓글</h4>
	<table class="table" id="reply" >

		<tr>
			<th class="table-success">No</th>
			<th class="table-success">댓글내용</th>
			<th class="table-success">작성자</th>
			<th class="table-success">날짜</th>
			<th class="table-success">삭제</th>
		</tr>
	</table>
</div>
<form>
      <div class="input-group mb-3">
              <input type="text" class="form-control" name="pur_inq_rep_content" placeholder="댓글을 입력하세요" aria-describedby="basic-addon2">
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

//문의글삭제
	function deleteAlert(str) {
		var yn = confirm("정말 삭제할까요?");
		if (yn) {
			location.href = "deletepuchasInq?pur_inq_no=" + str;
		} else {
			alert("삭제하지 못하였습니다.  ");
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
				$("#reply").append(						
						"<tr id='replyItem'><td>" + response[i].pur_inq_rep_no + "</td><td>"
						+ response[i].pur_inq_rep_content + "</td><td>"
						+ response[i].user_id + "</td><td>"
						+ response[i].pur_inq_rep_date + "</td><td>"
						+ "<button type='button' class='btn  btn-outline-danger btn-sm' onclick='deleteReply("+response[i].pur_inq_rep_no+")'>" + "삭제" + "</button>"
						+ "</td></tr>"						
						);
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
					"<tr><td>" + response.pur_inq_rep_no + "</td><td>"
					+ response.pur_inq_rep_content + "</td><td>"
					+ response.user_id + "</td><td>"
					+ response.pur_inq_rep_date + "</td></tr>"						
					);
		}

	});		
});
	</script>
