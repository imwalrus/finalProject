package co.finalproject.farm.app.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import co.finalproject.farm.app.shop.service.CartVO;
import co.finalproject.farm.app.shop.service.CrawlingVO;
import co.finalproject.farm.app.shop.service.OrderVO;
import co.finalproject.farm.app.shop.service.ShopVO;
import co.finalproject.farm.app.shop.service.impl.ShopMapper;
import co.finalproject.farm.app.user.service.UserVO;
import co.finalproject.farm.app.user.service.impl.UserMapper;
import co.finalproject.farm.common.FileRenamePolicy;
import co.finalproject.farm.common.Paging;

@Controller
public class ShopController {
	@Autowired ShopMapper shopMapper;
	@Autowired UserMapper userMapper;

	// 전체 리스트 · 검색 · 카테고리 · 페이징
	@GetMapping("/shop")
	public String getListShop(ShopVO vo, Paging paging, Model model) {
		paging.setPageUnit(6); // 한 페이지에 표시되는 레코드 건 수
		paging.setPageSize(5); // 표시되는 페이지 번호
		// 페이징
		if (vo.getPage() == null) {
			vo.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		paging.setTotalRecord(shopMapper.getCount(vo));
		model.addAttribute("paging", paging); // 페이징
		model.addAttribute("list", shopMapper.getListShop(vo)); // 리스트
		model.addAttribute("cnt", shopMapper.allCount()); // 카테고리 - 전체
		model.addAttribute("cate", shopMapper.cateCount(vo)); // 카테고리
		return "shop/shop";
	}

	// 개별 상품 페이지
	@GetMapping("/product")
	public String getProduct(ShopVO vo, Model model) {
		model.addAttribute("prod", shopMapper.getProduct(vo));
		return "shop/product";
	}

	// 상품 관리 페이지
	@GetMapping("/prodManage")
	public String getShopManage(ShopVO vo, Paging paging, Model model) {
		paging.setPageUnit(5);
		paging.setPageSize(5);
		if (vo.getPage() == null) {
			vo.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		paging.setTotalRecord(shopMapper.getCount(vo));
		model.addAttribute("paging", paging);
		model.addAttribute("manage", shopMapper.getListProd(vo));
		return "shop/prodManage";
	}

	// 단건 보기 - 모달
	@GetMapping("/modalView")
	public String modalView(ShopVO vo, Model model) {
		model.addAttribute("modal", shopMapper.getProduct(vo));
		return "notiles/shop/modalView";
	}

	// 상품 등록 - 모달
	@GetMapping("/modalInsert")
	public String modalInsert(ShopVO vo) {
		return "notiles/shop/modalInsert";
	}

	// 상품 수정 - 모달
	@GetMapping("/modalUpdate")
	public String modalUpdate(ShopVO vo, Model model) {
		model.addAttribute("modal", shopMapper.getProduct(vo));
		return "notiles/shop/modalUpdate";
	}

	// 상품 등록
	@PostMapping("/insertProduct")
	public String insertProduct(ShopVO vo, HttpServletRequest req) throws Exception, IOException {
		// 첨부 파일 처리
		MultipartFile uploadFile = vo.getUploadFile();
		String pro_filename = "";
		if (uploadFile != null && !uploadFile.isEmpty() && uploadFile.getSize() > 0) {
			String filename = uploadFile.getOriginalFilename();
			String path = req.getSession().getServletContext().getRealPath("/resources/images/shop");
			File rename = FileRenamePolicy.rename(new File(path, filename));
			uploadFile.transferTo(new File(path, rename.getName())); // 임시폴더에서 업로드 폴더로 이동
			pro_filename += '@' + rename.getName();
			vo.setPro_filename(rename.getName());
		}
		shopMapper.insertProduct(vo);
		return "redirect:/prodManage";
	}

	// 상품 수정
	@PostMapping("/updateProduct")
	public String updateProduct(ShopVO vo, Model model, HttpServletRequest req) throws Exception, IOException {
		MultipartFile uploadFile = vo.getUploadFile();
		String pro_filename = "";
		if (uploadFile != null && !uploadFile.isEmpty() && uploadFile.getSize() > 0) {
			String filename = uploadFile.getOriginalFilename();
			String path = req.getSession().getServletContext().getRealPath("/resources/images/shop");
			File rename = FileRenamePolicy.rename(new File(path, filename));
			uploadFile.transferTo(new File(path, rename.getName())); // 임시폴더에서 업로드 폴더로 이동
			pro_filename += '@' + rename.getName();
			vo.setPro_filename(rename.getName());
		}
		model.addAttribute("modal", shopMapper.updateProduct(vo));
		return "redirect:/prodManage";
	}

	// 상품 삭제
	@PostMapping("/deleteProduct")
	public String deleteProduct(ShopVO vo) {
		shopMapper.deleteProduct(vo);
		return "redirect:/prodManage";
	}

	// 장바구니 페이지
	@RequestMapping("/cart")
	public String getCart(CartVO vo, Model model) {
		model.addAttribute("cart", shopMapper.getCart(vo));
		return "shop/cart";
	}

	// 장바구니 등록
	@RequestMapping("/insertCart")
	public String insertCart(CartVO vo, HttpServletRequest request) {
		int count = shopMapper.cartCheck(vo);
		HttpSession session = request.getSession(); // id를 세션값으로 받아 파라미터값으로
		String user_id = (String) session.getAttribute("user_id");
		if (count == 0) {
			shopMapper.insertCart(vo); // 같은 상품이 없다면 insertCart
		} else {
			shopMapper.updateCart(vo); // 같은 상품이 존재한다면 updateCart
		}
		return "redirect:/cart?user_id=" + user_id;
	}

	// 장바구니 수량 변경
	@RequestMapping("/updateCart")
	public String updateCart(CartVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		shopMapper.updateCart(vo);
		return "redirect:/cart?user_id=" + user_id;
	}

	// 장바구니 삭제
	@RequestMapping("/deleteCart")
	public String deleteCart(CartVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		shopMapper.deleteCart(vo);
		return "redirect:/cart?user_id=" + user_id;
	}

	// 장바구니 비우기
	@RequestMapping("/deleteAllCart")
	public String deleteAllCart(CartVO vo) {
		shopMapper.deleteAllCart(vo);
		return "redirect:/shop";
	}

	// 주문 페이지
	@GetMapping("/checkout")
	public String checkout(CartVO cvo, UserVO uvo, Model model) {
		model.addAttribute("order", shopMapper.getCart(cvo)); // 카트 정보
		model.addAttribute("user", userMapper.getUser(uvo)); // 회원 정보
		return "shop/checkout";
	}

	// 주문 · 상세주문 등록
	@RequestMapping("/insertOrder")
	public String insertOrder(OrderVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		shopMapper.insertOrder(vo); // 주문 등록
		shopMapper.insertOrderlist(vo); // 상세 주문 등록
		return "redirect:/deleteAllCart?user_id=" + user_id; // 주문 완료 후 장바구니 비우기
	}

	// 소개 페이지
	@RequestMapping("/infoShop")
	public String infoShop(@RequestParam(defaultValue = "1", required = false) String cnt, Model model) {
		// 크롤링
		String url = "http://www.nongsaro.go.kr/portal/ps/psz/pszc/farmProduct.ps?pageIndex=" + cnt;
		Document doc = null;
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Elements tabs = doc.select("div.stab-contents li");
		Elements names = doc.select("p.name");
		Elements imgs = doc.select("a.web img");
		Elements prices = doc.select("dd.product_inf strong");
		Elements farmBaros = doc.select("dt a.web");
		Elements paging = doc.select("div.page-area");
		List<CrawlingVO> list = new ArrayList<CrawlingVO>();
		for (int i = 0; i < tabs.size(); i++) {
			String name = names.get(i).text();
			String img = imgs.get(i).attr("src");
			String price = prices.get(i).text();
			String farmBaro = farmBaros.get(i).attr("href");

			CrawlingVO vo = new CrawlingVO(name, img, price, farmBaro);
			list.add(vo);
		}
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		return "shop/infoShop";
	}
}
