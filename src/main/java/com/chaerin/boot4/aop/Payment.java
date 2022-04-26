package com.chaerin.boot4.aop;



import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class Payment {
	
	@Around("execution(* com.chaerin.boot4.aop.Transfer.*())")
	public Object cardCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		//joinpoint 핵심로직메소드(bus, subway)
		System.out.println("탑승 전 카드체크");
		
		Object obj=joinPoint.proceed();
		
		System.out.println("하차 시 카드체크");
		
		return obj;
	}
	
	@Before("execution (* com.chaerin.boot4.board.BoardService.get*(..))")
	public void info() {
		System.out.println("before");
		
	}
	@AfterReturning("execution(* com.chaerin.boot4.aop.Transfer.*())")
	public void afterRetruning() {
		System.out.println("afterRetruning");
	}
	
	@AfterThrowing("execution (* com.chaerin.boot4.board.BoardService.get*(..))")
	public void afterThrowing() {
		System.out.println("afterThrowing");
	}
	@After("execution (* com.chaerin.boot4.board.BoardService.get*(..))")
	public void after() {
		System.out.println("after");
	}
//	@Around("execution (* com.chaerin.boot4.board.BoardService.get*(..))")
//	public void around() {
//		System.out.println("Before + Around");
//	}

}
