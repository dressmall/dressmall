package com.project.dressmall;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
public class DressmallApplication implements WebMvcConfigurer{
	@Autowired private OnStaffInterceptor onStaffInterceptor;
	@Autowired private OnCustomerInterceptor onCustomerInterceptor;
	@Autowired private OffStaffInterceptor offStaffInterceptor;
	@Autowired private OffCustomerInterceptor offCustomerInterceptor;
	
	public static void main(String[] args) {
		SpringApplication.run(DressmallApplication.class, args);
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// /on/* 으로 시작하는 컨터롤러를 가로챔.
		registry.addInterceptor(onStaffInterceptor).addPathPatterns("/on/staff/**");
		registry.addInterceptor(onCustomerInterceptor).addPathPatterns("/on/customer/**");
		registry.addInterceptor(offStaffInterceptor).addPathPatterns("/off/staff/**");
		registry.addInterceptor(offCustomerInterceptor).addPathPatterns("/off/customer/**");
		WebMvcConfigurer.super.addInterceptors(registry);
	}

}
