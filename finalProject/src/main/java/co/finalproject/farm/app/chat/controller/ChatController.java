package co.finalproject.farm.app.chat.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.finalproject.farm.app.chat.service.ChatRoomVO;
import co.finalproject.farm.app.chat.service.ChatService;
import co.finalproject.farm.app.chat.service.MessageVO;

@Controller
public class ChatController {
	
	@Autowired ChatService chatService;
	
		//마이페이지에서 쪽지 버튼 클릭 시...! 
		@RequestMapping("/showChat")
		public String showChatGet(Model model, HttpSession session, ChatRoomVO vo) {
			String user_id = (String) session.getAttribute("user_id");
			model.addAttribute("user_id",user_id);
			vo.setUser_id_one(user_id);
			model.addAttribute("chatList", chatService.getChatRoomList(vo));
			model.addAttribute("unreadMessage", chatService.getUnreadMessage(user_id));
			return "chat/chat/showChat";
		}
		
		//커뮤니티에서 1:1대화하기 버튼 클릭시
		@RequestMapping("/showChatinComu")
		public String showChatPost(Model model,HttpSession session,@RequestParam String member_id,ChatRoomVO vo) {
			
			String user_id = (String) session.getAttribute("user_id");
			model.addAttribute("user_id",user_id);
			model.addAttribute("member_id", member_id);
			vo.setUser_id_one(user_id);
			vo.setUser_id_two(member_id);
			ChatRoomVO resultVO = new ChatRoomVO();
			
			if(chatService.getChatRoom(vo) == null) {
				resultVO.setUser_id_one(user_id);
				resultVO.setUser_id_two(member_id);
				chatService.insertChatRoom(resultVO);
			}
			
			model.addAttribute("chatList", chatService.getChatRoomList(vo));
			return "chat/chat/showChat";
		}

		@RequestMapping("/getMessageList")
		@ResponseBody
		public  List<MessageVO> getMessageList(MessageVO vo) {
			//메세지 list 불러오기 
			List<MessageVO> msgList = chatService.getMessageList(vo);
			System.out.println(msgList);
			/*
			 * //메세지 리스트 불러오면서 해당하는 chatroom에 읽지않은 message 읽은 시간 update if(msgList != null)
			 * { chatService.updateReadTime1(vo); }
			 */
			return msgList;
		}
		
		@RequestMapping("/deleteChatRoom")
		@ResponseBody
		public int deleteChatRoom(@RequestParam String chatroom_no) {
			int result = 0;
			result += chatService.deleteMessage(chatroom_no);
			result += chatService.deleteChatRoom(chatroom_no);
			return result;
					
		}
		
		@RequestMapping("/getUnreadMessage")
		@ResponseBody
		public List<MessageVO> getUnreadMessage(HttpSession session) {
			String user_id = (String) session.getAttribute("user_id");
			List<MessageVO> list = chatService.getUnreadMessage(user_id);
			return list;
		}
		
		@RequestMapping("/updateReadTime")
		@ResponseBody
		public int updateReadTime(MessageVO vo) {
			int result = chatService.updateReadTime1(vo);
			return result;
		}
}
