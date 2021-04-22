<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<link rel="stylesheet" href="resources/main/css/style.css">
<style>
.table th{
background-color: #c3e6cb;
font-weight: bold;
}
</style>
<body>
	<section class="pcoded-main-container">
    <div class="pcoded-main-container">
        <div class="pcoded-content">
            <div class="row">
                <div class="col-md-10">
                    <div class="card">
                        <div class="card-body" align="center">
                         <form id="myListFrm" name="myListFrm" action="myIntoList">
                            <div class="col-md-12">
                                <div class="card-header">
                                    <h2>농촌속으로<br>(나의 신청 목록)</h2>
                                </div>
                                 <div style="float: right">
									<button type=button class="btn  btn-success btn-sm"
											onclick="movePage()">농촌속으로 이동 > </button>
							     </div>
                                <div class="table-responsive">							       
									<table class="table" id="mylist">
										<tr class="table-success">
											<th>신청번호</th>
											<th>체험이름</th>
											<th>체험일자</th>
											<th>신청인원</th>
											<th>보상</th>
											<th>담당자연락처</th>										
										</tr>																	
									</table>
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>
                    <my:paging paging="${paging}" jsFunc="goPage" />  
                </div>
            </div>
        </div>
</div>
</section>
	<script type="text/javascript">
		$.ajax ({
			url:"ajaxmyIntoList",
			data: "user_id=" + '${user_id}',
			dataType:"json",
			success: function(data){				
				for(i=0; i<data.length; i++) {
					$("#mylist").append(		
					"<tr><td>" + data[i].into_req_num + "</td><td>"
					+ data[i].into_title + "</td><td>"
					+ data[i].into_req_dates + "</td><td>"
					+ data[i].into_entry + "</td><td>"
					+ data[i].into_req_reward + "</td><td>"
					+ data[i].into_req_phone + "</td></tr>"
					
					);
				}
			}
		});
		
		
	/* 페이징 값 넣기*/
	function goPage(p) {
		location.href="myIntoList?page=" + p + "&user_id=${user_id}";
    }
	
	/* 농촌속으로 이동 */
	function movePage(){
		location.href="getFarmList";
		
	}
	</script>
</body>
</html>
	