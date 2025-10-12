package kr.ac.kopo.recipe.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.ac.kopo.recipe.model.Member;


public class UserIntercepter extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		
		Member member = (Member)session.getAttribute("member");
		
		if(member != null)
			return true;
		
		response.sendRedirect(request.getContextPath() + "/login");
		
		return false;
	}
	
}
