package com.study.springboot.dto;

import lombok.Data;

@Data
public class faqDto {

	
	public int faq_idx;
	public String faq_title;
	public String faq_content;
	public faqDto(int faq_idx, String faq_title, String faq_content) {
		super();
		this.faq_idx = faq_idx;
		this.faq_title = faq_title;
		this.faq_content = faq_content;
	}
	
	
	public faqDto() {
		
	}
}
