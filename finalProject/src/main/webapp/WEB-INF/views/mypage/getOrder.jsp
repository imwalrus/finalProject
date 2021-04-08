<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row" align="center">
	<h4>상세 주문</h4>
	<table class="table" id="orderview">
		<tr>
			<th class="table-success">주문번호</th>
			<th class="table-success">주문상품</th>
			<th class="table-success">수량</th>
			<th class="table-success">주문금액</th>
			<th class="table-success">주문상태</th>
			<th class="table-success">송장번호</th>
		</tr>
	</table>
</div>



<script src="resources/admin/js/vendor-all.min.js"></script>
<script src="resources/admin/js/plugins/bootstrap.min.js"></script>
<script src="resources/admin/js/ripple.js"></script>
<script src="resources/admin/js/pcoded.min.js"></script>

<script type="text/javascript">
$.ajax({
		url:"ajaxgetOrder",
		data:  {order_no :  1 },
		dataType:"json",
		success: function(response) {
			for(i=0; i<response.length; i++){
				$("#orderview").append(
						"<tr><td>" + response[i].order_no  + "</td><td>"
						+ response[i].pro_name + "</td><td>"
						+ response[i].cart_count + "</td><td>"
						+ response[i].account +"원"+ "</td><td>"
						+ response[i].order_condition + "</td><td>"
						+ response[i].orderlist_invoice + "</td></tr>"
						);
			
			}
			
			
		}
	
	
	
})



</script>