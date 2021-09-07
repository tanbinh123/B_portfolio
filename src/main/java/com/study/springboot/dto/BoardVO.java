package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
/*
create table tbl_board(
	bno int not null auto_increment,
	title varchar(50) not null,
	content text not null,
	writer varchar(30) not null,
	regDate timestamp not null default now(),
	viewCnt int default 0,
	primary key(bno)
);
*/
	public BoardVO() {
		
	}

	public BoardVO(int notice_idx, String notice_title, String notice_content, Date notice_date) {
		super();
		this.notice_idx = notice_idx;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
	}

	public int notice_idx;
    public String notice_title;
    public String notice_content;
    public Date notice_date;

	
}
