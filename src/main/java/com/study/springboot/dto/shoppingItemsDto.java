package com.study.springboot.dto;

import lombok.Data;

@Data
public class shoppingItemsDto {
	

	public int	 	    items_idx;       
	public String	    items_img;    
	public String	    items_title;     
	public int	  	    items_price;
	public int		    items_numb;
	public int		    items_status; 
	public String	    items_name;
	public String	    items_email;
	public int		    items_member_idx;
	
	public shoppingItemsDto() {
		
	}
	
	
	public shoppingItemsDto(int items_idx, String items_img, String items_title, int items_price, int items_numb,
			int items_status, String items_name, String items_email, int items_member_idx) {
		super();
		this.items_idx = items_idx;
		this.items_img = items_img;
		this.items_title = items_title;
		this.items_price = items_price;
		this.items_numb = items_numb;
		this.items_status = items_status;
		this.items_name = items_name;
		this.items_email = items_email;
		this.items_member_idx = items_member_idx;
	}   
	
	
}
