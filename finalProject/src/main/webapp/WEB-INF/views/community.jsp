<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>청년농장</title>
<script>
$(document).ready(function() {
	$("#comm_title").on('keyup', function() {
		$("#comm_content").val($(this).val())
	});
});
$(document).ready(function(){
	$("input:checkbox[name='comm_adrs']").val([${commPagingVO.getComm_adrs1()}])
});
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
</script>
<script>
function subjectChange() {
	comm_sch.submit();
    }
function adrChange() {
	comm_sch.submit();
    }
</script>
<script>
function selectAll(allChk)  {
	  const checkboxes 
	       = document.getElementsByName('comm_adrs');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = allChk.checked;
     })
}
/*커뮤니티 채팅팝업 - 20210422 송예솔 추가*/
function showChatinComu(memberId){
	if(memberId != '${user_id}'){
	   var pop = window.open("showChatinComu?member_id="+memberId,"chat","width=1220,height=690px,resizable=no,scrollbars=no;");
	}
}
</script>
<style type="text/css">
#comm_title {  width:170px; 
                 height:40px !important; }
#comm_subject {  width:120px; 
                    text-align: center;
                    margin:0px;
                    padding: 5px;
                    height:35px !important; }
#title > h1 {
       font-size: 35px;
       color: #00cc99;
       } 
#comm_adr {
       font-size: 18px;
          }
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
     <form action="getComm" name="comm_sch">
      <input type="hidden" name="page" value="1">
      <input type="hidden" id="comm_content" name="comm_content" value="${commPagingVO.comm_content}">
       <input type="hidden" id="user_id" name="user_id" value="${user_id}">
		<div class="area" align="center" style="margin-left:400px; margin-right:400px;">
		<div id="title">
			<h1 style="font-weight: bolder;">영농인 커뮤니티</h1>
		</div><br/>
		<div class="alert alert-dismissible alert-light" style="height:120px; padding-top:30px;">
			  <button type="button" class="close" data-dismiss="alert">&times;</button>
			  <h3 class="alert-heading">1:1 대화 기능이 추가되었습니다 🔔 </h3>
			  <p class="mb-0">커뮤니티 페이지에서 <strong>대화를 원하는 회원의 아이디를 클릭</strong>하시면 1:1 대화 기능을 사용하실 수 있습니다. 실시간 기능을 통해 소통해보세요!</p>
		</div>
		<hr style="margin:8px;"><br/>
		 <div align="left" class="row" id="comm_adr">
		 <div class="col-md-6" onchange="adrChange()">
		 지역 <br/>
         <input type='checkbox' name='comm_adrs' id="chk1" value='전체' onclick='selectAll(this)'/> 전체&nbsp;
         <input type='checkbox' name='comm_adrs' id="chk2" value='서울/경기/인천' /> 서울/경기/인천&nbsp;
         <input type='checkbox' name='comm_adrs' id="chk3" value='대전/세종/충청' /> 대전/세종/충청&nbsp;
         <input type='checkbox' name='comm_adrs' id="chk4" value='강원' /> 강원&nbsp;
         <input type='checkbox' name='comm_adrs' id="chk5" value='광주/전라' /> 광주/전라　　&nbsp;
         <input type='checkbox' name='comm_adrs' id="chk6" value='대구/경북' /> 대구/경북&nbsp;
         <input type='checkbox' name='comm_adrs' id="chk7" value='부산/울산/경남' /> 부산/울산/경남&nbsp;
         <input type='checkbox' name='comm_adrs' id="chk8" value='제주' /> 제주&nbsp;
         </div>
        <div class="col-md-4 ml-auto">
		<div class="form-group" style="margin-left:228px; padding-top:40px">
		<select class="form-control" id="comm_subject" name="comm_subject" onchange="subjectChange()">
		<option value="">말머리</option>
        <option value="정보공유"
        <c:if test ="${commPagingVO.comm_subject == '정보공유'}">
	             selected </c:if>>정보공유</option>
	    <option value="질문"
	    <c:if test ="${commPagingVO.comm_subject == '질문'}">
	             selected </c:if>>질문</option>
        <option value="일상"
        <c:if test ="${commPagingVO.comm_subject == '일상'}">
	             selected </c:if>>일상</option>
        <option value="고민"
        <c:if test ="${commPagingVO.comm_subject == '고민'}">
	             selected </c:if>>고민</option>
        </select>
		</div>
		</div>
		</div>
		<hr style="margin:8px;"><br/>
		<div align="center">
		<table class="table table-bordered" style="table-layout: fixed">
		 <thead>
				<tr>
					<td align="center" width="10%">글번호</td>
					<td align="center" width="10%">말머리</td>
					<td align="center" width="25%">제 목</td>
					<td align="center" width="10%">아이디</td>
					<td align="center" width="15%">지역</td>
					<td align="center" width="20%">작성일자</td>
					<td align="center" width="10%">조회수</td>
				</tr>
		<c:forEach items="${list}" var="comm">
		<tr>
         <td align="center" width="10%">${comm.comm_no}</td>
         <td align="center" width="10%">${comm.comm_subject}</td>
         <td align="left" width="25%" class="text-truncate" 
         onclick="location.href='getSchComm?comm_no=${comm.comm_no}&page=${paging.page}'">&nbsp; ${comm.comm_title}</td>
        <!--  커뮤니티 채팅팝업 - 20210422 송예솔 추가-->
         <td align="center" width="10%" class="chatId" onclick="showChatinComu('${comm.user_id}')">${comm.user_id}</td>
         <td align="center" width="15%">${comm.comm_adr}</td>
         <td align="center" width="20%">${comm.comm_date}</td>
         <td align="center" width="10%">${comm.comm_hit}</td>
        </tr>
        </c:forEach>
        </thead>
        </table><br/>
        </div>
        </div>
    
    <div class="row justify-content-around" style="margin-left:385px; margin-right:385px;">
    <div class="col-auto mr-auto">
    <c:if test="${user_auth == 'user' || user_auth == 'admin' }">  
    <button type="button" class="btn btn-primary disabled" onclick="location.href='insertComm'">글쓰기</button>
    </c:if>
    </div>
    
    <div class="col-auto">
    <input class="form-control" type="text" placeholder="Search..." id="comm_title" name="comm_title"
    value="${commPagingVO.comm_title}" onclick="this.select()">
    </div>
    </div>
    
    <my:paging paging="${paging}" jsFunc="goPage" />
    <script>
    function goPage(p) {
    //location.href="getComm?page=" +p;
    comm_sch.page.value= p;
    comm_sch.submit();
    }
    </script>
    </form>
    </section>
</body>
</html>