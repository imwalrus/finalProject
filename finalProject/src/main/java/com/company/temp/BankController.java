package com.company.temp;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.common.BankAPI;

@Controller
public class BankController {
	@Autowired BankAPI bankAPI;
	String access_token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiIxMTAwNzcwNTM1Iiwic2NvcGUiOlsiaW5xdWlyeSIsImxvZ2luIiwidHJhbnNmZXIiXSwiaXNzIjoiaHR0cHM6Ly93d3cub3BlbmJhbmtpbmcub3Iua3IiLCJleHAiOjE2MjMyMTAwNTMsImp0aSI6IjBmYWU0MGI1LWI2YmItNDg3NS1hZWM1LTJkODRhNWE1NjFmMiJ9.FW7HqAEMplMoqdaNWdxpubWJVHzyVnoTg8S_9wFsYZI";
	
	@RequestMapping("/getAuthorizeAccount")
	public String auth() throws Exception {
		String reqURL = " https://testapi.openbanking.or.kr/oauth/2.0/authorize_account";
		String response_type = "code";
		String client_id = "b4f9bf0b-cde1-4769-8e2f-82a35b4d51a1";
		String redirect_uri = "http://localhost/temp/callback";
		String scope = "login inquiry transfer";
		String state = "01234567890123456789012345678913";
		String auth_type = "0";
		
		StringBuilder qstr = new StringBuilder();
		qstr.append("response_type=" + response_type)
			.append("&client_id=" + client_id)
			.append("&redirect_uri=" + redirect_uri)
			.append("&scope=" + scope)
			.append("&state=" + state)
			.append("&auth_type=" + auth_type);
		
		return "redirect: " + reqURL + "?" + qstr.toString();
	}

	@RequestMapping("/getOrgAuthorize")
	public String getOrgAuthorize() {
//		Map<String, Object> map = bankAPI.getOrgAccessToken();
		Map<String, Object> map = bankAPI.getOrgAccessTokenRestTemplate();
		System.out.println("access_token==========" + map.get("access_token"));
		
		return "home";
	}
		
	@RequestMapping("/callback")
	public String callback(@RequestParam Map<String, Object> map, HttpSession session) {
		System.out.println("code==========" + map.get("code"));
		String code = (String)map.get("code");
				
		// access_token 받기
		Map<String, Object> access_token = bankAPI.getAccessToken(code);
		System.out.println("access_token: " + access_token);
		
		// session
		session.setAttribute("access_token", access_token);
		
		return "home";
	}
	
	@RequestMapping("/getAccountList")
	public String userinfo(HttpServletRequest request, Model model) {
		String use_num = "1100770535";
		Map<String, Object> map = bankAPI.getAccountList(access_token, use_num);
		System.out.println("userinfo==========" + map);
		model.addAttribute("list", map);
		
		return "bank/getAccountList";
	}
	
	@RequestMapping("/getBalance")
	public String getBalance(BankVO vo, Model model) {
		vo.setAccess_token(access_token);
		Map<String, Object> map = bankAPI.getBalance(vo);
		System.out.println("잔액==========" + map);
		model.addAttribute("balance", map);
		
		return "bank/getBalance";
	}
	
	@ResponseBody
	@RequestMapping("/ajaxGetBalance")
	public Map ajaxGetBalance(BankVO vo) {
		vo.setAccess_token(access_token);
		Map<String, Object> map = bankAPI.getBalance(vo);
	
		return map;
	}
}
