package com.delta.practice.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delta.practice.entity.Users;

/**
 * @author Li Benhe Email: libenhe919@gmail.com
 * @version 2016-3-8 下午6:50:58
 */
public class UsersServlet extends BaseServlet {
	/**
	 * Constructor of the object.
	 */
	public UsersServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int handler = Integer.parseInt(request.getParameter("handle"));

		switch (handler) {
			case 1:
				String loginusername = request.getParameter("loginusername");
				String loginpassword = request.getParameter("loginpassword");

				try {
					boolean flag = usersService.selectByNamePassword(loginusername, loginpassword);
					if (flag) {
						Users user = usersService.selectByName(loginusername);
						request.getSession().setAttribute("loginusername", user);
						response.sendRedirect(request.getContextPath()+"/index.jsp");
					} else {
						response.sendRedirect(request.getContextPath()+"/login_failure.jsp");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			case 2:
				String piccode = (String) request.getSession().getAttribute("piccode");
				String checkcode = request.getParameter("checkcode");
				checkcode = checkcode.toUpperCase();

				if(checkcode.equals(piccode)){
					response.sendRedirect(request.getContextPath()+"/sigin_success.jsp");
				}
				break;
			case 7:
				request.getSession().removeAttribute("loginusername");
				response.sendRedirect(request.getContextPath()+"/index.jsp");
				break;
		}

	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
}
