package kr.ac.kopo.recipe.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import kr.ac.kopo.recipe.model.Member;


public class AdminIntercepter extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handeler) throws Exception {
		
		HttpSession session = request.getSession();
		
		Member member = (Member) session.getAttribute("member");
		
		if(member != null && member.getUserid().equals("admin"))
			return true;
		
		response.sendRedirect("/");
		
		return false;
	}
	
}
