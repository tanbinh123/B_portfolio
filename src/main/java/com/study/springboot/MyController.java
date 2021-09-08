package com.study.springboot;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.springboot.dto.noticeDto;
import com.study.springboot.dto.shoppingItemsDto;
import com.study.springboot.service.AdminService;
import com.study.springboot.service.NoticeService;
import com.study.springboot.service.ShoppingItemsService;

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
	public String root() throws Exception{
		System.out.println("path:" + context.getRealPath("/") );
		System.out.println("path:" + context.getContextPath() );
		String path = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
		System.out.println("path:" + path );
		
		return "redirect:index";
	}

	@RequestMapping("/index")
	public String index() {

		return "index";
	}

	@RequestMapping("/admin")
	public String admin_login() {
		return "admin_login";
	}

	@RequestMapping("/admin_order")
	public String admin_order(HttpServletRequest request, Model model) {
		List<shoppingItemsDto> order_list = shoppingItemsService.admin_order_list();
		model.addAttribute("order_list", order_list);
		return "admin_order";
	}

	@RequestMapping("/order_view")
	public String order_view() {
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

			return "admin_order";
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
											@RequestParam("notice_content") String notice_content,
											HttpServletRequest request,
											Model model) {

		int result;
		
		result = noticeService.notice_write(notice_title, notice_content);
		if( result == 1 ) {
			request.getSession().setAttribute("alert", "작성성공.");
			
			return "redirect:/admin_notice";  
		}else {
			model.addAttribute("alert", "작성실패.");
			
			return "redirect:/admin_notice"; 
		}
	}
	
	@RequestMapping("admin_notice_view")
	public String admin_notice_view (@RequestParam("notice_idx") String notice_idx,
			HttpServletRequest request) {
		
		noticeDto dto = noticeService.notice_view(notice_idx);
		request.setAttribute("dto", dto);
		
		return "admin_notice_view";
	}
	@RequestMapping("admin_notice_modify_action")
	public String admin_notice_modify_action(@RequestParam("notice_idx") String notice_idx,
											@RequestParam("notice_title") String notice_title,
											@RequestParam("notice_content") String notice_content, Model model, HttpServletRequest request) {
		
		int result;
		result = noticeService.notice_modify(notice_idx, notice_title, notice_content);
		if( result == 1 ) {
			request.getSession().setAttribute("alert", "작성성공.");
			
			return "redirect:/admin_notice";  
		}else {
			model.addAttribute("alert", "작성실패.");
			
			return "redirect:/admin_notice"; 
		}
	}


}
