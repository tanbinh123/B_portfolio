package com.study.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.study.springboot.service.AddService;
import com.study.springboot.service.CartItemsService;
import com.study.springboot.service.FaqService;
import com.study.springboot.service.ItemsService;
import com.study.springboot.service.MemberService;
import com.study.springboot.service.NoticeService;
import com.study.springboot.service.QnaService;
import com.study.springboot.service.ReviewService;

  
@Controller
public class MyController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private AddService addService;
	@Autowired
	private CartItemsService cartItemsService;
	@Autowired
	private FaqService faqService;
	@Autowired
	private ItemsService itemsService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private ReviewService reviewService;
	
}
