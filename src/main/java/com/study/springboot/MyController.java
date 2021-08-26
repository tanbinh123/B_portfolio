package com.study.springboot;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.springboot.dao.IAdminDao;
import com.study.springboot.service.AdminService;


@Controller
public class MyController {
	
	@Autowired
	private AdminService adminService;
	
	
	@Autowired
	private IAdminDao adminDao;
	
	
	@RequestMapping("/")
	public String root () {
		
		return "redirect:index";
	}
	
	@RequestMapping("/index")
	public String index () {
		
		return "index";
	}
	
	@RequestMapping("/admin")
	public String admin_login() {
		return "admin_login";
	}
	
	@RequestMapping("/admin_order")
	public String admin_order() {
		
		return "admin_order";
	}
	
	@RequestMapping("/order_view")
	public String order_view() {
		return "admin_order_view";
	}
	
	@RequestMapping("/Admin-LoginAction")
	public String loginAction(@RequestParam("admin_id") String admin_id,
							  @RequestParam("admin_pw") String admin_pw,
							  HttpServletRequest request,
								Model model) {
		
		int result = adminService.admin_login(admin_id, admin_pw);
		System.out.println("result:" + result);
		if( result == 1 ) {
			System.out.println("alert:" + "로그인되었습니다.");

			System.out.println("admin_id=" + admin_id);
			System.out.println("admin_pw=" + admin_pw);
			request.getSession().setAttribute("alert", "로그인되었습니다.");
			request.getSession().setAttribute("admin_id", admin_id);
			
			return "admin_order";  
		}else {
			System.out.println("alert:" + "로그인 실패하였습니다.");
			System.out.println("admin_id=" + admin_id);
			System.out.println("admin_pw=" + admin_pw);
			model.addAttribute("alert", "로그인 실패하였습니다.");
			
			return "redirect:admin"; //index.jsp 디스패치
		}
	}

	@RequestMapping("adminLogoutAction")
	public String logout(HttpServletRequest request, Model model) {
		
		request.getSession().invalidate();	
		
		request.getSession().setAttribute("alert", "로그아웃되었습니다.");
		
		return "redirect:admin";  
	}
}
