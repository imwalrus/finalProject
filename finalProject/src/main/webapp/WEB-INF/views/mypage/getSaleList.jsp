<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>    

	<section class="pcoded-main-container">
    <div class="pcoded-main-container">
        <div class="pcoded-content">
            <div class="row">
                <div class="col-md-10">
                    <div class="card">
                        <div class="card-body" align="center">

                            <!-- [ Contextual-table ] start -->
                            <div class="col-md-12">
                                <div class="card-header">
                                    <h2>판매 내역</h2>
                                </div>
                                <p style="float: right">최신순으로 정렬됩니다.</p>
                               <form action="updateOrder" method="post">
									<table class="table" id="sale">
										<tr class="table-success">
											<th>주문번호-상세</th>
											<th>판매제품</th>
											<th>수량</th>
											<th>결제금액</th>
											<th>결제수단</th>
											<th>구매자</th>
											<th>주문상태</th>
											<th>송장번호</th>											
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
        
        
        
        <!-- 송장번호 등록모달 -->
			<div class="modal fade" id="invoiceUp"
				tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
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
		<!-- 모달끝 -->
</section>
<script type="text/javascript">
function invoiceUp(str,con,inv) {
	$('#invoiceUp .modal-body').load("updateOrder?orderlist_no=" + str + "&orderlist_condition=" + con + "&orderlist_invoice=" + inv);
	$('#invoiceUp').modal('show');
}
$.ajax({
	url: "ajaxgetSaleList",
	data: "user_id=" + '${user_id}',
	dataType: "json",
	success: function(data){		
		if(data.length == 0){	//판매내역없음
				$("#sale").append(
						"<tr><td colspan='9'> 판매내역이 없습니다. </tr></td>"
						);
		}else{					//판매내역 있는 경우
			for(i=0; i<data.length; i++){
				if(data[i].orderlist_invoice == '-'){				
					$("#sale").append(
						"<tr><td>" + data[i].order_no + "-" + data[i].orderlist_no + "</td><td>" 
						+ data[i].pro_name + "</td><td>" 
						+ data[i].cart_count + "</td><td>"
						+ data[i].account + "원</td><td>"
						+ data[i].order_payment + "</td><td>"
						+ data[i].buyer + "</td><td>"
						+ data[i].orderlist_condition +"<br>"
						+ "(" + data[i].pro_dcompany + ")" +"<br>"
						+ data[i].orderlist_invoice  + "</td><td>"
						+  "<button type='button' class='btn  btn-warning btn-sm' onclick=\"invoiceUp(" + data[i].orderlist_no + ",\'"+  data[i].orderlist_condition + "',\'"+  data[i].orderlist_invoice +"\')\">" + "송장번호<br>등록/수정"+ "</button>"
						+"</td></tr>"
						);
				}else{ //송장번호 값 - 일 경우 클릭 X 
					$("#sale").append(
						"<tr><td>" + data[i].order_no + "-" + data[i].orderlist_no + "</td><td>" 
						+ data[i].pro_name + "</td><td>" 
						+ data[i].cart_count + "</td><td>"
						+ data[i].account + "원</td><td>"
						+ data[i].order_payment + "</td><td>"
						+ data[i].buyer + "</td><td>"
						+ data[i].orderlist_condition +"<br>"
						+ "(" + data[i].pro_dcompany + ")" +"<br>"
						+"<a href='#' onclick="+"window.open("+"'https://tracker.delivery/#/kr.cjlogistics/"+ data[i].orderlist_invoice + "','_blank','width=800,height=600');" + " return false;>"
						+ data[i].orderlist_invoice  + "</a></td><td>"
						+ "<button type='button' class='btn  btn-warning btn-sm' onclick=\"invoiceUp(" + data[i].orderlist_no + ",\'"+  data[i].orderlist_condition + "',\'"+  data[i].orderlist_invoice +"\')\">" + "송장번호<br>등록/수정"+ "</button>"
						+"</td></tr>"
						);
					
			}
		}
			}
			 
		}

	});
	
	
	
</script>