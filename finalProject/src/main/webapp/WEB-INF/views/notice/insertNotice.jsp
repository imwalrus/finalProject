<%@ page contentType="text/html;charset=utf-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>청년농장</title>
<style type="text/css">
#notice_title {  padding:5px;
                 height:32px !important; }
#title > h1 {
       font-size: 35px;
       color: #00cc99;
            } 
</style>
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
    
   <section class="ftco-section contact-section">
       <div align="center" style="margin-left:400px; margin-right:400px;">
		<div id="title" style="margin-left:100px;">
			<h1>공지사항 작성하기</h1>
		</div><br/>
		<div>
			<form id="frm" name="frm" action="insertNotices" method="post">
				<table class="table table-hover" style ="table-layout: auto; width: 80%; table-layout: fixed;">
                <thead>
				<tr>
				    <td align="center" width="15%">제목</td>
					<td align="left" width="55%"><input class="form-control" type="text" id="notice_title" name="notice_title" size=70 required="required"></td>
					<td align="center" width="15%">분류</td>
					<td align="center" width="15%">
					<select name="notice_category" id="notice_category">
					<option value="관련기사">관련기사</option>
					<option value="관련공문">관련공문</option>
					<option value="농산물가격">농산물가격</option>
					<option value="축제,박람회">축제,박람회</option>
					</select></td>
				</tr>			
				<tr>
					<td align="center" width="70">내용</td>
					<td colspan="3" align="left"><textarea class="form-control" rows="7" cols="115" id="notice_content" name="notice_content" required="required"></textarea></td>
				</tr>
				<thead>
			</table><br/>
				
			<div style="margin-left:100px;">
			<button class="btn btn-outline-primary" type="submit">저장하기</button> &nbsp;&nbsp;
			<button class="btn btn-outline-primary" type="reset">취소</button> &nbsp;&nbsp;
		    </div>
	</form>
	</div><br/>	
	</div>
    </section>
</body>
</html>