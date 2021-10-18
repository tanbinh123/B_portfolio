package com.study.springboot;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.study.springboot.service.MemberService;

public class JUnit4test2 {

	@Test
	public void login() {
		MemberService service = new MemberService();
		int result = service.login("hong", "1234");
		
		assertTrue("로그인 판별", result > 0);
		
	}

	@Test
	public void Join() throws Exception {

		MemberService service = new MemberService();
		int result = service.member_join("member1234", "qlalfqjsgh", "이름", "email@email.com", "1");

		assertTrue("회원가입 여부", result > 0);
	}
}
