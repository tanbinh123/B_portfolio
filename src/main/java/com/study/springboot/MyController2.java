package com.study.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController2 {

	
	@RequestMapping("/")
	public String root () {
		
		return "redirect:index";
	}
	
	@RequestMapping("/index")
	public String index () {
		
		return "index";
	}
}
