package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.ShoppingReplyDto;

//@Mapper : MyBatis와 인터페이스 함수를 연결함.
@Mapper
public interface IShoppingReplyDao {

	public List<ShoppingReplyDto> s_reply_list(String review_idx);
	public int s_reply( String s_reply_content, String s_reply_board_idx );
	public int s_reply_delete(String s_reply_idx);
}
