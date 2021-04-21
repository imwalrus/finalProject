<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row" align="center">
	<h4>상세 주문</h4>
	<table class="table" id="orderview">
		<tr>
			<th class="table-success">상세주문번호</th>
			<th class="table-success">주문상품</th>
			<th class="table-success">수량</th>
			<th class="table-success">주문금액</th>
			<th class="table-success">주문상태</th>
			<th class="table-success">송장번호</th>
		</tr>
	</table>
</div>


<script type="text/javascript">
$.ajax({
		url:"ajaxgetOrder",
		data:  "order_no=" + "<%= request.getAttribute("order_no") %>",
		dataType:"json",
		success: function(response) {
			for(i=0; i<response.length; i++){
				if(response[i].orderlist_invoice!= '-'){
					$("#orderview").append(
						"<tr><td>" + response[i].orderlist_no  + "</td><td>"
						+ response[i].pro_name + "</td><td>"
						+ response[i].cart_count + "</td><td>"
						+ response[i].account +"원"+ "</td><td>"
						+ response[i].orderlist_condition + "</td><td>"
						+"<a href='#' onclick="+"window.open("+"'https://tracker.delivery/#/kr.cjlogistics/"+ response[i].orderlist_invoice +"','_blank','width=800,height=600');" + " return false;>"
						+ response[i].orderlist_invoice + "</a></td></tr>"
						);
				}else{
					$("#orderview").append(
							"<tr><td>" + response[i].orderlist_no  + "</td><td>"
							+ response[i].pro_name + "</td><td>"
							+ response[i].cart_count + "</td><td>"
							+ response[i].account +"원"+ "</td><td>"
							+ response[i].orderlist_condition + "</td><td>"
							+ response[i].orderlist_invoice + "</td></tr>"
							);
					
				}
			}
		}
</script>