package com.chaerin.boot4.config;

import java.util.Locale;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@Configuration		//Legacy에서의 ***-context.xml 역할
public class MessageConfig implements WebMvcConfigurer{
	
	@Bean		//Legacy에서의 <bean class=""> 객체 생성하는 것 대신에 java에서 만들것
	public LocaleResolver localeResolver(){
		
		//1. Session 으로 구별
		SessionLocaleResolver sessionLocaleResolver = new SessionLocaleResolver();
		sessionLocaleResolver.setDefaultLocale(Locale.KOREAN);
		
		//2. Cookie 으로 구별
		CookieLocaleResolver cookieLocaleResolver = new CookieLocaleResolver();
		cookieLocaleResolver.setDefaultLocale(Locale.KOREAN);
		cookieLocaleResolver.setCookieName("lang");
			
		//둘중 하나 사용
		return sessionLocaleResolver;	//cookieLocaleResolver
		
	}
	
	@Bean
	public LocaleChangeInterceptor localeChangeInterceptor() {
		LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
		
		localeChangeInterceptor.setParamName("lang");
		//parameter를 받아서 언어 구분
		//url?lang=en -> 영어 url?lang=ko -> 한국어
		
		return localeChangeInterceptor;
		
	}

}
