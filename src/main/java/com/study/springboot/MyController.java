package com.study.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController {

	
	@RequestMapping("/")
	public String root () {
		
		return "redirect:index";
	}
	
	@RequestMapping("/index")
	public String index () {
		
		return "index";
	}
	
	@RequestMapping("/admin_order")
	public String admin_order() {
		
		return "admin_order";
	}
}
