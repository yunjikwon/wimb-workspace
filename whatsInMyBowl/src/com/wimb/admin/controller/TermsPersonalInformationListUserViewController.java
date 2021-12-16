package com.wimb.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.admin.model.service.termsService;
import com.wimb.admin.model.vo.Terms;

/**
 * Servlet implementation class TermsListUserViewController
 */
@WebServlet("/listPeronalInformationUserView.terms")
public class TermsPersonalInformationListUserViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TermsPersonalInformationListUserViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 개인정보처리방침 리스트를 불러오는 Controller
		ArrayList<Terms> list = new termsService().selectPersonalInformationTermsList();
		
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/admin/termsPersonalInformationUserView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}