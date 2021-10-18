package com.study.springboot;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.Ignore;
import org.junit.Test;

public class JUnit4Exam {


	// 예외 테스트 
	@Test(expected = NumberFormatException.class) 
	public void testException() throws Exception { 
		String str = "hello"; 
		System.out.println(Integer.parseInt(str)); 
	} 
	
	// 테스트 시간 제한 
	@Test(timeout = 1000) 
	public void testTimeout() throws Exception { 
		long sum = 0; 
		for (int i = 0; i < 10000; i++) { 
			for (int j = 0; j < 10000; j++) { 
				sum += j; 
			} 
		} 
		System.out.println(sum); 
	} 
	
	/*
	 * // 테스트 무시
	 * 
	 * @Ignore
	 * 
	 * @Test public void testIgnore() throws Exception { assertTrue(false); }
	 */
	// 배열 지원 - 값이랑 순서까지 동일해야 함 
	@Test 
	public void testAssertArrayEquals() throws Exception { 
		Object[] a = {"Java", "Python", 1}; 
		Object[] b = {"Java", "Python", 1}; 
		assertArrayEquals("두 배열이 같은가?", a, b); 
	}

	//두 값이 같은 지 비교
	@Test 
	public void testAssertEquals() throws Exception { 
		assertEquals(10, 11); 
	}
	

	//두 객체가 동일한 객체인지 비교
	@Test 
	public void testAssertSame() throws Exception {
		Object obj1 = new Object();
		Object obj2 = new Object();
		
		assertSame("두 객체가 동일한 객체인지 비교", obj1, obj2);
	}
	
	@Test 
	public void testAssertNotSame() throws Exception {
		Object obj1 = new Object();
		Object obj2 = new Object();
		
		assertNotSame("두 객체가 동일한 객체인지 비교", obj1, obj2);
	}
	
	//참/거짓 판별
	@Test 
	public void testAssertTrue() throws Exception {
		Object obj1 = new Object();
		Object obj2 = new Object();
		
		assertTrue("참/거짓 판별", 10 > 20);
		
	}
	
	//null여부 판단
	@Test 
	public void testAssertNull() throws Exception {
		Object obj1 = new Object();
		Object obj2 = null;
		
		
		
		assertNull("참/거짓 판별", obj1);
		
	}
	
	@Test 
	public void testAssertNotNull() throws Exception {
		Object obj1 = new Object();
		Object obj2 = null;
		
		assertNotNull("참/거짓 판별", obj2);
		
	}
	
	
	//테스트 실패로 판단
	@Test 
	public void testFail() throws Exception {
		
		Object obj2 = null;
		
		if( obj2 == null ) {
			fail("테스트 실패로 판단");	
		}
		
	}
}
