<%@ page contentType="text/html;charset=utf-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>청년농장</title>
<style type="text/css">
#faq_title {  padding:5px;
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
			<h1>FAQ 작성하기</h1>
		</div><br/>
		<div>
			<form id="frm" name="frm" action="insertFaq" method="post">
				<table class="table table-hover" style ="table-layout: auto; width: 80%; table-layout: fixed;">
                <thead>
				<tr>
				    <td align="center" width="15%">제목</td>
					<td align="left" width="55%"><input class="form-control" type="text" id="faq_title" name="faq_title" size=70></td>
					<td align="center" width="15%">분류</td>
					<td align="center" width="15%">
					<select name="faq_category" id="faq_category">
					<option value="농업지식">농업지식</option>
					<option value="교육/기타">교육/기타</option>
					<option value="정책/금융">정책/금융</option>
					<option value="주택">주택</option>
					<option value="농지">농지</option>
					</select></td>
				</tr>			
				<tr>
					<td align="center" width="70">내용</td>
					<td colspan="3" align="left"><textarea class="form-control" rows="7" cols="115" id="faq_content" name="faq_content"></textarea></td>
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