package com.company.common;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.company.temp.BankVO;
import com.google.gson.Gson;

@Component
public class BankAPI {
	
	String host = "https://testapi.openbanking.or.kr";
	String client_id = "b4f9bf0b-cde1-4769-8e2f-82a35b4d51a1";
	String client_secret = "19c1b4d6-3698-4f3f-b32e-08d0a8c01559";
	String redirect_uri = "http://localhost/temp/callback";
	String use_org_code = "M202111677";
			
	public Map<String, Object> getAccessToken (String authorize_code) {
        String reqURL = host +  "/oauth/2.0/token";
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            StringBuilder param = new StringBuilder();
            param.append("code=").append(authorize_code)
            	 .append("&client_id=").append(client_id)
                 .append("&client_secret=").append(client_secret)
                 .append("&redirect_uri=").append(redirect_uri)
            	 .append("&grant_type=authorization_code");
            
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            // POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST"); // HEADER + BODY(파라미터값)
            conn.setDoOutput(true);
            
            // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            OutputStream os = conn.getOutputStream();
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(os, "UTF-8"));
            bw.write(param.toString()); // 파라미터와 &= 합체
            bw.flush();
            bw.close();
            os.close();
            
            // 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            StringBuilder sb = new StringBuilder();
            if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
            	BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            	String line = "";
            	while ((line = br.readLine()) != null) {
            		sb.append(line).append("\n");
            	}
            	br.close();
            	System.out.println("==========response body : " + sb.toString());
            } else {
            	System.out.println("==========token error : " + conn.getResponseMessage());
            }         
            
            // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            Gson gson = new Gson();
            map = gson.fromJson(sb.toString(), Map.class);

        } catch (IOException e) {
            e.printStackTrace();
        } 
        
        return map;
    }
	
	// RestTemplate 적용
	public Map<String, Object> getOrgAccessTokenRestTemplate () {
        String reqURL = host +  "/oauth/2.0/token";
        
        MultiValueMap<String, String> param = new LinkedMultiValueMap<String, String>();
        param.add("client_id", client_id);
        param.add("client_secret", client_secret);
        param.add("scope", "oob");
        param.add("grant_type", "client_credentials");
        
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(param, headers);
        
        RestTemplate restTemplate = new RestTemplate();
        Map map = restTemplate.postForObject(
        									 reqURL,
        									 request,
        									 Map.class);
        
        return map;
	}
	
	public Map<String, Object> getOrgAccessToken () {
        String reqURL = host +  "/oauth/2.0/token";
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            StringBuilder param = new StringBuilder();
            param.append("client_id=").append(client_id)
                 .append("&client_secret=").append(client_secret)
                 .append("&scope=oob")
            	 .append("&grant_type=client_credentials");
            
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            // POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST"); // HEADER + BODY(파라미터값)
            conn.setDoOutput(true);
            
            // 요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
            
            // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            OutputStream os = conn.getOutputStream();
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(os, "UTF-8"));
            bw.write(param.toString()); // 파라미터와 &= 합체
            bw.flush();
            bw.close();
            os.close();
            
            // 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            StringBuilder 
            sb = new StringBuilder();
            if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
            	BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            	String line = "";
            	while ((line = br.readLine()) != null) {
            		sb.append(line).append("\n");
            	}
            	br.close();
            	System.out.println("==========response body : " + sb.toString());
            } else {
            	System.out.println("==========token error : " + conn.getResponseMessage());
            }         
            
            // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            Gson gson = new Gson();
            map = gson.fromJson(sb.toString(), Map.class);

        } catch (IOException e) {
            e.printStackTrace();
        } 
        
        return map;
    }
	
	public HashMap<String, Object> getAccountList (String access_token, String user_num) {
	    // 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	    HashMap<String, Object> map = new HashMap<>();
	    String reqURL = host + "/v2.0/account/list";
		StringBuilder qstr = new StringBuilder();
		qstr.append("user_seq_no=" + "1100770535")
			.append("&include_cancel_yn=" + "Y")
			.append("&sort_order=" + "D");
	    try {
	        URL url = new URL(reqURL + "?" + qstr);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        
	        // 요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Authorization", "Bearer " + access_token);
	        
	        // 출력되는 값이 200이면 정상작동
	        int responseCode = conn.getResponseCode();
	        System.out.println("===========responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String line = "";
	        String result = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println("===========response body : " + result);
	        
	        // String -> Map에 담기
	        Gson gson = new Gson();
	        map = gson.fromJson(result, HashMap.class);
	        
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    
	    return map;
	}
	
	public String getDate() {
		String str = "";
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddhhmmss");
		str = format.format(date);
		
		return str;
	}
	
	public String getRand() {
		// 9자리 난수
		long time = System.currentTimeMillis();
		String str = Long.toString(time).substring(13-9);
		
		return str.substring(str.length() - 9);
	}
	
	public String getRand32() {
		// 32자리 난수
	    Random rand = new Random();
	    String num = "";
	    for(int i = 0; i < 32; i++) {
	    	String ran = Integer.toString(rand.nextInt(10));
	    	num += ran;
	    }
	    
	    return num;
	}
	
	public HashMap<String, Object> getBalance(BankVO vo) {
		 HashMap<String, Object> map = new HashMap<>();
		    String reqURL = host + "/v2.0/account/balance/fin_num";
			StringBuilder qstr = new StringBuilder();
			qstr.append("bank_tran_id=").append(use_org_code + "U" + getRand())
				.append("&fintech_use_num=").append(vo.getFintech_use_num())
				.append("&tran_dtime=").append(getDate());
		    try {
		        URL url = new URL(reqURL + "?" + qstr);
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("GET");
		        
		        // 요청에 필요한 Header에 포함될 내용
		        conn.setRequestProperty("Authorization", "Bearer " + vo.getAccess_token());
		        
		        // 출력되는 값이 200이면 정상작동
		        int responseCode = conn.getResponseCode();
		        System.out.println("===========responseCode : " + responseCode);
		        
		        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        
		        String line = "";
		        String result = "";
		        
		        while ((line = br.readLine()) != null) {
		            result += line;
		        }
		        System.out.println("===========response body : " + result);
		        
		        // String -> Map에 담기
		        Gson gson = new Gson();
		        map = gson.fromJson(result, HashMap.class);
		        
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
		    return map;
	}
}
