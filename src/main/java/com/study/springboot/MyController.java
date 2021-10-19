package com.study.springboot;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.study.springboot.dto.Page;
import com.study.springboot.dto.Page3;
import com.study.springboot.dto.addDto;
import com.study.springboot.dto.cancelDto;
import com.study.springboot.dto.cartDto;
import com.study.springboot.dto.faqDto;
import com.study.springboot.dto.memberDto;
import com.study.springboot.dto.noticeDto;
import com.study.springboot.dto.orderDto;
import com.study.springboot.dto.orderInfoDto;
import com.study.springboot.dto.shoppingItemsDto;
import com.study.springboot.service.AddService;
import com.study.springboot.service.AdminService;
import com.study.springboot.service.CancelService;
import com.study.springboot.service.CartService;
import com.study.springboot.service.FileUploadService;
import com.study.springboot.service.MemberService;
import com.study.springboot.service.MemberService2;
import com.study.springboot.service.NoticeService;
import com.study.springboot.service.OrderInfoService;
import com.study.springboot.service.OrderService;
import com.study.springboot.service.ShoppingItemsService;
import com.study.springboot.service.faqService;

@Controller
public class MyController {

	@Autowired
	private NoticeService noticeService;

	@Autowired
	private ShoppingItemsService shoppingItemsService;

	@Autowired
	private AdminService adminService;

	@Autowired
	private ServletContext context;

	@RequestMapping("/")
	public String root() throws Exception {
		System.out.println("path:" + context.getRealPath("/"));
		System.out.println("path:" + context.getContextPath());
		String path = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
		System.out.println("path:" + path);

		return "redirect:home";
	}

	@RequestMapping("/qna_admin")
	public String qna_admin() {

		return "Qna_admin";
	}

	
	@RequestMapping(value = "/items_list", method = RequestMethod.GET)
	public String items_list(Model model, @RequestParam(value = "num", required = false, defaultValue = "1") int num,
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {

		Page3 page = new Page3();

		page.setNum(num);
		// page.setCount(service.count());
		page.setCount(addService.searchCount(searchType, keyword));

		// 검색 타입과 검색어
		page.setSearchTypeKeyword(searchType, keyword);
		page.setSearchType(searchType);
		page.setKeyword(keyword);

		List<addDto> list = null;
		// list = service.listPage(page.getDisplayPost(), page.getPostNum());
		list = addService.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);

		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		model.addAttribute("mainPage", "items_list.jsp");
		
		
		return "users/home";
	}
	
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model, @RequestParam(value = "num", required = false, defaultValue = "1") int num,
			@RequestParam(value = "searchType", required = false, defaultValue = "id") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {

		Page3 page = new Page3();

		page.setNum(num);
		// page.setCount(service.count());
		page.setCount(addService.searchCount(searchType, keyword));

		// 검색 타입과 검색어
		page.setSearchTypeKeyword(searchType, keyword);
		page.setSearchType(searchType);
		page.setKeyword(keyword);

		List<addDto> list = null;
		// list = service.listPage(page.getDisplayPost(), page.getPostNum());
		list = addService.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);

		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);

		model.addAttribute("mainPage", "main.jsp");

		return "/users/home";
	}

	@RequestMapping("/admin")
	public String admin_login() {
		return "admin_login";
	}

	@RequestMapping("/join")
	public String join(Model model) {

		model.addAttribute("mainPage", "join.jsp");

		return "/users/home";
	}

	@Autowired
	public MemberService memberService;

	@RequestMapping("idCheckAjax")
	@ResponseBody
	public String idCheckAjax(@RequestParam("member_id") String member_id, HttpServletRequest request, Model model) {

		int result = memberService.idCheckAjax(member_id);
		System.out.println("result:" + result);

		if (result >= 1) { // 아이디 중복됨
			return ("1");
		} else {
			return ("0");
		}
	}

	@RequestMapping("/join2")
	public String join2(Model model) {

		model.addAttribute("mainPage", "join2.jsp");
		return "users/home";
	}

	@RequestMapping("/order_delete")
	public String order_delete(@RequestParam("items_idx") int items_idx, @RequestParam("items_order_idx") int items_order_idx,@RequestParam("member_id") String member_id) throws Exception {

		int result;
		int order_idx = items_order_idx;
		orderService.order_delete(order_idx);
		result = shoppingItemsService.admin_order_delete(items_idx);
		int result2 = orderInfoService.orderInfo_delete(items_idx);

		return "redirect:/order_list?member_id="+member_id;
	}
	@RequestMapping("/admin_order_delete")
	public String admin_order_delete(@RequestParam("items_idx") int items_idx, @RequestParam("items_order_idx") int items_order_idx) throws Exception {

		int result;
		int order_idx = items_order_idx;
		orderService.order_delete(order_idx);
		result = shoppingItemsService.admin_order_delete(items_idx);

		int result2 = orderInfoService.orderInfo_delete(items_idx);
		return "redirect:/admin_order";
	}

	@RequestMapping("member_id_submit")
	public String member_id_submit(Model model, @RequestParam("member_id") String member_id,
			@RequestParam("member_pw") String member_pw, @RequestParam("member_name") String member_name,
			@RequestParam("member_email") String member_email,
			@RequestParam("member_email_receive") String member_email_receive) throws Exception {

		int result = memberService.member_join(member_id, member_pw, member_name, member_email, member_email_receive);

		model.addAttribute("mainPage", "main.jsp");

		return "redirect:/home";

	}

	@RequestMapping("/login")
	public String login(Model model) {

		model.addAttribute("mainPage", "login.jsp");

		return "users/home";
	}

	@RequestMapping("LoginAction")
	public String userloginAction(@RequestParam("member_id") String member_id, @RequestParam("member_pw") String member_pw, HttpServletRequest request, Model model) {

		int result = memberService.login(member_id, member_pw);
		System.out.println("result:" + result);
		if (result == 1) {
			System.out.println("alert:" + "로그인되었습니다.");
			request.getSession().setAttribute("alert", "로그인되었습니다.");
			request.getSession().setAttribute("member_id", member_id);
			request.getSession().setAttribute("member_pw", member_pw);

			return "redirect:/home";
		} else {
			System.out.println("alert:" + "로그인 실패하였습니다.");

			model.addAttribute("alert", "로그인 실패하였습니다.");
			model.addAttribute("mainPage", "member/login.jsp");

			return "home"; // index.jsp 디스패치
		}

	}
	@RequestMapping("logoutAction")
	public String userlogout(HttpServletRequest request, Model model) {
		
		request.getSession().invalidate();	
		
		request.getSession().setAttribute("alert", "로그아웃되었습니다.");
		
		return "redirect:/home";  
	}
	@RequestMapping("order_status")
	public String order_status(@RequestParam("items_idx") int items_idx,
			@RequestParam("statusSelect") String statusSelect, Model model) {
		int items_status = 0;
		String items_status2 = "";
		if (statusSelect.equals("status1")) {
			items_status = 1;
			items_status2 = "주문 확인 중";
		} else if (statusSelect.equals("status2")) {
			items_status = 2;
			items_status2 = "주문 확인";
		} else if (statusSelect.equals("status3")) {
			items_status = 3;
			items_status2 = "배송 준비 중";
		} else if (statusSelect.equals("status4")) {
			items_status = 4;
			items_status2 = "배송 중";
		} else if (statusSelect.equals("status5")) {
			items_status = 5;
			items_status2 = "배송 완료";
		}
		System.out.println("statusSelect" + statusSelect);
		System.out.println("items_status" + items_status);
		System.out.println("items_idx" + items_idx);
		System.out.println("items_status2" + items_status2);
		if (items_status != 0) {
			int result = shoppingItemsService.order_status(items_idx, items_status, items_status2);
			return "redirect:admin_order";
		} else {
			return "redirect:admin_order_view?items_idx=" + items_idx;
		}
	}

	@RequestMapping("/admin_order_view")
	public String order_view(HttpServletRequest request,@RequestParam("items_member_idx") int items_member_idx, @RequestParam("items_idx") int items_idx,@RequestParam("items_order_idx") int items_order_idx, Model model) throws Exception {
		int order_member_idx = items_member_idx;
		int order_idx = items_order_idx;
		List<orderDto> order_view = orderService.order_view(order_member_idx, order_idx);
		
		model.addAttribute("order_view", order_view);
		orderInfoDto infoDto = orderInfoService.orderInfo_view(items_idx);
		model.addAttribute("userDto", infoDto);
		
		shoppingItemsDto dto = shoppingItemsService.order_view(items_idx);
		request.setAttribute("dto", dto);

		String status = "";

		if (dto.items_status == 1) {
			status = "주문 확인 전";
		} else if (dto.items_status == 2) {
			status = "주문 확인";
		} else if (dto.items_status == 3) {
			status = "배송 준비중";
		} else if (dto.items_status == 4) {
			status = "배송 중";
		} else if (dto.items_status == 5) {
			status = "배송 완료";
		}
		model.addAttribute("status", status);

		int totalPrice = dto.items_numb * dto.items_price;

		model.addAttribute("totalPrice", totalPrice);

		return "admin_order_view";
	}

	@RequestMapping("/Admin-LoginAction")
	public String loginAction(@RequestParam("admin_id") String admin_id, @RequestParam("admin_pw") String admin_pw,
			HttpServletRequest request, Model model) {

		int result = adminService.admin_login(admin_id, admin_pw);
		System.out.println("result:" + result);
		if (result == 1) {
			System.out.println("alert:" + "로그인되었습니다.");

			System.out.println("admin_id=" + admin_id);
			System.out.println("admin_pw=" + admin_pw);
			request.getSession().setAttribute("alert", "로그인되었습니다.");
			request.getSession().setAttribute("admin_id", admin_id);

			return "redirect:admin_order";
		} else {
			System.out.println("alert:" + "로그인 실패하였습니다.");
			System.out.println("admin_id=" + admin_id);
			System.out.println("admin_pw=" + admin_pw);
			model.addAttribute("alert", "로그인 실패하였습니다.");

			return "redirect:admin"; // index.jsp 디스패치
		}
	}

	@RequestMapping("adminLogoutAction")
	public String logout(HttpServletRequest request, Model model) {

		request.getSession().invalidate();

		request.getSession().setAttribute("alert", "로그아웃되었습니다.");

		return "redirect:admin";
	}

//
//	@RequestMapping("/admin_notice")
//	public String admin_notice( HttpServletRequest request,
//			PagingVO vo, Model model) throws Exception{
//		
//		return "admin_notice";
//	}

	@RequestMapping("admin_notice_write")
	public String admin_notice_write() {

		return "admin_notice_write";
	}

	@RequestMapping("admin_notice_write_action")
	public String admin_notice_write_action(@RequestParam("notice_title") String notice_title,
			@RequestParam("notice_content") String notice_content, HttpServletRequest request, Model model) {

		int result;

		result = noticeService.notice_write(notice_title, notice_content);
		if (result == 1) {
			request.getSession().setAttribute("alert", "작성성공.");

			return "redirect:/admin_notice";
		} else {
			model.addAttribute("alert", "작성실패.");

			return "redirect:/admin_notice";
		}
	}
	@RequestMapping("user_notice_view")
	public String user_notice_view(@RequestParam("notice_idx") String notice_idx, HttpServletRequest request, Model model) {

		noticeDto dto = noticeService.notice_view(notice_idx);
		request.setAttribute("dto", dto);
		model.addAttribute("mainPage", "user_notice_view.jsp");
		return "users/home";
	}
	@RequestMapping("admin_notice_view")
	public String admin_notice_view(@RequestParam("notice_idx") String notice_idx, HttpServletRequest request) {

		noticeDto dto = noticeService.notice_view(notice_idx);
		request.setAttribute("dto", dto);

		return "admin_notice_view";
	}

	@RequestMapping("admin_notice_modify_action")
	public String admin_notice_modify_action(@RequestParam("notice_idx") String notice_idx,
			@RequestParam("notice_title") String notice_title, @RequestParam("notice_content") String notice_content,
			Model model, HttpServletRequest request) {

		int result;
		result = noticeService.notice_modify(notice_idx, notice_title, notice_content);
		if (result == 1) {
			request.getSession().setAttribute("alert", "작성성공.");

			return "redirect:/admin_notice";
		} else {
			model.addAttribute("alert", "작성실패.");

			return "redirect:/admin_notice";
		}
	}

	@Autowired
	public FileUploadService fileUploadService;

	@Autowired
	public AddService addService;

	@RequestMapping("admin_items_add")
	public String admin_items_add() {

		return "admin_items_add";
	}

	@RequestMapping("introduce")
	public String introduce(Model model) {
		
		
		model.addAttribute("mainPage", "introduce.jsp");
		
		return "users/home";
	}
	
	@RequestMapping(value = "/admin_items_list", method = RequestMethod.GET)
	public String getListPageSearch(Model model,
			@RequestParam(value = "num", required = false, defaultValue = "1") int num,
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {

		Page page = new Page();

		page.setNum(num);
		// page.setCount(service.count());
		page.setCount(addService.searchCount(searchType, keyword));

		// 검색 타입과 검색어
		page.setSearchTypeKeyword(searchType, keyword);
		page.setSearchType(searchType);
		page.setKeyword(keyword);

		List<addDto> list = null;
		// list = service.listPage(page.getDisplayPost(), page.getPostNum());
		list = addService.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);

		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);

		return "admin_items_list";

	}

	@RequestMapping(value = "/admin_items_add_action", method = RequestMethod.POST)
	public /* @ResponseBody */ String admin_items_add_action(Model model, @RequestParam("add_title") String add_title,
			@RequestParam("add_price") int add_price, @RequestParam("add_count") int add_count,
			@RequestParam("add_content") String add_content, @RequestParam("add_img") MultipartFile file,
			MultipartFile multipartFile) {

		System.out.println("add_title:" + add_title);
		System.out.println("add_price:" + add_price);
		System.out.println("add_count:" + add_count);

		String url = fileUploadService.restore(file);
		String add_img = url.substring(url.lastIndexOf("/upload/") + 8);

		System.out.println("add_img:" + add_img);

		int result;
		result = addService.add_items_write(add_title, add_price, add_content, add_count, add_img);

		System.out.println("파일업로드 성공 - 경로 url:" + url);
		model.addAttribute("url", url);
		return "redirect:/admin_items_list";
	}

	@RequestMapping("/admin_items_add_modify")
	public String admin_items_add_modify(@RequestParam("add_idx") int add_idx,
			@RequestParam("add_title") String add_title, @RequestParam("add_price") int add_price,
			@RequestParam("add_content") String add_content, @RequestParam("add_count") int add_count, Model model)
			throws Exception {

		addDto dto = new addDto();
		dto.setAdd_content(add_content);
		dto.setAdd_count(add_count);
		dto.setAdd_price(add_price);
		dto.setAdd_idx(add_idx);
		dto.setAdd_title(add_title);
		int result = addService.admin_items_add_modify(dto);

		return "redirect:/admin_items_list";
	}
	@RequestMapping("/user_myPage")
	public String user_myPage(@RequestParam("member_id") String member_id, Model model) throws Exception {
		
		model.addAttribute("mainPage", "user_mypage.jsp");

		memberDto dto = memberService.member_check(member_id);
		int items_member_idx = dto.member_idx;
		
		List<shoppingItemsDto> list = shoppingItemsService.user_order_list(items_member_idx);
		
		
		model.addAttribute("order_list", list);
		model.addAttribute("myPage", "order_list.jsp");
		
		
		return "users/home";
	}
	
	@RequestMapping("/user_order_list")
	public String user_order_list(@RequestParam("member_id") String member_id, Model model) throws Exception {
		
		model.addAttribute("mainPage", "user_mypage.jsp");

		memberDto dto = memberService.member_check(member_id);
		int items_member_idx = dto.member_idx;
		
		List<shoppingItemsDto> list = shoppingItemsService.user_order_list(items_member_idx);
		
		
		model.addAttribute("order_list", list);
		model.addAttribute("myPage", "order_list.jsp");
		
		
		return "users/home";
	}
	
	
	@RequestMapping("/items_view")
	public String items_view(@RequestParam("add_idx") int add_idx, HttpServletRequest request, Model model)
			throws Exception {

		addDto dto = new addDto();

		dto = addService.admin_items_add_view(add_idx);

		request.setAttribute("dto", dto);
		
		model.addAttribute("mainPage", "items_view.jsp");

		return "users/home";
	}
	@RequestMapping("/admin_items_add_view")
	public String admin_items_add_view(@RequestParam("add_idx") int add_idx, HttpServletRequest request)
			throws Exception {

		addDto dto = new addDto();

		dto = addService.admin_items_add_view(add_idx);

		request.setAttribute("dto", dto);

		return "admin_items_add_view";
	}

	@RequestMapping("admin_items_add_delete")
	public String admin_items_add_delete(@RequestParam("add_idx") int add_idx) throws Exception {

		addService.admin_items_add_delete(add_idx);

		return "redirect:/admin_items_list";
	}
	@Autowired
	public CartService cartService;
	
	
	@RequestMapping(value="/addCartAction", method = RequestMethod.POST)
	public String addCartAction(cartDto dto, HttpSession session,
			@RequestParam("member_id") String member_id,@RequestParam("add_idx") int add_idx,@RequestParam("add_title") String add_title,
			@RequestParam("add_price") int add_price,@RequestParam("add_numb") int add_numb,@RequestParam("add_img") String add_img) throws Exception {

		memberDto mDto = new memberDto();
		mDto = memberService.member_check(member_id);
		int member_idx = mDto.getMember_idx();
		System.out.println("add_img:" + add_img);
		int totalPrice = add_price * add_numb;
		dto.setCart_img(add_img);
		dto.setCart_item_idx(add_idx);
		dto.setCart_member_idx(member_idx);
		dto.setCart_numb(add_numb);
		dto.setCart_price(add_price);
		dto.setCart_title(add_title);
		dto.setCart_totalPrice(totalPrice);
		dto.setCart_member_id(member_id);
		cartService.addCart(dto);
		
		
		System.out.println("cart_img : " + add_img);
		System.out.println("cart_item_idx : " + add_idx);
		System.out.println("cart_member_idx : " + member_idx);
		System.out.println("cart_numb : " + add_numb);
		System.out.println("cart_price : " + add_price);
		System.out.println("cart_title : " + add_title);
		System.out.println("cart_totalPrice : " + totalPrice);
		
		return "redirect:/items_list";
	}
	
	@RequestMapping("/cart_view")
	public String cart_view (Model model, @RequestParam("member_id") String member_id) throws Exception {
		
		memberDto dto = memberService.member_check(member_id);
		
		int cart_member_idx = dto.member_idx;
		
		List<cartDto> cart_list = null;
		cart_list = cartService.cart_view(cart_member_idx);
		
		if(cart_list.size() == 0) {
			model.addAttribute("error", "장바구니 내역이 없습니다.");
			model.addAttribute("none", "");
		} else {
			model.addAttribute("none", "<a href=\"\"><input class=\"btn btn-primary\" type=\"submit\"\r\n"
					+ "								value=\"주문하기\"></a>");
		}
		System.out.println("member_idx : " + dto.member_idx);
		System.out.println("cart_member_idx : " + cart_member_idx);
		
		model.addAttribute("dto", dto);
		
		model.addAttribute("cart_list", cart_list);
		model.addAttribute("mainPage", "cart_view.jsp");
		
		return "users/home";
	}
	@RequestMapping("/user_cart_view")
	public String user_cart_view (Model model, @RequestParam("member_id") String member_id) throws Exception {
		
		memberDto dto = memberService.member_check(member_id);
		
		int cart_member_idx = dto.member_idx;
		
		List<cartDto> cart_list = null;
		cart_list = cartService.cart_view(cart_member_idx);
		System.out.println("member_idx : " + dto.member_idx);
		System.out.println("cart_member_idx : " + cart_member_idx);
		if(cart_list.size() == 0) {
			model.addAttribute("error", "장바구니 내역이 없습니다.");
		}
		model.addAttribute("dto", dto);
		model.addAttribute("mainPage", "user_mypage.jsp");
		model.addAttribute("cart_list", cart_list);
		model.addAttribute("myPage", "cart_view.jsp");
		
		return "users/home";
	}
	//(items_idx, items_title, items_price, items_numb, items_member_idx) shoppingitemsDao
	//items_idx, items_img, items_title, items_price, items_numb, items_member_idx, items_order_idx
	/*
	 * UserDto dto1 = new UserDto();
	 *  dto1.setUsername("홍길동"); dto1.setAge(25);
	 * UserDto dto2 = new UserDto(); 
	 * dto2.setUsername("woniper"); dto2.setAge(26);
	 * List<userdto> list = new ArrayList<userdto>();
	 *  list.add(dto1);
	 * list.add(dto2); 
	 * Map<String, Object> map = HashMap<String, Object>();
	 * map.put("list", list);
	 */
	@Autowired
	public OrderService orderService;
	
	@RequestMapping("/order_insert")
	public String order_insert (Model model, @RequestParam("member_id") String member_id, @RequestParam("cart_img") String cart_img, @RequestParam("cart_title") String cart_title, @RequestParam("cart_price") int cart_price, @RequestParam("cart_numb") int cart_numb, @RequestParam("cart_totalPrice") int cart_totalprice, @RequestParam("total") int total) throws Exception {
		memberDto mDto = new memberDto();
		mDto = memberService.member_check(member_id);
		int cart_member_idx =  mDto.member_idx;
		String cart_member_id = member_id;
		
		System.out.println(cart_member_id);

		List<cartDto> cart_list = null;
		cart_list = cartService.cart_view(cart_member_idx);
		model.addAttribute("cart_list", cart_list);
		model.addAttribute("mainPage", "user_orderInfo.jsp");
		return "users/home";
	}
	@Autowired
	public OrderInfoService orderInfoService;
	@RequestMapping("/orderInfo_action")
	public String order_List(Model model, @RequestParam("member_id") String member_id, @RequestParam("cart_img") String cart_img, @RequestParam("cart_title") String cart_title, @RequestParam("cart_price") int cart_price, @RequestParam("cart_numb") int cart_numb, @RequestParam("cart_totalPrice") int cart_totalprice, @RequestParam("total") int total, @RequestParam("orderInfo_name")String orderInfo_name, @RequestParam("orderInfo_phone")String orderInfo_phone, @RequestParam("orderInfo_addressNumb") String orderInfo_addressNumb, @RequestParam("orderInfo_address") String orderInfo_address, @RequestParam("orderInfo_address_detail") String orderInfo_address_detail, @RequestParam("orderInfo_address_extra") String orderInfo_address_extra, @RequestParam("orderInfo_check")int orderInfo_check, @RequestParam("orderInfo_member_id") String orderInfo_member_id ) throws Exception {
		memberDto mDto = new memberDto();
		mDto = memberService.member_check(member_id);
		int cart_member_idx =  mDto.member_idx;
		String cart_member_id = member_id;
		
		System.out.println(cart_member_id);

		int result = 0;
		int result2 = 0;

		result = shoppingItemsService.order_insert2(member_id, total, cart_member_idx, 1, "주문 확인 중");
		List<cartDto> list = null;
		list = cartService.cart_view(cart_member_idx);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		orderService.order_insert(map);
		result2 = cartService.order_cart(cart_member_id);
		
		String orderInfo_status = "";
		if(orderInfo_check == 1) {
			orderInfo_status = "무통장입금";
		}
		orderInfoDto dto = new orderInfoDto();
		dto.setOrderInfo_address(orderInfo_address);
		dto.setOrderInfo_address_detail(orderInfo_address_detail);
		dto.setOrderInfo_address_extra(orderInfo_address_extra);
		dto.setOrderInfo_addressNumb(orderInfo_addressNumb);
		dto.setOrderInfo_member_id(orderInfo_member_id);
		dto.setOrderInfo_status(orderInfo_status);
		dto.setOrderInfo_name(orderInfo_name);
		dto.setOrderInfo_phone(orderInfo_phone);
		
		int result3 = orderInfoService.orderInfo_insert(dto);
		model.addAttribute("mainPage", "finish.jsp");
		
		return "users/home";
	}
	
	@RequestMapping("/order_list")
	public String order_list (Model model, @RequestParam("member_id") String member_id) throws Exception {
		

		memberDto dto = memberService.member_check(member_id);
		int items_member_idx = dto.member_idx;
		
		
		List<shoppingItemsDto> list = shoppingItemsService.user_order_list(items_member_idx);
		if(list.size() == 0) {
			model.addAttribute("error", "주문 내역이 없습니다.");
		}
		
		model.addAttribute("order_list", list);
		model.addAttribute("mainPage", "order_list.jsp");
		
		return "users/home";
	}
	
	@RequestMapping("/cart_delete")
	public String cart_delete(@RequestParam("cart_idx") int cart_idx,@RequestParam("member_id") String member_id, Model model) throws Exception{
		
		int result;
		
		result = cartService.cart_delete(cart_idx);
		
		
		return "redirect:/cart_view?member_id="+ member_id;
	}
	
	@RequestMapping("/order_view")
	public String order_view(@RequestParam("items_member_idx") int items_member_idx,@RequestParam("items_order_idx") int items_order_idx, Model model) throws Exception {
		
		int order_member_idx = items_member_idx;
		int order_idx = items_order_idx;
		List<orderDto> order_view = orderService.order_view(order_member_idx, order_idx);
		orderInfoDto dto = new orderInfoDto();
		
		dto = orderInfoService.orderInfo_view(order_idx);
		model.addAttribute("userDto", dto);
		model.addAttribute("order_view", order_view);
		model.addAttribute("mainPage", "order_view.jsp");
		
		return "users/home";
	}
	@RequestMapping("/user_order_view")
	public String user_order_view(@RequestParam("items_member_idx") int items_member_idx,@RequestParam("items_order_idx") int items_order_idx, Model model) throws Exception {
		
		int order_member_idx = items_member_idx;
		int order_idx = items_order_idx;
		List<orderDto> order_view = orderService.order_view(order_member_idx, order_idx);
		orderInfoDto dto = new orderInfoDto();
		dto = orderInfoService.orderInfo_view(order_idx);
		model.addAttribute("userDto", dto);
		model.addAttribute("order_view", order_view);
		model.addAttribute("myPage", "order_view.jsp");
		model.addAttribute("mainPage", "user_mypage.jsp");
		return "users/home";
	}
	@Autowired
	private faqService faqService;
	
	@RequestMapping(value = "/faq_list", method = RequestMethod.GET)
	public String faq_list(Model model, @RequestParam(value="num", required = false, defaultValue = "1") int num, 
			@RequestParam(value = "searchType",required = false, defaultValue = "id") String searchType,
			@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword
			) throws Exception {
	
		
		Page page = new Page();
		
		page.setNum(num);
		//page.setCount(service.count());		
		page.setCount(faqService.searchCount(searchType, keyword));
		
		// 검색 타입과 검색어
		page.setSearchTypeKeyword(searchType, keyword);
		page.setSearchType(searchType);
		page.setKeyword(keyword);
				
		List<faqDto> list = null; 
		//list = service.listPage(page.getDisplayPost(), page.getPostNum());
		list = faqService.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		model.addAttribute("mainPage", "user_mypage.jsp");
		model.addAttribute("myPage", "faq_list.jsp");
		
		return "users/home";
		
	}
	
	
	@RequestMapping("/faq_view")
	public String faq_view(@RequestParam("faq_idx") int faq_idx, Model model) throws Exception {
		
		faqDto dto = new faqDto();
		
		dto = faqService.view(faq_idx);
		model.addAttribute("dto", dto); 

		model.addAttribute("mainPage", "user_mypage.jsp");
		model.addAttribute("myPage", "faq_view.jsp");
		
		return "users/home";
	}
	@RequestMapping("/user_modify")
	public String user_modify(@RequestParam("member_id") String member_id, Model model) {
		
		model.addAttribute("mainPage", "user_mypage.jsp");
		model.addAttribute("myPage", "user_modify.jsp");
		
		return "users/home";
	}
	@RequestMapping("/user_pwModifyAction")
	public String user_pwModifyAction(@RequestParam("member_id2") String member_id2,@RequestParam("member_id") String member_id,
			@RequestParam("member_pw") String member_pw, HttpServletRequest request, Model model) throws Exception {

		memberDto dto = new memberDto();
		dto = memberService.member_check(member_id);
		
		int result = memberService.login(member_id, member_pw);
		System.out.println("result:" + result);
		if (result == 1 && member_id.equals(member_id2)) {
			System.out.println("alert:" + "정상처리되었습니다.");
			request.getSession().setAttribute("alert", "정상처리되었습니다.");
			request.getSession().setAttribute("member_id", member_id);
			request.getSession().setAttribute("member_pw", member_pw);
			model.addAttribute("mainPage", "user_mypage.jsp");
			model.addAttribute("myPage", "user_passwordModify2.jsp");
			model.addAttribute("dto", dto);
			return "users/home";
		} else {
			System.out.println("alert:" + "로그인 실패하였습니다.");

			model.addAttribute("alert", "로그인 실패하였습니다.");

			return "redirect:user_modify";
		}

	}
	@RequestMapping("/user_modifyAction")
	public String user_modifyAction(@RequestParam("member_id2") String member_id2,@RequestParam("member_id") String member_id,
			@RequestParam("member_pw") String member_pw, HttpServletRequest request, Model model) throws Exception {

		memberDto dto = new memberDto();
		dto = memberService.member_check(member_id);
		
		int result = memberService.login(member_id, member_pw);
		System.out.println("result:" + result);
		if (result == 1 && member_id.equals(member_id2)) {
			System.out.println("alert:" + "정상처리되었습니다.");
			request.getSession().setAttribute("alert", "정상처리되었습니다.");
			request.getSession().setAttribute("member_id", member_id);
			request.getSession().setAttribute("member_pw", member_pw);
			model.addAttribute("mainPage", "user_mypage.jsp");
			model.addAttribute("myPage", "user_modify2.jsp");
			model.addAttribute("dto", dto);
			return "users/home";
		} else {
			System.out.println("alert:" + "로그인 실패하였습니다.");

			model.addAttribute("alert", "로그인 실패하였습니다.");

			return "redirect:user_modify";
		}

	}
	
	@RequestMapping("/user_delete")
	public String user_delete(Model model) throws Exception {
		
		
		model.addAttribute("mainPage", "user_mypage.jsp");
		model.addAttribute("myPage", "user_delete.jsp");
		
		
		return "users/home";
	}
	@RequestMapping("/user_deleteAction")
	public String user_deleteAction(@RequestParam("member_id2") String member_id2,@RequestParam("member_id") String member_id,
			@RequestParam("member_pw") String member_pw, HttpServletRequest request, Model model) throws Exception {

		memberDto dto = new memberDto();
		dto = memberService.member_check(member_id);
		
		int result = memberService.login(member_id, member_pw);
		System.out.println("result:" + result);
		if (result == 1 && member_id.equals(member_id2)) {
			System.out.println("alert:" + "정상처리되었습니다.");
			request.getSession().setAttribute("alert", "정상처리되었습니다.");
			request.getSession().setAttribute("member_id", member_id);
			request.getSession().setAttribute("member_pw", member_pw);
			model.addAttribute("mainPage", "user_mypage.jsp");
			model.addAttribute("myPage", "user_delete2.jsp");
			model.addAttribute("dto", dto);
			return "users/home";
		} else {
			System.out.println("alert:" + "로그인 실패하였습니다.");

			model.addAttribute("alert", "로그인 실패하였습니다.");

			return "redirect:user_delete"; // index.jsp 디스패치
		}
	}

	@RequestMapping("member_id_modify")
	public String member_id_modify(Model model, @RequestParam("member_id") String member_id,
			@RequestParam("member_pw") String member_pw, @RequestParam("member_name") String member_name,
			@RequestParam("member_email") String member_email,
			@RequestParam("member_email_receive") String member_email_receive) throws Exception {

		int result = memberService.member_id_modify(member_id, member_pw, member_name, member_email, member_email_receive);


		return "redirect:/home";

	}
	@RequestMapping("member_pw_modify_action")
	public String member_pw_modify_action(Model model, @RequestParam("member_id") String member_id,
			@RequestParam("member_pw") String member_pw, @RequestParam("member_name") String member_name,
			@RequestParam("member_email") String member_email,
			@RequestParam("member_email_receive") String member_email_receive) throws Exception {

		int result = memberService.member_id_modify(member_id, member_pw, member_name, member_email, member_email_receive);


		return "redirect:/home";

	}
	@RequestMapping("user_delete_submit")
	public String user_delete_submit(HttpServletRequest request, Model model, @RequestParam("member_id") String member_id,
			@RequestParam("member_pw") String member_pw) throws Exception{
		
		int result = memberService.user_delete_submit(member_id, member_pw);
		request.getSession().invalidate();	
		return "redirect:/home";
	}
	
	@RequestMapping("user_cancel")
	public String user_cancel(Model model, @RequestParam("member_id") String member_id) throws Exception {
		List<orderDto> list = orderService.order_review(member_id);
		
		model.addAttribute("list", list);
		model.addAttribute("mainPage", "user_mypage.jsp");
		model.addAttribute("myPage", "user_cancel.jsp");	
		return "users/home";
	}
	@Autowired
	public CancelService cancelService;
	
	@RequestMapping("cancel_submit")
	public String cancel_submit(Model model, @RequestParam("cancel_id") String cancel_id, @RequestParam("cancel_title") String cancel_title, @RequestParam("cancel_content") String cancel_content, @RequestParam("cancel_status2") String cancel_status2) throws Exception {
		
		cancelDto dto = new cancelDto();
		String cancel_status = "";
		if(cancel_status2.equals("1")) {
			cancel_status = "단순 변심";
		}else if(cancel_status2.equals("2")) {
			cancel_status = "제품 이상 및 파손";
		}else if (cancel_status2.equals("3")) {
			cancel_status = "오배송";
		}else if (cancel_status2.equals("4")) {
			cancel_status = "기타";
		}
		
		dto.setCancel_content(cancel_content);
		dto.setCancel_id(cancel_id);
		dto.setCancel_status(cancel_status);
		dto.setCancel_title(cancel_title);

		cancelService.cancel_submit(dto);
		
		model.addAttribute("alert", "정상 처리되었습니다.");
		
		
		return "redirect:/home";
	}
	
	
	
	
	
	@RequestMapping(value = "/admin_cancel", method = RequestMethod.GET)
	public String admin_cancel(Model model, @RequestParam(value = "num", required = false, defaultValue = "1") int num,
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {

		Page page = new Page();

		page.setNum(num);
		// page.setCount(service.count());
		page.setCount(addService.searchCount(searchType, keyword));

		// 검색 타입과 검색어
		page.setSearchTypeKeyword(searchType, keyword);
		page.setSearchType(searchType);
		page.setKeyword(keyword);

		List<cancelDto> list = null;
		// list = service.listPage(page.getDisplayPost(), page.getPostNum());
		list = cancelService.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);

		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		
		return "admin_cancel";
	}
	
	@RequestMapping("/idFind")
	public String idFind(Model model) {
		
		model.addAttribute("mainPage", "idFind.jsp");
		
		return "users/home";
	}
	
	@RequestMapping("/admin_cancel_view")
	public String admin_cancel_view(Model model, @RequestParam("cancel_idx") int cancel_idx) throws Exception {
		
		cancelDto dto = new cancelDto();
		
		dto = cancelService.cancel_view(cancel_idx);
		
		model.addAttribute("dto", dto);
		
		return "admin_cancel_view";
	}
	
	@RequestMapping("/idFindAction")
	public String idFindAction(Model model, @RequestParam("member_name") String member_name, @RequestParam("member_email") String member_email) throws Exception {
		
		memberDto dto = new memberDto() ;
		
		dto = memberService.idFind(member_name, member_email);
		
		model.addAttribute("dto", dto);
		if(dto != null) {

			model.addAttribute("mainPage", "idFind2.jsp");
		} else {
			model.addAttribute("mainPage", "notFound.jsp");
		}
		
		
		
		System.out.println(member_name);
		System.out.println(member_email);
		return "users/home";
	}
	@RequestMapping("/passwordFind")
	public String passwordFind(Model model) {
		
		model.addAttribute("mainPage", "passwordFind.jsp");
		
		
		return "users/home";
	}
	
	@RequestMapping("/pwFindAction")
	public String pwFindAction (Model model, @RequestParam("member_name") String member_name,
			@RequestParam("member_email") String member_email, @RequestParam("member_id") String member_id) throws Exception {
		
		
		memberDto dto = new memberDto() ;
		
		dto = memberService.passwordFind(member_name, member_email, member_id);
		
		model.addAttribute("dto", dto);
		if(dto != null) {

			model.addAttribute("mainPage", "passwordFind2.jsp");
		} else {
			model.addAttribute("mainPage", "notFound.jsp");
		}
		
		
		return "users/home";
	}
	
	@RequestMapping("/pwModify")
	public String pwModify(Model model, @RequestParam("member_id") String member_id, @RequestParam("member_pw") String member_pw) throws Exception {
		
		int result = memberService.pwModify(member_pw, member_id);
		
		System.out.println("result : " + result);
		return "redirect:/home";
	}
	
	@RequestMapping("/user_passwordModify")
	public String user_passwordModify(@RequestParam("member_id") String member_id,Model model) {
		
		model.addAttribute("mainPage", "user_mypage.jsp");
		model.addAttribute("myPage", "user_passwordModify.jsp");
		
		return "users/home";
	}
	
	@RequestMapping("/user_pwFindAction")
	public String user_pwFindAction (Model model, @RequestParam("member_name") String member_name, @RequestParam("member_email") String member_email, @RequestParam("member_id") String member_id) throws Exception {
		
		
		memberDto dto = new memberDto() ;
		
		dto = memberService.passwordFind(member_name, member_email, member_id);
		
		model.addAttribute("dto", dto);
		if(dto != null) {
			model.addAttribute("mainPage", "user_mypage.jsp");
			model.addAttribute("myPage", "user_passwordFind2.jsp");
		} else {
			model.addAttribute("mainPage", "user_mypage.jsp");
			model.addAttribute("myPage", "notFound.jsp");
		}
		
		
		return "users/home";
	}
	
	@RequestMapping("/user_pwModify")
	public String user_pwModify(Model model, @RequestParam("member_id") String member_id, @RequestParam("member_pw") String member_pw) throws Exception {
		
		int result = memberService.pwModify(member_pw, member_id);
		
		System.out.println("result : " + result);
		return "redirect:/user_myPage";
	}
	@Autowired
	private MemberService2 memberService2;
	@RequestMapping(value = "/admin_memberList", method = RequestMethod.GET)
	public String admin_memberList(Model model, @RequestParam(value = "num", required = false, defaultValue = "1") int num,
			@RequestParam(value = "searchType", required = false, defaultValue = "id") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {

		Page page = new Page();

		page.setNum(num);
		// page.setCount(service.count());
		page.setCount(addService.searchCount(searchType, keyword));

		// 검색 타입과 검색어
		page.setSearchTypeKeyword(searchType, keyword);
		page.setSearchType(searchType);
		page.setKeyword(keyword);

		List<memberDto> list = null;
		// list = service.listPage(page.getDisplayPost(), page.getPostNum());
		list = memberService2.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);

		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		
		return "admin_memberList";
	}
	
	@RequestMapping("/user_howToCancel")
	public String user_howToCancel(Model model) {
		
		model.addAttribute("mainPage", "user_mypage.jsp");
		model.addAttribute("myPage", "user_howToCancel.jsp");
		
		return "users/home";
	}
	
}
