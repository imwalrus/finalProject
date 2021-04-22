package co.finalproject.farm.app.intoTheFarm.service;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class IntoFarmReqVO {
	private String into_req_num;
	private String user_id;
	private String into_req_phone;
	private String into_entry; //모집인원수
	private String into_req_register; //신청인원수
	private String into_req_reward;
	private String into_req_date;
	private String into_no;
	private String farm_id;
	private String title;
}