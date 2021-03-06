package com.wimb.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wimb.member.model.vo.Member;
import com.wimb.mypage.model.service.MyPageService;
import com.wimb.mypage.model.vo.MyOrders;


/**
 * Servlet implementation class MyPageController
 */
@WebServlet("/myPage.my")
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 세션객체 얻어오기
		HttpSession session = request.getSession();
		
		Member m = (Member)session.getAttribute("loginUser");
		
		ArrayList<MyOrders> list1 = new MyPageService().selectOrderList(m);
		MyOrders od1 = new MyPageService().orderStatus1(m);
		MyOrders od2 = new MyPageService().orderStatus2(m);
		MyOrders od3 = new MyPageService().orderStatus3(m);
		MyOrders od4 = new MyPageService().orderStatus4(m);
		MyOrders od5 = new MyPageService().orderStatus5(m);
		
		// 로그인 조건검사
		if(session.getAttribute("loginUser") == null) {
			
			// 로그인 전 : alert메세지로 로그인 요청
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
			
		} else {
			
			// 로그인 후 : myPage메인
			request.setAttribute("orderlist", list1);
			request.setAttribute("od1", od1);
			request.setAttribute("od2", od2);
			request.setAttribute("od3", od3);
			request.setAttribute("od4", od4);
			request.setAttribute("od5", od5);
			request.getRequestDispatcher("views/mypage/myPageMain.jsp").forward(request, response);
			
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
