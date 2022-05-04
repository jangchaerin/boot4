package com.chaerin.boot4.exception;


import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class ExceptionController {
	
	//예외처리 메소드
		@ExceptionHandler(BindException.class)
		public ModelAndView ex1(Exception e) {
			ModelAndView mv=new ModelAndView();
			System.out.println(e.getMessage());
			System.out.println("예외발생");
			e.getStackTrace();
			
			mv.addObject("msg", "불편죄송");
			mv.addObject("path", "../");
			mv.setViewName("common/getResult");
			return mv;
		}
		
		@ExceptionHandler(NullPointerException.class)
		public ModelAndView ex2() {
			ModelAndView mv=new ModelAndView();
			System.out.println("nullpointer 예외발생");
			
			mv.setViewName("error/error");
			return mv;
		}
		@ExceptionHandler(Exception.class)
		public ModelAndView ex3() {
			ModelAndView mv=new ModelAndView();
			System.out.println("exception 예외발생");
			
			mv.setViewName("error/error");
			return mv;
		}
		@ExceptionHandler(Throwable.class)
		public ModelAndView ex4() {
			ModelAndView mv=new ModelAndView();
			System.out.println("throwable 예외발생");
			
			mv.setViewName("error/error");
			return mv;
		}
		//400번대 에러
		@ExceptionHandler(NoHandlerFoundException.class)
		public ModelAndView ex5() {
			ModelAndView mv=new ModelAndView();
			System.out.println("400번대 예외발생");
			mv.addObject("message", "page를 찾을 수 없습니다.");
			mv.setViewName("error/error");
			return mv;
		}

}
