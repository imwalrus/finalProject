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
			+'<hr style="margin-bottom:5px; margin-top:4px;">'
			+'<input type="hidden" id="comm_rep_no" name="comm_rep_no" value='+response.comm_rep_no+'>'
			+'<span class="reply-user_id" style="float:left; width:100px; margin-left:40px; font-size:18px; color: #00cc99;">'
			+'<strong>${user_id}</strong></span>'
			+'<span class="reply-comm_rep_content before" style="padding-left:7px; display:inline-block; width:650px;">'+response.comm_rep_content+'</span>'
			+'<input class="after" type="text" name="content" value="'+response.comm_rep_content+'" style="width:700px; margin-left:1px;">' 
			+'<div class="before" style="float:right;">' /*컨텐트 내용에 공백이 있으면 앞단락만 인식하는 오류는 밸류를 ""로 묶어주면서 해결*/
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
/*커뮤니티 아이디 마우스 오버시 이벤트 - 20210422 송예솔 추가*/
$(function(){
	$('.chatId').on('mouseover',function(){
		$(this).css('color','#78c2ad');
		$('.chatId').css('cursor','pointer');
	});
	$('.chatId').on('mouseout',function(){
		$(this).css('color','#888');
		$('.chatId').css('cursor','pointer');
	});
})

/*커뮤니티 채팅팝업 - 20210422 송예솔 추가*/
function showChatinComu(memberId){
	if(memberId != '${user_id}'){
	   var pop = window.open("showChatinComu?member_id="+memberId,"chat","width=1220,height=690px,resizable=no,scrollbars=no;");
	}
}
</script>

<script>
$(function(){
//이전글
$("#preDoc").on("click",function(){
	var Pre = $(this).data("pre");
	location.href="getSchComm?comm_no="+Pre
	});
//다음글 
	$("#nxtDoc").on("click",function(){
		var Next = $(this).data("next");
		location.href="getSchComm?comm_no="+Next
		}); 
	});
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
}
</script>
<style type="text/css">
#comm_title {  width:836px;
               padding:5px;
               height:32px !important; }
#title > h1 { font-size: 35px;
              color: #00cc99; } 
.after { display:none; }
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
			<h1 style="font-weight: bolder;">커뮤니티 상세보기</h1>
		</div><br/>
		<form id="frm" name="frm" action="updateComm" method="post">
		<input type="hidden" name="comm_no" value="${communityVO.comm_no}">
		<input type="hidden" name="page" value="${commPagingVO.page}">
		<div>
		<div style="margin-left:50px; margin-bottom:20px; float:left;" >
		</div>
	    <div style="float:left; padding-bottom:15px;">
	    <c:if test="${pre.comm_no != null}">
	    <button type='button' id="preDoc" class='col-auto mr-auto btn btn-outline-primary btn-sm' data-pre="${pre.comm_no}">이전글</button>&nbsp;&nbsp;
	    </c:if>
		<button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='getComm?comm_no=${communityVO.comm_no}&page=${pageNum}'">글목록</button>&nbsp;&nbsp;
		<c:if test="${next.comm_no != null}">
		<button type='button' id="nxtDoc" class='col-auto btn btn-outline-primary btn-sm' data-next="${next.comm_no}">다음글</button>
		</c:if>
		</div>
	    <c:if test="${user_id == communityVO.user_id}">
		<div style="margin-left:863px;">
		<button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='updateComm?comm_no=${communityVO.comm_no}&page=${pageNum}'">글 수정</button>
		&nbsp;&nbsp;
		<button type="button" class="btn btn-outline-primary btn-sm" onclick="deleteAlert()">글 삭제</button>
		</div>
		</c:if>
			<table class="table table-hover"  style ="table-layout: auto; width: 80%; table-layout: fixed;">
				<thead>
				<tr> 
					<td align="center" width="70" style="border-right:1px solid #dcdcdc; border-left:1px solid #dcdcdc;">작성자</td>
					<!--  커뮤니티 채팅팝업 - 20210422 송예솔 추가 -->
					<td align="center" width="100" style="font-size:18px; color: #00cc99;" class="chatId"><strong onclick="showChatinComu('${communityVO.user_id}')">${communityVO.user_id}</strong></td>
					<td align="center" width="80">지역</td>
					<td align="center" width="100">${communityVO.comm_adr}</td>
					<td align="center" width="70">말머리</td>
					<td align="center" width="80" style="border-right:1px solid #dcdcdc;">${communityVO.comm_subject}</td>
				</tr>
				<tr>
				   <td align="center" width="70" style="border-left:1px solid #dcdcdc; border-right:1px solid #dcdcdc;">작성일자</td>
				   <td align="center" colspan="2">${communityVO.comm_date}</td>
				   <td align="center" width="70">조회수</td>
				   <td align="center" colspan="2" width="80" style="border-right:1px solid #dcdcdc;">${communityVO.comm_hit}</td>
				</tr>
				<tr>
					<td align="center" width="80" style="border-left:1px solid #dcdcdc; border-right:1px solid #dcdcdc;">제 목</td>
					<td align="left" colspan="5" style="border-right:1px solid #dcdcdc;">${communityVO.comm_title}</td>   
				</tr>
				<tr>
					<td align="center" width="70" style="border-left:1px solid #dcdcdc; border-right:1px solid #dcdcdc; border-bottom:1px solid #dcdcdc;">내용</td>
					<td colspan="5" align="left" style="height:400px; border-bottom:1px solid #dcdcdc; border-right:1px solid #dcdcdc;" >${communityVO.comm_content}</td>
				</tr>
				</thead>
			</table></div>
			</form></div>
			
	<div class="container">
	<div class="replyItem">
		<c:forEach items="${reply}" var="reply">
		<div class="reply" style="float:left; width:1000px; margin-left:56px; margin-right:70px;">
		<hr style="margin-bottom:5px; margin-top:4px;">
			<input type="hidden" id="comm_rep_no" name="comm_rep_no" value="${reply.comm_rep_no}">
			<span class="reply-user_id" style="float:left; width:100px; margin-left:40px; font-size:18px; color: #00cc99;">
			<strong>${reply.user_id}</strong></span>
			<span class="reply-comm_rep_content before" style="padding-left:7px; display:inline-block; width:650px;">${reply.comm_rep_content}</span>
			<input class="after" type="text" name="content" value="${reply.comm_rep_content}" style="width:700px;">
			<div class="before" style="float:right;">
			  <c:if test="${user_id == reply.user_id}">
				<button type='button' id="update" class='btn btn btn-outline-info btn-sm' onclick="btnChg1()">수정</button>
				<button type='button' id="delete" class='btn btn-outline-danger btn-sm' onclick='deleteReply(${reply.comm_rep_no})'>x</button>
              </c:if>			
			</div>
			<div class="after" style="float:right;">
				<button type="button" id="btnUp" class="btn btn btn-outline-info btn-sm">저장</button>
			</div>
			<!-- 목록 뿌리는 건 제이슨으로 가져오는 게 아니고 단건 조회 할 때 댓글리스트까지 같이 가져오는 거기때문에 이렇게 형변환을 따로 시켜줘야한다. vo에 적은 데이터포맷은 여기서 적용이 안 됨 -->
			<span class="reply-comm_rep_date" style="float:right;"><fmt:formatDate value="${reply.comm_rep_date}" pattern="yyyy-MM-dd"/>　</span>
			</div>
		</c:forEach>
		</div>  
		   <c:if test="${user_id != null && user_id != ''}">
            <div style="margin-left:48px; margin-right:70px;">
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width:1000px; border-color:#bebebe;" rows="3" cols="30" id="comm_rep_content" name="comm_rep_content" placeholder="댓글을 입력하세요 (166자까지 가능합니다.)"></textarea>
                            <br>
                               <div class="form-group">
				               <button type="button" id="btnAdd" class="btn btn-outline-primary">등록</button>
			                  </div>       
                        </td>
                    </tr>
                </table>
            </div> 
           </c:if> 
         </div>
</section>
</body>
</html>