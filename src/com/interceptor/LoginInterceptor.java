package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		// 在拦截点执行前拦截，如果返回true则不执行拦截点后的操作（拦截成功）
				// 返回false则不执行拦截
				HttpSession session = request.getSession();
				//String uri = request.getRequestURI(); // 获取登录的uri，这个是不进行拦截的
				//if(session.getAttribute("LOGIN_USER")!=null || uri.indexOf("system/login")!=-1) {// 说明登录成功 或者 执行登录功能			
				if(session.getAttribute("LOGIN_USER")!=null) {
					// 登录成功不拦截
					System.out.println("登陆成功不拦截");
					return true;
				}else {
					// 拦截后进入登录页面
					System.out.println("登陆不成功拦截");
					response.sendRedirect("/order_online/manager_login.jsp");
					return false;
				}

	}

}
