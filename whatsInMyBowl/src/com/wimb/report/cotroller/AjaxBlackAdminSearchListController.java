package com.wimb.report.cotroller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.wimb.member.model.vo.Member;
import com.wimb.report.model.service.ReportService;

/**
 * Servlet implementation class AjaxBlackAdminSearchListController
 */
@WebServlet("/search.black")
public class AjaxBlackAdminSearchListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxBlackAdminSearchListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String searchKeyword = request.getParameter("searchKeyword");
		
		ArrayList<Member> searchList = new ReportService().selectAdminSearchBlackList(searchKeyword);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(searchList, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
