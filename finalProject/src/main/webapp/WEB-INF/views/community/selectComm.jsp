<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>청년농장</title>
<script src="./resources/js/json.min.js"></script>
<script>
//도큐먼트 레디 스크립트는 맨 위에 적어야한다.
$(document).ready(function() {
	$('input[type="text"]').keypress(function() {
		  if (event.keyCode == 13) {
		    event.preventDefault();
		  };
	});
	  
	//댓글 등록
	$("#btnAdd").on("click", function() {
	$.ajax({
		url:"insertReply",
		data:{  comm_no : ${communityVO.comm_no},
			    comm_rep_content:$("[name=comm_rep_content]").val(),
				user_id: "${user_id}"
				},	
		dataType:"json",
		success:function(response){
			$(".replyItem").append(
			$('<div class="reply" style="float:left; width:1000px; margin-left:56px; margin-right:70px;">'
			+'<hr style="margin-bottom:4px; margin-top:4px;">'
			+'<input type="hidden" id="comm_rep_no" name="comm_rep_no" value='+response.comm_rep_no+'>'
			+'<span class="reply-user_id" style="font-size:18px; color: #00cc99;"><strong>${user_id}　</strong></span>'
			+'<span class="reply-comm_rep_content before" style="padding-left:4px;">'+response.comm_rep_content+'</span>'
			+'<input class="after" type="text" name="content" value='+response.comm_rep_content+' style="width:700px;">'
			+'<div class="before" style="float:right;">'
			+'<button type="button" id="update" class="btn btn btn-outline-info btn-sm" onclick="btnChg1()" style="margin-right:4px;">수정</button>'
			+'<button type="button" id="delete" class="btn btn-outline-danger btn-sm" onclick="deleteReply('+response.comm_rep_no+')">x</button>'
			+'</div>'
			+'<div class="after" style="float:right;">'
			+'<button type="button" id="btnUp" class="btn  btn btn-outline-info btn-sm">저장</button>'
			+'</div>'
		    +'<span class="reply-comm_rep_date" style="float:right;">'+response.comm_rep_date+'　</span>' /*아작스기 때문에 response 넘어온 값을 바로 넘겨야 함*/
			+'</div>') );
			  $(".before").show();
			  $(".after").hide();
			  $("#comm_rep_content").val(""); //댓글 다 쓰고 창 비우기
				    }	
	            });
		     });


		//댓글 수정
	    $(document).on("click", "#btnUp" ,function() {  
	    //이벤트 핸들러 내에서의 디스는  $(document).on("click", "#btnUp" ,function() {  얘가 되기 때문에 this 써도 됨
	    var target = $(this).closest(".reply"); //디스에 대한 공부 좀 하기
	    console.log(this);
	    var comm_rep_no = $(event.target).closest(".reply").find($("[name=comm_rep_no]")).val();
	    var comm_rep_content = $(event.target).closest(".reply").find($("[name=content]")).val();
		 	$.ajax({ 
					  url: "updateReply",
					  data : { comm_rep_no : comm_rep_no,
						       comm_rep_content: comm_rep_content },
						dataType : 'json',
						success: function(response) {
							 target.find(".reply-comm_rep_content").html(comm_rep_content); //컨트롤러에서 인트로 넘어오니까 바뀐 내용자체를 보여주려면 변수로 담아둔 comm_rep_content를 이용한다.
							 target.find(".before").show();
							 target.find(".after").hide();
							 
				     }
			      })
	     
			 });
		 });
		 
	//댓글삭제
	function deleteReply(obj) {
		var target = $(event.target).closest(".reply");
	    if (!confirm("삭제 하시겠습니까?")) {
	        return;
	    }
		$.ajax({
			url:'deleteReply',
			type: 'post',
			data: { "comm_rep_no" : obj },
			success: function(response){
					$(target).remove();
					 alert("삭제 되었습니다.");
				}
		  });
     }
</script>

<script type="text/javascript">
	function deleteAlert() {
		var yn = confirm("정말 삭제할까요?");
		if (yn) {
			frm.action = "deleteComm?comm_no=${communityVO.comm_no}&page=${commPagingVO.page}"
			frm.submit();
		}
	}
</script>
<script>
//수정폼으로 변경
function btnChg1() {
	 var target = $(event.target).closest(".reply");
	 //펑션 내에서는 this 쓰면 윈도우꺼가 되어버려서 쓰면 안된다 타겟 써야된다.
	 target.find(".before").hide();
	 target.find(".after").show(); 
	 event.stoppropagation();
}
</script>
<style type="text/css">
#comm_title {  width:836px;
                 padding:5px;
                 height:32px !important; }
#title > h1 {
       font-size: 35px;
       color: #00cc99;
       } 
.after {display:none;}
</style>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body class="goto-here">
    <div class="hero-wrap hero-bread" style="background-image: url('resources/main/images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>About us</span></p>
            <h1 class="mb-0 bread">About us</h1>
          </div>
        </div>
      </div>
    </div>
     <section class="ftco-section testimony-section">
     <div align="center" style="margin-left:400px; margin-right:400px;">
		<div id="title" style="margin-left:100px;">
			<h1>커뮤니티 상세보기</h1>
		</div><br/>
		<form id="frm" name="frm" action="updateComm" method="post">
		
		<input type="hidden" name="comm_no" value="${communityVO.comm_no}">
		<input type="hidden" name="page" value="${commPagingVO.page}">
		<div>
		<div style="margin-left:50px; margin-bottom:20px; float:left;" >
		<button type="button" class="btn btn-outline-primary" onclick="location.href='getComm?page=${commPagingVO.page}'" style="float:left;">목록보기</button>
		</div>
	    <c:if test="${user_auth == 'admin' }">
		<div style="margin-left:830px;">
		<button type="button" class="btn btn-outline-primary" onclick="location.href='updateComm?comm_no=${communityVO.comm_no}&page=${commPagingVO.page}'">글 수정</button>
		&nbsp;&nbsp;
		<button type="button" class="btn btn-outline-primary" onclick="deleteAlert()">글 삭제</button>
		</div>
		</c:if>
			<table class="table table-hover" style ="table-layout: auto; width: 80%; table-layout: fixed;">
				<thead>
				<tr> 
					<td align="center" width="70">작성자</td>
					<td align="center" width="100">${communityVO.user_id}</td>
					<td align="center" width="80">지역</td>
					<td align="center" width="100">
					<select name="comm_adr" id="comm_adr">
					<option value="서울/경기/인천"
                    <c:if test ="${communityVO.comm_adr eq '서울/경기/인천'}">
	                selected </c:if>>서울/경기/인천</option>
	                <option value="대전/세종/충청"
	                <c:if test ="${communityVO.comm_adr eq '대전/세종/충청'}">
	                selected </c:if>>대전/세종/충청</option>
                    <option value="강원"
                    <c:if test ="${communityVO.comm_adr eq '강원'}">
	                selected </c:if>>강원</option>
                    <option value="광주/전라"
                    <c:if test ="${communityVO.comm_adr eq '광주/전라'}">
	                selected </c:if>>광주/전라</option>
	                <option value="대구/경북"
                    <c:if test ="${communityVO.comm_adr eq '대구/경북'}">
	                selected </c:if>>대구/경북</option>
	                <option value="부산/울산/경남"
                    <c:if test ="${communityVO.comm_adr eq '부산/울산/경남'}">
	                selected </c:if>>부산/울산/경남</option>
	                <option value="제주 "
                    <c:if test ="${communityVO.comm_adr eq '제주 '}">
	                selected </c:if>>제주 </option>
					</select></td>
					<td align="center" width="70">말머리</td>
					<td align="center" width="80">
					<select name="comm_subject" id="comm_subject">
					<option value="정보공유"
                    <c:if test ="${communityVO.comm_subject eq '정보공유'}">
	                selected </c:if>>정보공유</option>
	                <option value="질문"
	                <c:if test ="${communityVO.comm_subject eq '질문'}">
	                selected </c:if>>질문</option>
                    <option value="일상"
                    <c:if test ="${communityVO.comm_subject eq '일상'}">
	                selected </c:if>>일상</option>
                    <option value="고민"
                    <c:if test ="${communityVO.comm_subject eq '고민'}">
	                selected </c:if>>고민</option>
					</select></td>
				</tr>
				<tr>
				   <td align="center" width="70">작성일자</td>
				   <td align="center" colspan="2">${communityVO.comm_date}</td>
				   <td align="center" width="70">조회수</td>
				   <td align="center" colspan="2">${communityVO.comm_hit}</td>
				</tr>
				<tr>
					<td align="center" width="80">제 목</td>
					<td colspan="5" ><input class="form-control" type="text" id="comm_title" name="comm_title" value="${communityVO.comm_title}" size=97></td>   
				</tr>
				<tr>
					<td align="center" width="70">내용</td>
					<td colspan="5">${communityVO.comm_content}</td>
				</tr>
				</thead>
			</table></div>
			</form></div>
			
	<div class="container">
	<div class="replyItem">
		<c:forEach items="${reply}" var="reply">
		<div class="reply" style="float:left; width:1000px; margin-left:56px; margin-right:70px;">
		<hr style="margin-bottom:4px; margin-top:4px;">
			<input type="hidden" id="comm_rep_no" name="comm_rep_no" value="${reply.comm_rep_no}">
			<span class="reply-user_id" style="font-size:18px; color: #00cc99;"><strong>${reply.user_id}　</strong></span>
			<span class="reply-comm_rep_content before">${reply.comm_rep_content}</span>
			<input class="after" type="text" name="content" value="${reply.comm_rep_content}" style="width:700px;">
			<div class="before" style="float:right;">
				<button type='button' id="update" class='btn btn btn-outline-info btn-sm' onclick="btnChg1()">수정</button>
				<button type='button' id="delete" class='btn btn-outline-danger btn-sm' onclick='deleteReply(${reply.comm_rep_no})'>x</button>
			</div>
			<div class="after" style="float:right;">
				<button type="button" id="btnUp" class="btn btn btn-outline-info btn-sm">저장</button>
			</div>
			<!-- 목록 뿌리는 건 제이슨으로 가져오는 게 아니고 단건 조회 할 때 댓글리스트까지 같이 가져오는 거기때문에 이렇게 형변환을 따로 시켜줘야한다. vo에 적은 데이터포맷은 여기서 적용이 안 됨 -->
			<span class="reply-comm_rep_date" style="float:right;"><fmt:formatDate value="${reply.comm_rep_date}" pattern="yyyy-MM-dd"/>　</span>
			</div>
		
		</c:forEach>
		</div>  
            <div style="margin-left:48px; margin-right:70px;">
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width:1000px" rows="3" cols="30" id="comm_rep_content" name="comm_rep_content" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                               <div class="form-group">
				               <button type="button" id="btnAdd" class="btn btn-outline-primary">등록</button>
			                  </div>       
                        </td>
                    </tr>
                </table>
            </div>  
         </div>
</section>
</body>
</html>