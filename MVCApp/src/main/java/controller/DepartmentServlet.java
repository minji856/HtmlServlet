package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DepartmentBean;

public class DepartmentServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		String command = req.getParameter("command");
		String url = "";
		
		if(command.equals("DEPART")) {
			url = "/WEB-INF/views/department.html";
		}
		else {
			DepartmentBean bean = new DepartmentBean();
			String depart = req.getParameter("depart");
			ArrayList list = bean.getAdvice(depart);
			
			req.setAttribute("advice", list);
			url = "/WEB-INF/views/depart_proc.jsp";
		}
		
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
		
		/* 원칙적으로 처음에는 학과 페이지로 이동 */
		/*
		String depart = req.getParameter("depart");
		
		DepartmentBean bean = new DepartmentBean();
		ArrayList list = bean.getAdvice(depart);
		
		req.setAttribute("advice", list);
		
		RequestDispatcher view =
				req.getRequestDispatcher("views/depart_proc.jsp");
		view.forward(req, resp);*/
		
	}
}
