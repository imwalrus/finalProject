<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getBalance.jsp</title>
</head>
<body>
<table border="1">
<tr>
	<td>은행</td>
	<td>${balance.bank_name}</td>
</tr>
<tr>
	<td>상품명</td>
	<td>${balance.product_name}</td>
</tr>
<tr>
	<td>계좌잔액</td>
	<td>￦ ${balance.balance_amt}</td>
</tr>
<tr>
	<td>출금가능금액</td>
	<td>￦ ${balance.available_amt}</td>
</tr>
</table>
</body>
</html>