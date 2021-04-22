<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
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
	
	 $('body').on('click','#sendMsg',function(){
		sendMessage();
	});
	 
	 $('body').on('click','#deleteMsg', function(){
		 var result = confirm("채팅방을 삭제하시겠습니까? 삭제된 메세지는 복구되지 않습니다.");
		 if(result == true){
			 deleteMessage();
		 } else {
			 
		 }
	 });
	 
 	 $('.firstPage').show();
	 $('#listDiv').hide();
	 

})
</script>
<script>
	var sock;
		
	function connect(){
		sock = new SockJS('http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/chat');
/* 		sock.onopen = onOpen; */ 
		sock.onerror=onError;
		sock.onmessage = onMessage; 
		sock.onclose = onClose;
	}

	//메세지 전송
	//message에 담을 값 전역변수 선언하고 보내기
	var sendMsg={};
	function sendMessage(){
		var msg = $('#message').val();
		var member = $('[name=room_member]').val();
		var room = $('[name=room_id]').val();
		if(room == null){
			room = '0';
		}
		var time = getTimeStamp();
		if(msg != ""){
			sendMsg.msg_type = "CHAT"; 
			sendMsg.msg_sender ="${user_id}";
			sendMsg.msg_receiver = member;
			sendMsg.msg_content = msg;
			sendMsg.chatroom_no = room;
			sendMsg.msg_sendtime = time;
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
		console.log(evt);
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
 			 if(msg.msg_sender == "${user_id}"){
				 $('.chatMiddle').append(
						 $('<div class="row no-gutters"><div class="col-md-3 offset-md-9">'
								 +'<div class="chat-bubble chat-bubble--right">'
								 +'<p style="margin-bottom:0px">' + msg.msg_content +'</p>'
				            	 +'<span class="time text-muted small" style="font-size:10px; margin-right:59%">'
				            	 + msg.msg_sendtime+'</span>'
				            	 +'</div></div></div>')
				          );
			 } else {
				 $('.chatMiddle').append(
					$('<div class="row no-gutters"><div class="col-md-3">'
							+'<div class="chat-bubble chat-bubble--left">'
							+'<p style="margin-bottom:0px">'+msg.msg_content+'</p>'
							+'<span class="time text-muted small" style="font-size:10px;margin-left:59%;">'+msg.msg_sendtime+'</span>'
							+'</div></div></div>')		 
				 );
			 } 
		 }
			$('#chatMiddle').scrollTop($('#chatMiddle').prop('scrollHeight'));
	} // end of appendMessage()
	
	function onClose(evt){
		console.log("연결닫기 이벤트가 먹는지 체크...");
	}
	
</script>
<script>

	//새로고침 버튼 클릭시 리스트 reload 이벤트
	function listReload(){  
	     $('#container').load(location.href + '#container');
	}
	//방번호 값 받아서 해당하는 메세지 리스트 불러오기
	function listClick(roomId,user_id_one,user_id_two){
		if(user_id_one == '${user_id}'){
			$('[name=room_member]').val(user_id_two);
		} else {
			$('[name=room_member]').val(user_id_one);
		}
		
		 var member = $('[name=room_member]').val();
		 $('[name=room_id]').val(roomId);
		$.ajax({
			url:'getMessageList',
			data: {"chatroom_no":roomId , "msg_receiver":"${user_id}"},
			async:false,
			dataType: "json",
			success:function(list){ //list안에 data로 넘어옴
				console.log(list);
 				$('.firstPage').hide();
				$('#listDiv').show(); 
 				$('.chatMiddle').empty();
 		 		$('#memberName').find('h5').empty();
		 		$('#memberName').find('p').empty(); 
				for(var i=0; i<list.length;i++){
					if(list[i].msg_sender != "${user_id}"){
					 	 if(list[i].msg_readtime == null){
						 		updateReadTime(roomId);
						 	 }
						 $('.chatMiddle').append(
									$('<div class="row no-gutters"><div class="col-md-3">'
									 +'<div class="chat-bubble chat-bubble--left">'
									 +'<p style="margin-bottom:0px">'+list[i].msg_content+'</p>'
									 +'<span class="time text-muted small" style="font-size: 10px;  margin-left: 59%;">'+list[i].msg_sendtime+'</span>'
									 +'</div></div></div>')		 
						  );
	 					 $('[name=room_member]').val(list[i].msg_sender);
					 	 $('#memberName').find('h5').text(list[i].msg_sender);
					 	 $('#memberName').find('p').text(list[i].msg_sender + "님과의 대화방");
					} else if(list[i].msg_sender == "${user_id}") {
						$('.chatMiddle').append(
								 $('<div class="row no-gutters"><div class="col-md-3 offset-md-9">'
										 +'<div class="chat-bubble chat-bubble--right">'
										 + '<p style="margin-bottom:0px">' + list[i].msg_content +'</p>'
						            	 + '<span class="time text-muted small" style="font-size:10px; margin-right:59%">'
						            	 + list[i].msg_sendtime+'</span>'
						            	 +'</div></div></div>')
						          );
						 $('[name=room_member]').val(list[i].msg_receiver);
					 	 $('#memberName').find('h5').text(list[i].msg_receiver);
					 	 $('#memberName').find('p').text(list[i].msg_receiver + "님과의 대화방");
					} else if (list[i].msg_content == null){
						$('.chatMiddle').append("<h5>대화를 시작해보세요!</h5>");
					}
					$('#unReadNum').hide();
					$('[name=room_id]').val(roomId);
					$('#chatMiddle').scrollTop($('#chatMiddle').prop('scrollHeight'));
				}

			}
		})
	}
	
	function deleteMessage(){
		var room_id = $('[name=room_id]').val();
		console.log(room_id);
		$.ajax({
			url: "deleteChatRoom?chatroom_no="+room_id,
			success:function(response){
				$('#container').load(location.href + '#container');
			}
		})
	}

	
	function updateReadTime(roomId){
		$.ajax({
			url: "updateReadTime",
			data: {"chatroom_no":roomId , "msg_receiver":"${user_id}"},
			success:function(result){
				console.log(result);
			}
		})
	}
</script>

</head>
<body>
<!-- 채팅방 클릭시 채팅방 번호, 채팅방 참여자 정보 담고있음... -->
	<form id="hiddenForm" name="hiddenForm">
		<input type="hidden" name="room_id">
		<input type="hidden" name="room_member">
	</form>
<div class="container" id="container">
  <div class="row no-gutters">
  <!-- 대화리스트 받는 화면 시작 -->
    <div class="col-md-4 border-right" >
      <div class="settings-tray" onclick="listReload()">
	      <img src="resources/chat/images/logosample2.png" alt="Profile img" style="width:100px;">
	      <login>${user_id }님 접속중</login>
	       <span class="settings-tray--right" >
	         <span class="material-icons" style="margin-top: 15px;">home</span>
	       </span>
      </div>
      <div class="chatList">
	      <c:if test="${fn:length(chatList) >= 1}">	
	      	<c:forEach items="${chatList }" var="list">
		      	<div class='friend-drawer friend-drawer--onhover' onclick='listClick("${list.chatroom_no }","${list.user_id_one }","${list.user_id_two }")'>
					<img class='profile-image' src='resources/chat/images/person.jpg'>
					<div class="text" style="padding-top:15px; color:grey;" >
					<c:if test="${list.user_id_one eq user_id }"> <!-- 따옴표안에 공백이 있으면 안됀다... 공백있으면 인식못함... -->
						<h5>${list.user_id_two }</h5>
					</c:if>
					<c:if test="${list.user_id_one ne user_id }">
						<h5>${list.user_id_one }</h5>
					</c:if>
					</div>
					<c:forEach items="${unreadMessage }" var="msg">
					<c:if test="${list.chatroom_no == msg.chatroom_no }">
						<div id="unReadNum"> <!-- 안읽은 메세지 있으면 갯수표시 -->
							${msg.msg_num }					
						</div>
					</c:if>
					</c:forEach>
				</div>
				<hr>
			</c:forEach>
		  </c:if>	
 		  <c:if test="${fn:length(chatList) == 0}">
			<div class="noList">
				<h6> 대화 내역이 존재하지 않습니다. <br> 커뮤니티 유저와 대화를 나누어보세요! </h6>
			</div>
		  </c:if> 
      </div>
    </div>
    <!-- 대화리스트 받는 화면 끝 -->
    <!-- 대화 보내고 받는 화면 시작 -->
    <div class="col-md-8" id="listDiv">
      <div class="settings-tray">
        <div class="friend-drawer no-gutters friend-drawer--grey">
          <div class="text" id="memberName">
            <h5>상대방 이름...</h5>
            <p class="text-muted" style="font-size:11px">상대방 이름과 대화</p>
          </div>
    	 <span class="settings-tray--right" style="margin-left: 22%">
            <span class="material-icons" style="margin-left: 20px;" id="deleteMsg">logout</span>
          </span> 
        </div>
      </div>
      <div class="chat-panel">
	      <div class="chatMiddle" id="chatMiddle">
	      	<!-- 주고받은 메세지 동적생성! -->
	       </div>
        <div class="row">
          <div class="col-12">
            <div class="chat-box-tray">
              <i class="material-icons">sentiment_very_satisfied</i>
              <input type="text" placeholder="메세지를 입력해주세요." id="message">
              <i class="material-icons" id="sendMsg">send</i>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 대화 보내고 받는 화면 끝 -->
    <!-- 채팅방 첫 화면 div 시작 -->
    <div class="firstPage">
		<img src='resources/chat/images/commu.png'>
    </div>
    <!-- 채팅방 첫화면 div 끝  -->
</div>
</div> <!-- end of container -->
<script>
	$('#chatMiddle').scrollTop($('#chatMiddle').prop('scrollHeight'));
</script>
</body>
</html>