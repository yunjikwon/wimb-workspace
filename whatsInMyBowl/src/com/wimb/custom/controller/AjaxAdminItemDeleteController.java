package com.wimb.custom.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.wimb.custom.model.service.CustomService;

/**
 * Servlet implementation class AjaxAdminItemDeleteController
 */
@WebServlet("/aitemdelete.cu")
public class AjaxAdminItemDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminItemDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		int count =  Integer.parseInt( request.getParameter("count"));
		String[] arr = request.getParameterValues("checkArr");
		
		System.out.println(count);
		System.out.println(arr[0]);
		
		int result = 0;
		if(arr != null && count > 0) {
			for(int i=0; i<count; i++) {
				String ciCode = arr[i];
				result = new CustomService().deleteItem(ciCode);
			}
		}
		
		if(result > 0) {
			//response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(result);
		}else {
			request.setAttribute("errorMsg", "재료 삭제 실패");
			request.getRequestDispatcher("views/common/adminerrorPage.jsp").forward(request, response);
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
