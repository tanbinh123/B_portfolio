package com.study.springboot;

import static org.junit.Assert.fail;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;

import org.junit.Test;

public class JUnit4Test {

	@Test
	public void test() {
		fail("Not yet implemented");
	}

	//@BeforeClass 테스트 클래스 내에서 수행 전 한 번만 실행, static method 여야 함
	@BeforeClass 
	public static void setUpBeforeClass() throws Exception { 
		System.out.println("@BeforeClass"); 
	}
	
	//@AfterClass : 테스트 클래스 내에서 수행 후 한 번만 실행, static method 여야 함
	@AfterClass 
	public static void tearDownAfterClass() throws Exception { 
		System.out.println("@AfterClass"); 
	}
	
	//@Before : 매회 테스트 케이스 수행 전 반복실행
	@Before 
	public void setUp() throws Exception { 
		System.out.println("@Before"); 
	}
	
	//@After : 매회 테스트 케이스 수행 후 반복실행
	@After 
	public void tearDown() throws Exception { 
		System.out.println("@After"); 
	}
	
	//@Test : 테스트 메소드 지정
	@Test 
	public void testCase1() throws Exception { 
		System.out.println("testCase1"); 
	}
	
	@Test 
	public void testCase2() throws Exception { 
		System.out.println("testCase2"); 
	}

}
