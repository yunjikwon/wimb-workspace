package com.wimb.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.wimb.member.model.service.MemberService;
import com.wimb.member.model.vo.Member;

/**
 * Servlet implementation class AjaxSearchIdController
 */
@WebServlet("/idSearch.me")
public class AjaxSearchIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSearchIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userEmail = request.getParameter("userEmail");
		String userPhone = request.getParameter("userPhone");
		String userName = request.getParameter("userName");
		String userId = null;
		
		
		//System.out.println(userEmail);
		//System.out.println(userPhone);
		//System.out.println(userName);

		if(userPhone == null) {
			 
			userId = new MemberService().searchIdEmail(userEmail, userName);
			//System.out.println(userId);
			
			if(!userId.equals("")) {
				
				new Gson().toJson(userId, response.getWriter());
			}else {
				
				response.getWriter().print("NNNNN");
			}
			
			
		}
		
		if(userEmail == null){
			
			userId = new MemberService().searchIdPhone(userPhone, userName);
			//System.out.println(userId);
			
			if(!userId.equals("")) {
				
				new Gson().toJson(userId, response.getWriter());
			}else {
				
				response.getWriter().print("NNNNN");
			}
			
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
