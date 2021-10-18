package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study.springboot.dto.cartDto;

@Repository
public class ICartDaoImpl implements ICartDao {

	@Autowired
	private SqlSession sql;
	
	private static String namespace = "com.study.springboot.dao.ICartDao";

	public void addCart (cartDto dto) throws Exception {
		
		sql.insert(namespace + ".addCart", dto);
	}
	@Override
	public List<cartDto> cart_view(int cart_member_idx) throws Exception {
	
		return sql.selectList(namespace + ".cart_view", cart_member_idx);
	}

	@Override
	public int cart_delete(int cart_idx) throws Exception {
		
		return sql.delete(namespace + ".cart_delete", cart_idx);
	}
	@Override
	public int order_cart(String cart_member_id) throws Exception {
		
		return sql.delete(namespace + ".order_cart", cart_member_id);
	}
}
