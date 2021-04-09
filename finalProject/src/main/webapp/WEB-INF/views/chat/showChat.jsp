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
<<<<<<< HEAD
		//채팅 리스트 불러오기
		$.ajax({
			url: 'getChatRoomList',
			data: {"user_id_one":"${user_id}"},
			dataType: 'json',
			success:function(result){
 				if(result != null){
 					for(var i = 0; i<result.length; i++){
						if(result[i].user_id_one =="${user_id}"){
		 					$(".chatList").append(
									$("<div class='friend-drawer friend-drawer--onhover'>"
									+"<img class='profile-image' src='https://www.clarity-enhanced.net/wp-content/uploads/2020/06/robocop.jpg'>"
									+'<div class="text">'
									+'<h6>'+ result[i].user_id_two +'</h6>'
									+'<p class="text-muted" data-no="'+result[i].chatRoom_no+'"></p></div>'
						      	 	+'<i class="material-icons">logout</i>'
						   			+'</div><hr>')
							)
						} else {
		 					$(".chatList").append(
									$("<div class='friend-drawer friend-drawer--onhover'>"
									+"<img class='profile-image' src='https://www.clarity-enhanced.net/wp-content/uploads/2020/06/robocop.jpg'>"
									+'<div class="text">'
									+'<h6>'+ result[i].user_id_one +'</h6>'
									+'<p class="text-muted" data-no="'+result[i].chatRoom_no+'"></p></div>'
						      	 	+'<i class="material-icons">logout</i>'
						   			+'</div><hr>')
							)
						}
 					}
				} else {
					$(".chatList").append(
							$("<div class='friend-drawer friend-drawer--onhover'>"
							+"<img class='profile-image' src='https://www.clarity-enhanced.net/wp-content/uploads/2020/06/robocop.jpg'>"
							+'<div class="text">'
							+'<h6>'+  +'</h6>'
							+'<p class="text-muted">'+ +'</p></div>'
				      	 	+'<i class="material-icons">exit</i>'
				   			+'</div><hr>')
				   	)		
				}  
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
      <div class="chatList">
      	<!-- 대화리스트 동적생성... -->
      </div>
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
=======
		
		//메세지 입력 후 enter키 누르면 메세지 전송
		 $('#message').keypress(function(event){
			  var keycode = (event.keyCode ? event.keyCode : event.which);
				  if(keycode == '13'){
					  sendMessage();
			  }
			event.stopPropagation();
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
	function sendMessage(){
		var msg = $('#message').val();
		if(msg != ""){
			const data = {
					"msg_type" : "CHAT",
					"msg_sender" : "${user_id}",
					"msg_receiver" : "",
					"msg_content": msg,
					"chatroom_no" : ""  };
			
			//json 타입으로 변환하여 메세지 전달
			//전송 후 value 값 초기화
			msg = JSON.stringify(data);
			sock.send(msg); 
			$('#message').val("");
			appendMessage(data);
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
	
    // * 2-1 추가 된 것이 내가 보낸 것인지, 상대방이 보낸 것인지 확인하기
    function CheckLR(data) {
        // email이 loginSession의 email과 다르면 왼쪽, 같으면 오른쪽
        const LR = (data.user_id != ${user_id}) ? "left" : "right";
         // 메세지 추가
        appendMessageTag(LR, data.email, data.message, data.name);
    }
     
    // * 3 메세지 태그 append
    function appendMessageTag(LR_className, email, message, name) {
        const chatLi = createMessageTag(LR_className, email, message, name);
        $('div.chatMiddle:not(.format) ul').append(chatLi);
        // 스크롤바 아래 고정
        $('div.chatMiddle').scrollTop($('div.chatMiddle').prop('scrollHeight'));
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
		
/* 		 $.ajax({
			 url:,
			 type:,
			 dataType:"json",
			 data:{
				 chatroom
			 }
		 }) */
		 
	
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
	

	 $('#sendBtn').click(function() {
		 send(); 
	 }); 
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
	             <div class="showTime" style="display:block">
	              	<span class="time text-muted small">00:00:00 06.04.2021</span>
	             </div>
	          </div>
	        </div>
	        <div class="row no-gutters">
	          <div class="col-md-3 offset-md-9">
	            <div class="chat-bubble chat-bubble--right" >
	            	받는 메세지
	            </div>
	            <div class="showTime" style="display:block">
	              <span class="time text-muted small">00:00:00 06.04.2021</span>
	             </div>
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
    <form class="hideForm">
<%--     	<input type="hidden" value="${chatRoomVO. }"> --%>
    	<input type="hidden" value="">
    	<input type="hidden" value=""> 
    	<input type="hidden" value="">
    </form>

</div>
</div> <!-- end of container -->
</body>
</html>
>>>>>>> refs/heads/이재일
