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
		//채팅 리스트 불러오기
		$.ajax({
			url: 'getChatRoomList',
			data: {"user_id_one":"${user_id}"},
			dataType: 'json',
			success:function(result){
				if(result != null){
					console.log(result);
/* 					$(".col-md-4 border-right").append(
							$("<div class='friend-drawer friend-drawer--onhover'>"
							+'<div class="text">'
							+'<h6>'+  +'</h6>'
							+'<p class="text-muted">'+ +'</p></div>'
				      	 	+'<i class="material-icons">exit</i>'
				   			+'</div><hr>')
					)
				} else {
					$(".col-md-4 border-right").append(
							$("<div class='friend-drawer friend-drawer--onhover'>"
							+'<div class="text">'
							+'<h6>'+  +'</h6>'
							+'<p class="text-muted">'+ +'</p></div>'
				      	 	+'<i class="material-icons">exit</i>'
				   			+'</div><hr>')
				} */
			}
		});
					
		//메세지 입력 후 enter키 누르면 메세지 전송
		 $('#message').keypress(function(event){
			  var keycode = (event.keyCode ? event.keyCode : event.which);
				  if(keycode == '13'){
					  sendMessage();
			  }
			event.stopPropagation();
		});
		
/* 		 $('#sendBtn').click(function() {
			 sendMessage(); 
		 });  */
		 
	})
	
	var sock;
	
	function connect(){
		sock = new SockJS('http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/chat');
/* 		sock.onopen = onOpen; */ // onopen이 있으면 현재 세션에 저장되어있는 사람에게만 전송이 가능하다.
		sock.onerror=onError;
		sock.onmessage = onMessage; 
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
			sendMsg.msg_recevier= "a0405";
			sendMsg.msg_content=msg;
			sendMsg.chatroom_no = 1;
			sendMsg.msg_sendtime= time;
			//json 타입으로 변환하여 메세지 전달
			//전송 후 value 값 초기화
			appendMessage(sendMsg);
			msg = JSON.stringify(sendMsg);
			sock.send(msg); 
			$('#message').val("");
		}

	}
	//메세지 수신
	function onMessage(evt){
		var receive = evt.data.split(",");
		var time = getTimeStamp();
 		const data = {
				"msg_sender" : receive[0],
				"msg_receiver" : receive[1],
				"msg_content": receive[2],
				"msg_sendtime" : receive[3]
		};
 		//메세지를 수신했을 떄 보낸이가 현재 자신의 아이디가 아닐 경우에만 화면에 추가
 		if(data.msg_sender != "${user_id}"){
 			appendMessage(data);
 		}
	}
	
	function onError(evt){
		console.log(evt);
	}
	
	function getTimeStamp() {
		  var d = new Date();
		  var s =
		    leadingZeros(d.getFullYear(), 4) + '.' +
		    leadingZeros(d.getMonth() + 1, 2) + '.' +
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
 			 if(msg.msg_sender == "${user_id}"){
				 $('.chatMiddle').append(
						 $('<div class="row no-gutters"><div class="col-md-3 offset-md-9">'
								 +'<div class="chat-bubble chat-bubble--right"><p style="margin-bottom:0px">'
								 + msg.msg_content +'</p>'
				            	 +'<span class="time text-muted small" style="font-size:11px; margin-right:63%">'
				            	 +msg.msg_sendtime+'</span>'
				            	 +'</div></div></div>')
				          );
			 } else {
				 $('.chatMiddle').append(
					$('<div class="row no-gutters"><div class="col-md-3"><div class="chat-bubble chat-bubble--left"><p style="margin-bottom:0px">'
							+msg.msg_content+'</p>'
							+'<span class="time text-muted small" style="font-size:11px; margin-left:63%">'+msg.msg_sendtime+'</span>'
							+'</div></div></div>')		 
				 );
			 } 
		 }
	} // end of appendMessage()

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
      <!-- 채팅 리스트 동적생성...? -->
      </div>
    <!-- 대화리스트 받는 화면 끝 -->
    <!-- 대화 보내고 받는 화면 시작 -->
    <div class="col-md-8">
      <div class="settings-tray">
        <div class="friend-drawer no-gutters friend-drawer--grey">
          <div class="text">
            <h6>상대방 이름...</h6>
            <p class="text-muted">상대방 이름과 대화</p>
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
	      	<!-- 주고받은 메세지 동적생성! -->
	      	
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

<!-- 채팅방 클릭시 채팅방 번호, 채팅방 참여자 정보 담고있음... -->
	<form>
		<input type="hidden" name="chatRoom_no">
		<input type="hidden" name="user_id_one">
		<input type="hidden" name="user_id_two">
	</form>
	
</body>
</html>