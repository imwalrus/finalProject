<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>1:1대화</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css'>
  <link rel="stylesheet" href="resources/chat/style.css">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>	
  <script  src="resources/chat/script.js" ></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.2/sockjs.js"></script>
<style>
	.chat-bubble{
		width: 400px !important;
	}
	.offset-md-9 {
	   	margin-left: 40% !important;
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
<script>
	$(document).ready(function(){
		connect();
	})
	
	var sock;
	
	function connect(){
		 /* var wsUri= "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/chat"; */
		sock = new SockJS('http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/chat');
		sock.onopen = onOpen;
		sock.onerror=onError;
		sock.onmessage = onMessage; 
	}
	//웹소켓에 연결 되었을때 호출될 함수
	function onOpen(){
		console.log("웹소켓 연결");
	}
	
	//메세지 전송
	function sendMessage(message){
		
	}
	
	//메세지 수신
	function onMessage(evt){
		
	}
	
	function onError(evt){
		console.log(evt);
	}
	
	
/* 	
	
	
	function getTimeStamp() {
	  var d = new Date();
	  var s =
	    leadingZeros(d.getFullYear(), 4) + '-' +
	    leadingZeros(d.getMonth() + 1, 2) + '-' +
	    leadingZeros(d.getDate(), 2) + ' ' +
	
	    leadingZeros(d.getHours(), 2) + ':' +
	    leadingZeros(d.getMinutes(), 2) + ':' +
	    leadingZeros(d.getSeconds(), 2);
	
	  return s;
	}
	
	function leadingZeros(n, digits) {
	  var zero = '';
	  n = n.toString();
	
	  if (n.length < digits) {
	    for (i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	}
	
	
	
	function appendMessage(msg) {
	
		 if(msg == ''){
			 return false;
		 }else{
	
	
		 var t = getTimeStamp();
		 $("#chatMessageArea").append("<div class='col-12 row' style = 'height : auto; margin-top : 5px;'><div class='col-2' style = 'float:left; padding-right:0px; padding-left : 0px;'><img id='profileImg' class='img-fluid' src='/displayFile?fileName=${userImage}&directory=profile' style = 'width:50px; height:50px; '><div style='font-size:9px; clear:both;'>${user_name}</div></div><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-12' style = ' background-color:#ACF3FF; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>"+msg+"</span></div><div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >"+t+"</span></div></div></div>")		 
	
		  var chatAreaHeight = $("#chatArea").height();
		  var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
		  $("#chatArea").scrollTop(maxScroll);
	
		 }
	}
	$(document).ready(function() {
	 $('#message').keypress(function(event){
	  var keycode = (event.keyCode ? event.keyCode : event.which);
	  if(keycode == '13'){
	   send();
	  }
	  event.stopPropagation();
	 });
	
	
	
	 $('#sendBtn').click(function() { send(); }); 
	});*/
</script>
</head>
<body>
<div class="container">
  <div class="row no-gutters">
  <!-- 대화리스트 받는 화면 시작 -->
    <div class="col-md-4 border-right">
      <div class="settings-tray">
      <img class="profile-image" src="resources/chat/images/chat1.png" alt="Profile img">
        <span class="settings-tray--right">
          <i class="material-icons">cached</i>
          <i class="material-icons">message</i>
          <i class="material-icons">menu</i>
        </span>
      </div>
      <div class="search-box">
        <div class="input-wrapper">
          <i class="material-icons">search</i>
          <input placeholder="Search here" type="text" >
        </div>
      </div>
	      <div class="friend-drawer friend-drawer--onhover">
	        <div class="text">
	          <h6>Robo Cop</h6>
	          <p class="text-muted">Hey, you're arrested!</p>
	        </div>
	        <span class="time text-muted small">13:21</span>
	      </div>
	      <hr>
      </div>
    <!-- 대화리스트 받는 화면 끝 -->
    <!-- 대화 보내고 받는 화면 시작 -->
    <div class="col-md-8">
      <div class="settings-tray">
        <div class="friend-drawer no-gutters friend-drawer--grey">
          <div class="text">
            <h6>Robo Cop</h6>
            <p class="text-muted">Layin' down the law since like before Christ...</p>
          </div>
          <span class="settings-tray--right">
            <i class="material-icons">cached</i>
            <i class="material-icons">message</i>
            <i class="material-icons">menu</i>
          </span>
        </div>
      </div>
      <div class="chat-panel">
        <div class="row no-gutters">
          <div class="col-md-3">
            <div class="chat-bubble chat-bubble--left">
            	보내는 메세지
              <span class="time text-muted small">04-05</span>
            </div>
          </div>
        </div>
        <div class="row no-gutters">
          <div class="col-md-3 offset-md-9">
            <div class="chat-bubble chat-bubble--right">
            	받는 메세지
              <span class="time text-muted small"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <div class="chat-box-tray">
              <i class="material-icons">sentiment_very_satisfied</i>
              <input type="text" placeholder="메세지를 입력해주세요." id="message">
              <i class="material-icons">send</i>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 대화 보내고 받는 화면 끝 -->

</div>
</div> <!-- end of container -->
</body>
</html>
