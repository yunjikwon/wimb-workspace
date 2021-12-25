package com.wimb.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wimb.member.model.service.MemberService;

/**
 * Servlet implementation class ChangePwdController
 */
@WebServlet("/changePwd.me")
public class ChangePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userIdforPwd");
		String userPwd = request.getParameter("userPwd");
		
		int result = new MemberService().changePwd(userId, userPwd);
		
		HttpSession session = request.getSession();
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "성공적으로 비밀번호 변경이 완료되었습니다.");
			request.getRequestDispatcher("/views/member/memberLoginForm.jsp").forward(request, response);
		}else {
			
			session.setAttribute("alertMsg", "비밀번호 변경에 실패했습니다. 다시입력해주세요");
			
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
