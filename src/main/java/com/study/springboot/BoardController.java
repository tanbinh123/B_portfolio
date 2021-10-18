package com.study.springboot;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.springboot.dto.BoardVO;
import com.study.springboot.dto.Page;
import com.study.springboot.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	
	// 게시물 목록 + 페이징 추가 + 검색
		@RequestMapping(value = "/user_notice", method = RequestMethod.GET)
		public String user_notice(Model model, @RequestParam(value="num", required = false, defaultValue = "1") int num, 
				@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
				@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword
				) throws Exception {
		
			
			Page page = new Page();
			
			page.setNum(num);
			//page.setCount(service.count());		
			page.setCount(service.searchCount(searchType, keyword));
			
			// 검색 타입과 검색어
			page.setSearchTypeKeyword(searchType, keyword);
			page.setSearchType(searchType);
			page.setKeyword(keyword);
					
			List<BoardVO> list = null; 
			//list = service.listPage(page.getDisplayPost(), page.getPostNum());
			list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
			
			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			
			model.addAttribute("searchType", searchType);
			model.addAttribute("keyword", keyword);
			model.addAttribute("mainPage", "user_notice.jsp");
			
			return "users/home";
			
		}
	
	
	// 게시물 목록 + 페이징 추가 + 검색
	@RequestMapping(value = "/admin_notice", method = RequestMethod.GET)
	public String getListPageSearch(Model model, @RequestParam(value="num", required = false, defaultValue = "1") int num, 
			@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword
			) throws Exception {
	
		
		Page page = new Page();
		
		page.setNum(num);
		//page.setCount(service.count());		
		page.setCount(service.searchCount(searchType, keyword));
		
		// 검색 타입과 검색어
		page.setSearchTypeKeyword(searchType, keyword);
		page.setSearchType(searchType);
		page.setKeyword(keyword);
				
		List<BoardVO> list = null; 
		//list = service.listPage(page.getDisplayPost(), page.getPostNum());
		list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		return "admin_notice";
		
	}


}
