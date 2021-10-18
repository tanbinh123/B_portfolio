package com.study.springboot.dto;

import lombok.Data;

@Data
public class orderInfoDto {
	
	public int orderInfo_idx;
	public String orderInfo_addressNumb;
	public String orderInfo_address;
	public String orderInfo_address_detail;
	public String orderInfo_address_extra;
	public String orderInfo_status;
	public String orderInfo_member_id;
	public String orderInfo_name;
	public String orderInfo_phone;
	
	
	public orderInfoDto() {
		
	}


	public orderInfoDto(int orderInfo_idx, String orderInfo_addressNumb, String orderInfo_address,
			String orderInfo_address_detail, String orderInfo_address_extra, String orderInfo_status,
			String orderInfo_member_id, String orderInfo_name, String orderInfo_phone) {
		super();
		this.orderInfo_idx = orderInfo_idx;
		this.orderInfo_addressNumb = orderInfo_addressNumb;
		this.orderInfo_address = orderInfo_address;
		this.orderInfo_address_detail = orderInfo_address_detail;
		this.orderInfo_address_extra = orderInfo_address_extra;
		this.orderInfo_status = orderInfo_status;
		this.orderInfo_member_id = orderInfo_member_id;
		this.orderInfo_name = orderInfo_name;
		this.orderInfo_phone = orderInfo_phone;
	}


}
