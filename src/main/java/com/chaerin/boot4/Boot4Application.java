package com.chaerin.boot4;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.scheduling.annotation.EnableScheduling;
//@EnableAspectJAutoProxy 
@EnableScheduling
@SpringBootApplication
public class Boot4Application {

	public static void main(String[] args) {
		SpringApplication.run(Boot4Application.class, args);
	}

}
