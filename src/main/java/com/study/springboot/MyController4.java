package com.study.springboot;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.springboot.dao.IQnaDao;
import com.study.springboot.dao.IQnaReplyDao;
import com.study.springboot.dto.BoardVO2;
import com.study.springboot.dto.Page;
import com.study.springboot.dto.QnaDto;
import com.study.springboot.dto.QnaReplyDto;
import com.study.springboot.dto.memberDto;
import com.study.springboot.service.BoardService3;
import com.study.springboot.service.MemberService;
import com.study.springboot.service.QnaService;

@Controller
public class MyController4 {

	@Autowired
	private QnaService QnaService;
	
	@Autowired
	private IQnaReplyDao qna_reply_dao;
	
	@Autowired
	private IQnaDao qna_dao;

	//관리자 qna
	@RequestMapping(value = "/admin_qna", method = RequestMethod.GET)
	public String admin_qna(Model model, @RequestParam(value="num", required = false, defaultValue = "1") int num, 
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
				
		List<QnaDto> list = null; 
		//list = service.listPage(page.getDisplayPost(), page.getPostNum());
		list = boardService.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		
		model.addAttribute("qna_list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
		model.addAttribute("mainPage", "user_mypage.jsp");
		model.addAttribute("myPage", "user_qna.jsp");
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		return "admin_qna";
		
	}

	
	
	@RequestMapping("/admin_qna_view") public String admin_qna_view(@RequestParam("qna_idx") String qna_idx,
			HttpServletRequest request, Model model) {

		QnaDto dto = QnaService.admin_qna_view(qna_idx); 
		request.setAttribute("dto", dto);
		
		List<QnaReplyDto> qna_reply_list= qna_reply_dao.qna_reply_list(qna_idx);
		model.addAttribute("qna_reply_list", qna_reply_list);
		
		return "admin_qna_view"; 
	}
	
	//Qna댓글쓰기
	@RequestMapping("/qna_reply")
	public String qna_reply( @RequestParam("reply_qna_idx") String reply_qna_idx,
							 @RequestParam("reply_content") String reply_content,Model model) {
				
		int result = qna_reply_dao.qna_reply(reply_content, reply_qna_idx);
		
		return "redirect:admin_qna_view?qna_idx="+reply_qna_idx;
	}
	
	//Qna댓글삭제
	@RequestMapping("/qna_reply_delete")
	public String reply_delete( @RequestParam("reply_idx") String reply_idx,
								@RequestParam("reply_qna_idx") String reply_qna_idx,
								Model model ) {
		
		qna_reply_dao.qna_reply_delete(reply_idx);
		
		return "redirect:admin_qna_view?qna_idx="+reply_qna_idx; 
	}
	
	//사용자 qna
	
	@Autowired
	public BoardService3 boardService;
	
	@RequestMapping(value = "/user_qna", method = RequestMethod.GET)
	public String getListPageSearch(Model model, @RequestParam(value="num", required = false, defaultValue = "1") int num, 
			@RequestParam(value = "searchType",required = false, defaultValue = "id") String searchType,
			@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword
			) throws Exception {
	
		Page page = new Page();
		page.setNum(num);
		page.setCount(boardService.searchCount(searchType, keyword));
		page.setSearchTypeKeyword(searchType, keyword);
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		List<QnaDto> list = null; 
		list = boardService.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		
		model.addAttribute("qna_list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
		model.addAttribute("mainPage", "user_mypage.jsp");
		model.addAttribute("myPage", "user_qna.jsp");
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		return "users/home";
		
	}

	@Autowired
	public MemberService memberService;
	//Qna 글쓰기
	@RequestMapping("/qna_write")
	public String qna_write(Model model, @RequestParam("member_id") String member_id) throws Exception {
		
		memberDto dto =  memberService.member_check(member_id);
		
		String member_name = dto.member_name;
		
		model.addAttribute("member_name", member_name);
		
		model.addAttribute("mainPage", "user_mypage.jsp");
		model.addAttribute("myPage", "user_qna_write.jsp");
		return "users/home";
	}
	
	@RequestMapping("qna_write_action")
	public String qna_write_action(@RequestParam("qna_title") String qna_title,
								   @RequestParam("qna_name") String qna_name,
								   @RequestParam("qna_pw") String qna_pw,
								   @RequestParam("qna_content") String qna_content, 
								   
								   HttpServletRequest request, Model model) {
		
		QnaService.qna_write(qna_title, qna_name, qna_pw, qna_content);
		
		List<QnaDto> qna_list = QnaService.qna_list();
		request.setAttribute("qna_list", qna_list);
		
		model.addAttribute("mainPage", "user_mypage.jsp");
		model.addAttribute("myPage", "user_qna.jsp");
		return "users/home";
	}
	
	//Qna 글삭제
	@RequestMapping("/qna_delete")
	public String reply_delete( @RequestParam("qna_idx") String qna_idx,
								HttpServletRequest request, Model model ) {
		
		qna_dao.qna_delete(qna_idx);
		
		List<QnaDto> qna_list = QnaService.qna_list();
		request.setAttribute("qna_list", qna_list);
		model.addAttribute("mainPage", "user_mypage.jsp");
		model.addAttribute("myPage", "user_qna.jsp");
		return "users/home";
	}
	
	//Qna 글 수정
	
	@RequestMapping("/qna_modify")
	public String qna_modify(@RequestParam("qna_idx") String qna_idx, HttpServletRequest request, Model model) {

		QnaDto dto = QnaService.qna_view(qna_idx);
		request.setAttribute("dto", dto);
		
		model.addAttribute("mainPage", "user_mypage.jsp");
		model.addAttribute("myPage", "user_qna_modify.jsp");
		return "users/home";
	}
	
	@RequestMapping("qna_modify_action")
	public String qna_modify_action(@RequestParam("qna_idx") String qna_idx,
									@RequestParam("qna_title") String qna_title, 
									@RequestParam("qna_content") String qna_content,
									Model model, HttpServletRequest request) {

		QnaService.qna_modify(qna_idx, qna_title, qna_content);
		
		List<QnaDto> qna_list = QnaService.qna_list();
		request.setAttribute("qna_list", qna_list);
		
		model.addAttribute("mainPage", "user_mypage.jsp");
		model.addAttribute("myPage", "user_qna_view.jsp");
		
		return "redirect:/qna_view?qna_idx="+qna_idx;
	}
	
	@RequestMapping("/qna_view")
	public String qna_view(@RequestParam("qna_idx") String qna_idx, HttpServletRequest request, Model model) {

		QnaDto dto = QnaService.qna_view(qna_idx);
		request.setAttribute("dto", dto);
		
		List<QnaReplyDto> qna_reply_list= qna_reply_dao.qna_reply_list(qna_idx);
		model.addAttribute("qna_reply_list", qna_reply_list);
		
		model.addAttribute("mainPage", "user_mypage.jsp");
		model.addAttribute("myPage", "user_qna_view.jsp");
		return "users/home";
	}
	
	

	 

}

