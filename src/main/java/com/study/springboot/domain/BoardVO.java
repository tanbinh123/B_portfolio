package com.study.springboot.domain;

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
	private int notice_idx;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	
	public BoardVO() {
		
	}
}
