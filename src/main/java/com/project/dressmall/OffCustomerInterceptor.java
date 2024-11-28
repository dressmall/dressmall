package com.project.dressmall;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.project.dressmall.util.TeamColor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class OffCustomerInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		log.debug(TeamColor.JIN + request.getRequestURI().toString() + "요청 Interceptor" + TeamColor.RESET);
		
		HttpSession session = request.getSession();
		
		// 관리자 및 고객 로그인 정보를 가져옴
        Object loginStaff = session.getAttribute("loginStaff");
        Object loginCustomer = session.getAttribute("loginCustomer");

        // 관리자와 고객이 동시에 로그인된 경우
        if (loginStaff != null && loginCustomer != null) {
        	log.debug(TeamColor.JIN + "중복 로그인 감지 - 세션 초기화 수행" + TeamColor.RESET);
            
            // 세션 초기화
            session.invalidate();
            
            // 중복 로그인 처리 후 리다이렉트
            response.sendRedirect(request.getContextPath() + "/off/customer/main");
            return false;
        }
        
        // 로그인이 되어 있다면 
		if(session.getAttribute("loginCustomer") != null) {
			response.sendRedirect(request.getContextPath() + "/on/customer/main");
			return false;
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}
