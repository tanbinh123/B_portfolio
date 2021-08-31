package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

@Data
public class noticeDto {

	public int notice_idx;
    public String notice_title;
    public String notice_content;
    public Date notice_date;

    

    
    
    public noticeDto() {
    	
    }

	public noticeDto(int notice_idx, String notice_title, String notice_content, Date notice_date) {
		super();
		this.notice_idx = notice_idx;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
	}


}
