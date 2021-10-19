package com.study.springboot;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.springboot.dao.IShoppingDao;
import com.study.springboot.dao.IShoppingReplyDao;
import com.study.springboot.dto.Page;
import com.study.springboot.dto.ShoppingReplyDto;
import com.study.springboot.dto.addDto;
import com.study.springboot.dto.orderDto;
import com.study.springboot.dto.shoppingDto;
import com.study.springboot.service.AddService;
import com.study.springboot.service.BoardService4;
import com.study.springboot.service.CartService;
import com.study.springboot.service.MemberService;
import com.study.springboot.service.OrderService;
import com.study.springboot.service.ShoppingService;

@Controller
public class MyController5 {

	@Autowired
	private IShoppingDao shopping_dao;
	@Autowired
	private ShoppingService shoppingService;
	
	@Autowired 
	private IShoppingReplyDao s_reply_dao;

	@Autowired
	public CartService cartService;
	
	@Autowired
	public AddService addService;
	
	
	@RequestMapping("/reply.do")
	public String reply( @RequestParam("s_reply_board_idx") String s_reply_board_idx,
						@RequestParam("s_reply_content") String s_reply_content,
		
						Model model) {
		
		int result = s_reply_dao.s_reply( s_reply_content, s_reply_board_idx  );
		System.out.println( "result:" + result); //성공시 insert갯수(1)로 리턴함.
				
		return "redirect:admin_shopping_review_view?review_idx="+s_reply_board_idx; //content_view 로 리다이렉트함..
	}
	
	@RequestMapping("/s_reply_delete.do")
	public String s_reply_delete( @RequestParam("s_reply_idx") String s_reply_idx,
								@RequestParam("s_reply_board_idx") String s_reply_board_idx,
								Model model ) {
		
		s_reply_dao.s_reply_delete(s_reply_idx);
		
		return "redirect:admin_shopping_review_view?review_idx="+s_reply_board_idx; // content_view 로 리다이렉트함..
	}

	@RequestMapping("admin_shopping_review_write")
	public String admin_shopping_review_write() {

		return "admin_shopping_review_write";
	}

	@RequestMapping("admin_shopping_review_view")
	public String admin_shopping_review_view (@RequestParam("review_idx") String review_idx,
			HttpServletRequest request, Model model) {
		
		shoppingDto dto = shoppingService.shopping_review_view(review_idx);
		request.setAttribute("dto", dto);
		
		List<ShoppingReplyDto> s_reply_list = s_reply_dao.s_reply_list( review_idx );
		model.addAttribute("s_reply_list", s_reply_list );
		
		return "admin_shopping_review_view";
	}
	@RequestMapping("/shopping_review_modify")
	public String shopping_review_modify(@RequestParam("review_idx") String review_idx, HttpServletRequest request, Model model,@RequestParam("member_id") String member_id) throws Exception {

		shoppingDto dto = shoppingService.shopping_review_view(review_idx);
		request.setAttribute("dto", dto);
		
		List<orderDto> list = orderService.order_review(member_id);
		
		model.addAttribute("list", list);
		
		model.addAttribute("mainPage", "user_mypage.jsp");
		model.addAttribute("myPage", "shopping_review_modify.jsp");
		return "users/home";
	}
	@RequestMapping("shopping_review_modify_action")
	public String shopping_review_modify_action(@RequestParam("review_idx") String review_idx,
									@RequestParam("review_title") String review_title, 
									@RequestParam("review_content") String review_content,
									@RequestParam("review_items") String review_items,
									Model model, HttpServletRequest request) throws Exception{
		addDto addDto = new addDto();
		addDto = addService.review_add(review_items);
		
		String review_img = addDto.add_img;
		shoppingService.shopping_review_modify(review_idx, review_title, review_content, review_items, review_img);
		
		List<shoppingDto> shopping_review_list = shoppingService.shopping_review_list();
		request.setAttribute("shopping_review_list", shopping_review_list);
		
		model.addAttribute("mainPage", "user_mypage.jsp");
		model.addAttribute("myPage", "shopping_review_view.jsp");
		
		return "redirect:/shopping_review_view?review_idx="+review_idx;
	}
	//사용자 shopping_review
	@Autowired
	public BoardService4 boardService;
	
	
	@RequestMapping(value = "/shopping_review", method = RequestMethod.GET)
	public String shopping_review(Model model, @RequestParam(value="num", required = false, defaultValue = "1") int num, 
			@RequestParam(value = "searchType",required = false, defaultValue = "id") String searchType,
			@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword
			) throws Exception {
		Page page = new Page();
		page.setNum(num);	
		page.setCount(boardService.searchCount(searchType, keyword));
		page.setSearchTypeKeyword(searchType, keyword);
		page.setSearchType(searchType);
		page.setKeyword(keyword);
				
		List<shoppingDto> list = null; 
		list = boardService.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);

		
		model.addAttribute("mainPage", "user_mypage.jsp");
		model.addAttribute("myPage", "shopping_review.jsp");
		return "users/home";
		
	}
	
	
	@RequestMapping(value = "/admin_shopping_review", method = RequestMethod.GET)
	public String admin_shopping_review(Model model, @RequestParam(value="num", required = false, defaultValue = "1") int num, 
			@RequestParam(value = "searchType",required = false, defaultValue = "id") String searchType,
			@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword
			) throws Exception {
	
		
		Page page = new Page();
		
		page.setNum(num);
		//page.setCount(service.count());		
		page.setCount(boardService.searchCount(searchType, keyword));
		
		// 검색 타입과 검색어
		page.setSearchTypeKeyword(searchType, keyword);
		page.setSearchType(searchType);
		page.setKeyword(keyword);
				
		List<shoppingDto> list = null; 
		//list = service.listPage(page.getDisplayPost(), page.getPostNum());
		list = boardService.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);

		
		return "admin_shopping_review";
		
	}
	@Autowired
	public MemberService memberService;
	
	
	@Autowired
	public OrderService orderService;
	@RequestMapping("/shopping_review_write")
	public String shopping_review_write(Model model,HttpServletRequest request, @RequestParam("member_id") String member_id) throws Exception {
		
		List<orderDto> list = orderService.order_review(member_id);
		
		model.addAttribute("list", list);
		model.addAttribute("mainPage", "user_mypage.jsp");
		model.addAttribute("myPage", "shopping_review_write.jsp");
		return "users/home";
	}
	
	@RequestMapping("shopping_review_write_action")
	public String shopping_review_write_action(@RequestParam("review_title") String review_title,
								   @RequestParam("review_content") String review_content,
								   @RequestParam("review_items") String review_items,
								   @RequestParam("review_member_id") String review_member_id,
								   
								   HttpServletRequest request, Model model) throws Exception {
		
		addDto addDto = new addDto();
		addDto = addService.review_add(review_items);
		
		String review_img = addDto.add_img;
		
		shoppingService.shopping_review_write(review_title, review_content, review_member_id, review_items, review_img);
	
		
		model.addAttribute("mainPage", "user_mypage.jsp");
		model.addAttribute("myPage", "shopping_review.jsp");
		return "redirect:shopping_review?member_id=" + review_member_id;
	}
	@RequestMapping("/shopping_review_view")
	public String shopping_review_view(@RequestParam("review_idx") String review_idx, HttpServletRequest request, Model model) {

		shoppingDto dto = new shoppingDto();
		dto = shoppingService.shopping_review_view(review_idx);
		String reviewMember_id = dto.review_member_id;
		request.setAttribute("dto", dto);
		request.getSession().setAttribute("review_member_id", reviewMember_id);
		System.out.println(reviewMember_id);
		
		List<ShoppingReplyDto> s_reply_list = s_reply_dao.s_reply_list( review_idx );
		model.addAttribute("s_reply_list", s_reply_list );
		
		model.addAttribute("mainPage", "user_mypage.jsp");
		model.addAttribute("myPage", "shopping_review_view.jsp");
		return "users/home";
	}
	
	@RequestMapping("/shopping_review_delete")
	public String shopping_review_delete( @RequestParam("review_idx") String review_idx,
								HttpServletRequest request, Model model ) {
		
		shopping_dao.admin_shopping_review_delete(review_idx);
		
		return "redirect:shopping_review";
	}
}
