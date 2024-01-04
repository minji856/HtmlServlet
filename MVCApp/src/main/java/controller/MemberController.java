package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CompleteCommand;
import model.ConfirmCommand;
import model.FactoryBean;
import model.ICommand;
import model.MainCommand;
import model.RegisterCommand;

@WebServlet("/mem")
public class MemberController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		String command = req.getParameter("command");
		String url="";
		
		ICommand cmd = null;
		
		if(command.equals("REGISTER")) {
			cmd = new RegisterCommand();
		}
		else if(command.equals("CONFIRM")) {
			/* 1차 url = "views/member/registerConfirm.jsp"; 
			/* 2차 url = (String)new ConfirmCommand().processCommand(req, resp); 
			cmd = new ConfirmCommand();
		}
		else if(command.equals("COMPLETE")) {
			cmd = new CompleteCommand();
		}
		/* 혹시 모르니까 main 도 bean 으로 
		else if(command.equals("MAIN")) {
			cmd = new MainCommand();
		}
		else {
			// 잘못된 접근에 대한 처리
		}
		
		url = (String)cmd.processCommand(req, resp);
		RequestDispatcher view =
				req.getRequestDispatcher(url);
		view.forward(req, resp);
		*/
		
		String command = req.getParameter("command");
		String url="";
		ICommand cmd = null;
		
		// 이미 만들어져있는 공장의 위치를 참조
		FactoryBean factory = FactoryBean.newInstance();
		// 인터페이스가 하나의 객체니까. 팩토리를 쓰면 코드가 간단해진다
		cmd = factory.createInstance(command);
		url = (String)cmd.processCommand(req, resp);
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}
}
