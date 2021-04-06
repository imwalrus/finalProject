<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
<script>
	$(document).ready(function(){
		connect();
		
		//메세지 입력 후 enter키 누르면 메세지 전송
		 $('#message').keypress(function(event){
			  var keycode = (event.keyCode ? event.keyCode : event.which);
				  if(keycode == '13'){
					  sendMessage();
			  }
			event.stopPropagation();
		});
		
		 $('#sendBtn').click(function() {
			 sendMessage(); 
		 }); 
	})
	
	var sock;
	
	function connect(){
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
	//message에 담을 값 전역변수 선언하고 보내기
	var sendMsg={};
	function sendMessage(){
		var msg = $('#message').val();
		var time = getTimeStamp();
		if(msg != ""){
			sendMsg.msg_type ="CHAT"; 
			sendMsg.msg_sender="${user_id}";
			sendMsg.msg_content=msg;
			sendMsg.chatroom_no = $('#chatroom_no').val();
			sendMsg.msg_receiver= $('#msg_receiver').val();
			sendMsg.msg_sendtime= time;
			//json 타입으로 변환하여 메세지 전달
			//전송 후 value 값 초기화
			msg = JSON.stringify(sendMsg);
			console.log("전송할 msg =====>" + msg);
			sock.send(msg); 
			$('#message').val("");
			appendMessage(sendMessage);
		}

	}
	//메세지 수신
	function onMessage(evt){
		var receive = evt.data.split(",");
 		const data = {
				"msg_type" : receive[0],
				"msg_sender" : receive[1],
				"msg_receiver" : receive[2],
				"msg_content": receive[3]
		};
 		appendMessage(data);
	}
	
	function onError(evt){
		console.log(evt);
	}
		
	
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
	
	
	function appendMessage(msg) {
		 if(msg == ''){
			 return false;
		 }else{
			 var t = getTimeStamp();
		 }
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
      <div class="chatMiddle">
	      <div class="row no-gutters">
	          <div class="col-md-3">
	            <div class="chat-bubble chat-bubble--left">
	            	보내는 메세지 1234564123435 보내는 메세지 1234564123435 보내는 메세지 1234564123435 보내는 메세지 1234564123435 
	            </div>
	            <div style="float:left">
	              <span class="time text-muted small">00:00:00 06.04.2021</span>
	          	</div>
	          </div>

	        </div>
	        <div class="row no-gutters">
	          <div class="col-md-3 offset-md-9">
	            <div class="chat-bubble chat-bubble--right" >
	            	보내는 메세지 1234564123435 보내는 메세지 1234564123435 보내는 메세지 1234564123435 보내는 메세지 1234564123435 
	            </div>
	          </div>
	          <div style="float:right">
	              <span class="time text-muted small">00:00:00 06.04.2021</span>
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
    <c:if test="${room ne null}" >
	    <form class="hideForm">
	    	<input type="hidden" id="msg_sender" value="">
	    	<input type="hidden" id="msg_receiver" value=""> 
	    	<input type="hidden" id="chatroom_no" value="">
	    </form>
    </c:if>
    


</div>
</div> <!-- end of container -->
</body>
</html>
