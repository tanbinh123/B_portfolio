package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO2 {
	
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
	public BoardVO2() {
		
	}



	public int	 	    items_idx;      
	public String	    items_title;     
	public int	  	    items_price;
	public int		    items_status; 
	public int		    items_member_idx;
	public String 		items_status2;
	public int 			items_order_idx;
	public BoardVO2(int items_idx,  String items_title, int items_price,
			int items_status, int items_member_idx, String items_status2, int items_order_idx) {
		super();
		this.items_idx = items_idx;
		this.items_title = items_title;
		this.items_price = items_price;
		this.items_status = items_status;
		this.items_member_idx = items_member_idx;
		this.items_status2 = items_status2;
		this.items_order_idx = items_order_idx;
	}
	

	
}
