package com.util;


import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登录验过滤器 
 * 限制未登录用户访问
 */
@WebFilter("/jsps/*")
public class LoginFilter implements Filter {
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		if (((HttpServletRequest)request).getSession().getAttribute("emp") != null) {
			chain.doFilter(request, response);
		} else { // 如果未登录则跳转到登录界面
			String path = request.getServletContext().getContextPath();
			((HttpServletResponse)response).sendRedirect(path + "/login.jsp");
		}
	}
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {}

	@Override
	public void destroy() {}
	
}
