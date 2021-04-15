package co.finalproject.farm.app.community.service;

import java.util.Arrays;
import java.util.stream.Collectors;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class CommPagingVO extends CommunityVO {
	//페이징
    Integer page = 1;
	int start = 1;
	int end = 10;
	
	//체크박스는 값이 배열로 넘어온다
	//배열로 넘어온 값을 받아주고
	String[] comm_adrs;
	
    // 배열로 넘어온 값을 스트링 문자열로 잘라준다
	//"전체", "서울/경기/인천", ... 이런 식으로
	// 그래야 체크 했을 때 내가 원하는 값을 볼 수 있음
	public String getComm_adrs1(){
		if (comm_adrs == null ) { //만약 체크 하지 않는다면 리턴 "";
			return "";
		}
		 String result = Arrays.asList(comm_adrs).stream() //체크한다면 잘라서 문자열로
				        .map(s -> "\"" + s + "\"")
				        .collect(Collectors.joining(", "));
		 
		 return result;
	}

}
