package com.study.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;


@ComponentScan(basePackages={"com.study.springboot.controller"})
@SpringBootApplication(scanBasePackages = {"com.study.springboot.controller"})
public class Ex17ExampleApplication {

	public static void main(String[] args) {
		SpringApplication.run(Ex17ExampleApplication.class, args);
	}

}
