package com.chaerin.boot4.inteceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.chaerin.boot4.member.MemberVO;
import com.chaerin.boot4.member.RoleVO;

@Component // 일반객체니깐 component
public class SellerInterceptor implements HandlerInterceptor {

	@Value("${member.role.seller}")
	private String roleName;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		boolean check = false;

		// 로그인 한 사용자의 ROLE이 ROLE_SELLER라면 통과 아니면 거절
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		if (memberVO != null) {
			for (RoleVO roleVO : memberVO.getRoleVOs()) {
				if (roleVO.getRoleName().equals(roleName)) { // ROLE_SELLER이름 가져옴
					check = true;
				}
			}
		}
		// check가 true면 통과
		// check가 false면 거절 : servlet코드사용
		if (!check) { // check가 false라면 라는 의미
			// redirect:response.sendRedirect("url주소")
			// forward

			// mv.addObject("키",value)
			request.setAttribute("msg", "권한이 없습니다.");
			request.setAttribute("path", "../");

			// mv.setViewName();
			// WEB-INF/views 경로와 .jsp 까지 직접작성
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/getResult.jsp");
			view.forward(request, response); // 실제 보내는것 // -> check가 false 면 얘네들을 하자

		}
		return check;

	}
}
