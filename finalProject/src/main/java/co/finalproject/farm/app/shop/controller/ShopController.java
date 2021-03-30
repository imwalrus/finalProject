package co.finalproject.farm.app.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import co.finalproject.farm.app.shop.service.ShopVO;
import co.finalproject.farm.app.shop.service.impl.ShopMapper;
import co.finalproject.farm.common.Paging;

@Controller
public class ShopController {
	@Autowired
	ShopMapper shopMapper;

	// 전체 리스트 · 검색 · 카테고리 · 페이징
	@GetMapping("/shop")
	public String getListShop(ShopVO vo, Paging paging, Model model) {
		paging.setPageUnit(6); // 한 페이지에 표시되는 레코드 건 수
		paging.setPageSize(5); // 페이지 번호
		// 페이징
		if (vo.getPage() == null) {
			vo.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		paging.setTotalRecord(shopMapper.getCount(vo));
		model.addAttribute("paging", paging);
		model.addAttribute("list", shopMapper.getListShop(vo));
		model.addAttribute("cnt", shopMapper.allCount());
		model.addAttribute("cate", shopMapper.cateCount(vo));
		return "shop/shop";
	}
	
	@GetMapping("/product")
	public String getProduct(ShopVO vo, Model model) {
		model.addAttribute("prod", shopMapper.getProduct(vo));
		return "shop/product";
	}
}
