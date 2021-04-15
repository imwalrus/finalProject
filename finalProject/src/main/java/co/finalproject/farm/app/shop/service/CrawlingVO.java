package co.finalproject.farm.app.shop.service;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CrawlingVO {
	private String name;
	private String img;
	private String price;
	private String farmBaro;
}
