<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 대화창</title>
<!--   <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'> -->
  <link rel="stylesheet" href="resources/chat/bootstrap.min.css">
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css'>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link rel="stylesheet" href="resources/chat/style.css">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>	
  <script  src="resources/chat/script.js" ></script>
  <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<style>
	body{
		font-family: 'InfinitySans-RegularA1';
	}
	.chat-bubble{
		width: 290px !important;
		font-size: small;
	}
	.offset-md-9 {
	   	margin-left: 53% !important;
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
	.col-md-3{
		max-width:100% !important;
	}
	.chatMiddle{
		overflow:auto;
		height:474px;
	}
	.chat-box-tray {
		    margin-top: 0px !important;
	}
	.chatList{
		overflow:auto;
		height:530px;
		/* height:482px; */
	}
	#message{
		padding-left: 15px;
		width: 85%;
	}
	#sendMsg, .material-icons{
		cursor:pointer;
	}
	.noList{
		text-align:center;
		margin-top:170px;
	}
 	.firstPage{
		height:600px;
		width:760px !important;
	}
	#unReadNum{
		background-color: #ffc107;
	    color: #fbfbfb;
	    font-weight: bold;
	    border-radius: 50%;
	    width: 40px;
	    height: 40px;
	    text-align: center;
	    padding: 9px;
    	font-size: 12px;
	} 


</style>
</head>
<body>
	<tiles:insertAttribute name="content"/>
</body>
</html>