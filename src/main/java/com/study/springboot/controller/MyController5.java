package com.study.springboot.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.springboot.dto.shoppingDto;
import com.study.springboot.service.ShoppingService;
@Controller
public class MyController5 {
	
	@Autowired
	private ShoppingService shoppingService;

@RequestMapping("admin_shopping_review")
	public String shopping_review_list( HttpServletRequest request,
			Model model) {
		List<shoppingDto> shopping_review_list = shoppingService.shopping_review_list();
		request.setAttribute("shopping_review_list", shopping_review_list);
		return "admin_shopping_review";
	}
	@RequestMapping("admin_shopping_review_write")
	public String admin_shopping_review_write() {

		return "admin_shopping_review_write";
	}
	@RequestMapping("admin_shopping_review_write_action")
	public String admin_shopping_review_write_action(@RequestParam("review_title") String review_title,
											@RequestParam("review_content") String review_content,
											HttpServletRequest request,
											Model model) {

		int result;
		
		result = shoppingService.shopping_review_write(review_title, review_content);
		if( result == 1 ) {
			request.getSession().setAttribute("alert", "작성성공.");
			
			return "redirect:/admin_shopping_review";  
		}else {
			model.addAttribute("alert", "작성실패.");
			
			return "redirect:/admin_shopping_review"; 
		}
	}
	@RequestMapping("admin_shopping_review_view")
	public String admin_shopping_review_view (@RequestParam("review_idx") String review_idx,
			HttpServletRequest request) {
		
		shoppingDto dto = shoppingService.shopping_review_view(review_idx);
		request.setAttribute("dto", dto);
		
		return "admin_shopping_review_view";
	}
	@RequestMapping("admin_shopping_review_modify")
	public String admin_shopping_review_modify(@RequestParam("review_idx") String review_idx,
											@RequestParam("review_title") String review_title,
											@RequestParam("review_content") String review_content, Model model, HttpServletRequest request) {
		
		int result;
		result = shoppingService.shopping_review_modify(review_idx, review_title, review_content);
		if( result == 1 ) {
			request.getSession().setAttribute("alert", "작성성공.");
			
			return "redirect:/admin_shopping_review";  
		}else {
			model.addAttribute("alert", "작성실패.");
			
			return "redirect:/admin_shopping_review"; 
			
		}
	}
}