<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getAccountList.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<table border="1">
<tr>
	<td align="center">은행</td>
	<td align="center">이름</td>
	<td align="center">용도</td>
	<td align="center">계좌번호</td>
	<td align="center">핀테크이용번호</td>
	<td align="center">잔액조회</td>
</tr>
<c:forEach var="bank" items="${list.res_list}">
<tr>
	
	<td>${bank.bank_name}</td>
	<td>${bank.account_holder_name}</td>
	<td>${bank.account_alias}</td>
	<td>${bank.account_num_masked}</td>
	<td>${bank.fintech_use_num}</td>
	<td><button type="button" onclick="getBalanceAjax('${bank.fintech_use_num}')">ajax</button>
		<button type="button" onclick="getBalanceHtml('${bank.fintech_use_num}')">HTML</button>
		<button type="button" onclick="location.href='getBalance?fintech_use_num=${bank.fintech_use_num}'">이동</button></td>
</tr>
</c:forEach>
</table>
<div id="result">
</div>
<script>
	function getBalanceAjax(fin) {
		// ajax 호출
 			$.ajax({
				url : "ajaxGetBalance",
				data : {fintech_use_num : fin}, // "fintech_use_num=" + fin;
				dataType : "json",
				success : function(balance) {
					$("#result").empty();
					$("#result").append("은행: " + balance.bank_name + "<br>")
								.append("상품명: " + balance.product_name + "<br>")
								.append("계좌잔액: ￦ " + balance.balance_amt + "<br>")
								.append("출금가능금액: ￦ " + balance.available_amt + "<br>");
				}
			}) 
		};
	function getBalanceHtml(fin) {			
		// html 호출
			$.ajax({
				url : "getBalance",
				data : {fintech_use_num : fin}, // "fintech_use_num=" + fin;
				success : function(balance) {
					$("#result").html(balance);
				}
			})
		};
</script>
</body>
</html>