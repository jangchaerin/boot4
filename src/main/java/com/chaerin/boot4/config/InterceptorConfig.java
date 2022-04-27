package com.chaerin.boot4.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.chaerin.boot4.inteceptor.AdminInterceptor;
import com.chaerin.boot4.inteceptor.MemberInterceptor;
import com.chaerin.boot4.inteceptor.SellerInterceptor;
@Configuration
public class InterceptorConfig implements WebMvcConfigurer{
	
	@Autowired
	private SellerInterceptor sellerInterceptor;
	@Autowired
	private AdminInterceptor adminInterceptor;
	@Autowired
	private MemberInterceptor memberInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//적용할 Interceptor를 등록
		registry.addInterceptor(sellerInterceptor)
		//interceptro를 사용할 url주소를 적어줌
				.addPathPatterns("/product/manage");
				//.addPathPatterns("") -> 이렇게 쭈우욱 여러개 쓸수있음 세미콜론은 제일 마지막에만
		
		registry.addInterceptor(adminInterceptor)
				.addPathPatterns("/admin/manage");
		
		registry.addInterceptor(memberInterceptor)
				.addPathPatterns("/board/*")
				.excludePathPatterns("/board/list");
				
		//제외할 url
				//.excludePathPatterns("")
		
		//추가로 다른 interceptor 등록
		//registry.addInterceptor(인터셉터명)
				//.addPathPatterns("")
		
		
		
		//WebMvcConfigurer.super.addInterceptors(registry); ->오버라이딩할떄 자동으로 만들어진건데 안해줘도됨
		
	}

}