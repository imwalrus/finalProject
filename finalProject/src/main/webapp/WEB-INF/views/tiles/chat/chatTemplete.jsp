<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 대화창</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css'>
  <link rel="stylesheet" href="resources/chat/style.css">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>	
  <script  src="resources/chat/script.js" ></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.2/sockjs.js"></script>
<style>
	.chat-bubble{
		width: 350px !important;
		font-size: small;
	}
	.offset-md-9 {
	   	margin-left: 46% !important;
	}
	.chat-bubble--right{
		text-align:right !important;
	}
	.container{
		height:600px !important; 
	}
	.sendBtn{
		cursor:pointer;
	}
</style>
</head>
<body>
	<tiles:insertAttribute name="content"/>
</body>
</html>