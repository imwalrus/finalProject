<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="resources/main/css/style.css">
<style>
.table th{
background-color: #c3e6cb;
font-weight: bold;
}
#progress{
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
					<form id="doExit" name="doExit" action="updateFarmExit">
                            <div class="col-md-12">
                                <div class="card-header">
                                    <h2>농촌속으로 신청 명단 관리</h2>
                                </div>
                                <br>
                                 <div style="float: right">
									<button type=button class="btn  btn-success btn-sm"
											onclick="bongsaOpen()">봉사활동 양식출력</button>
							     </div>
							     <br>
									<table class="table" id="list">
										<tr class="table-success">
											<th width="5%">NO</th>
											<th width="60%">체험명</th>
											<th width="5%">지역</th>
											<th width="5%">농작물</th>
											<th width="5">완료여부</th>
											<th	width="10%">신청명단</th>										
										</tr>																	
									</table>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 확인서모달시작 -->
			<div class="modal fade bd-example-modal-lg" id="bongsa" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
					<div class="modal-header">
							<button class="close" type="button" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">x</span>
							</button>
						</div>
						<div class="modal-body"></div>
					
					</div>
				</div>
			</div>
		<!-- 끝 -->
</div>
</section>

		 <!-- 신청명단 모달시작 -->
			<div class="modal fade bd-example-modal-lg" id="userList" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
					<div class="modal-header">
							<button class="close" type="button" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">x</span>
							</button>
						</div>
						<div class="modal-body"></div>
					</div>
				</div>
			</div>
		<!-- 끝 -->

	<script type="text/javascript">
	
	function bongsaOpen() {
		$('#bongsa .modal-body').load("bongsaFile");
		$('#bongsa').modal();

	}
	
	function userListOpen(str) {
		$('#userList .modal-body').load("intoUserList?into_no=" + str);
		$('#userList').modal();

	}
	
	
	$.ajax({
		url:"ajaxfarmerIntoList",
		data: "user_id=" + '${user_id}',
		dataType: "json",
		success: function(data){
			for(i=0; i<data.length; i++){
				if(data[i].into_progress == 0){	
				$("#list").append(
					"<tr><td>" + data[i].into_no + "</td><td>" 
					+ data[i].into_title + "</td><td>"
					+ data[i].into_city + "</td><td>"
					+ data[i].into_product + "</td><td id='progress" + i + "'>"
					+ "진행중<br><button type='button' id='endBtn"+ i +"' class='btn  btn-success btn-sm' onclick='fndoexit(" + data[i].into_no + ")'>완료</button>" + "</td><td>"					
					+ "<button type='button' class='btn  btn-warning btn-sm' onclick='userListOpen(" + data[i].into_no + ")'>"+ "명단보기"+ "</button>"			
					+"</td></tr>" 	
					);
				}else{
					$("#list").append(
							"<tr><td>" + data[i].into_no + "</td><td>" 
							+ data[i].into_title + "</td><td>"
							+ data[i].into_city + "</td><td>"
							+ data[i].into_product + "</td><td id='progress" + i + "'>"
							+ "체험종료</td><td>"					
							+ "<button type='button' class='btn  btn-warning btn-sm' onclick='userListOpen(" + data[i].into_no + ")'>"+ "명단보기"+ "</button>"			
							+"</td></tr>" 
							);
				}
				}
			}

				});
	
	/*완료버튼 */ 
	function fndoexit(str){
		var yn = confirm("체험을 종료하시겠습니까? 종료 할 경우 재접수가 불가능합니다. ");
		var $target = event.target;		//클릭시 button 
		var tarId = $target.id			//버튼있는 줄의 Td id값 
		var num = tarId.slice(6) 		//id값에서 숫자만 추출
 		if (yn) {
			$.ajax({
				url:"updateFarmExit?into_no="+str,
				type:"post",
				data: str, //체험번호
				success:function(response){
					console.log("result:"+response);
					
					
						//$('#progress'+ j).text("체험종료");
						$target.remove();
						$('#progress'+num).text("체험종료");
						console.log( $('#progress'+num) );
	
					
					}  
				})
			
		} else {
			alert("취소 되었습니다.");
		} 
	}
	</script>
</body>