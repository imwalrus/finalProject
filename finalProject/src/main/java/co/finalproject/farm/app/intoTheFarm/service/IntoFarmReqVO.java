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
	private int into_req_entry;
	private String into_req_reward;
	private String into_req_date;
	private int into_no;
}
