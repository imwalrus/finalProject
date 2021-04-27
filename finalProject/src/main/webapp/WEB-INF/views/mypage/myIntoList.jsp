<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="resources/main/css/style.css">

<style>
.table th{
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
<body>
	<section class="pcoded-main-container">
    <div class="pcoded-main-container">
        <div class="pcoded-content">
            <div class="row">
                <div class="col-md-10">
                    <div class="card">
                        <div class="card-body" align="center">
                         
                            <div class="col-md-12">
                                <div class="card-header">
                                    <h2>농촌속으로</h2><h6>(나의 신청 목록)</h6>
                                </div>
                                 <div style="float: right">
									<button type=button class="btn  btn-success btn-sm"
											onclick="movePage()">농촌속으로 이동 > </button><br>
									<p style="float: right">신청취소는 담당자에게 별도 연락하셔야 합니다.</p>
							     </div>
							     <form id="myListFrm" name="myListFrm" action="myIntoList">					       
										<table class="table" id="mylist">
												<tr class="able table-hover">
													<th width="5%">신청번호</th>
													<th width="70%">체험이름</th>
													<th width="5%">체험일자</th>
													<th width="5%">신청인원</th>
													<th width="5%">보상</th>
													<th width="10%">담당자연락처</th>										
												</tr>			
										</table>
								</form>
                            </div>
                        </div>
                    </div>
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
			
					if(data.length == 0 ){
						$("#mylist").append(		
								"<tr><td colspan='6'> 신청하신 농촌속으로 내역이 없습니다. </td><td>"
						);	

					}
					else{
						for(i=0; i<data.length; i++) {
							$("#mylist").append(		
							"<tr><td>" + data[i].into_req_num + "</td><td style='text-align: left; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;'>"
							+ data[i].into_title + "</td><td>"
							+ data[i].into_req_dates + "</td><td>"
							+ data[i].into_entry + "</td><td>"
							+ data[i].into_req_reward + "</td><td>"
							+ data[i].into_req_phone + "</td></tr>"
							
							);
								}
												
					}
				
			}
		});
		
	
	/* 농촌속으로 이동 */
	function movePage(){
		location.href="getFarmList";
		
	}
	</script>
</body>
</html>
	