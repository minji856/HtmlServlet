package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BookDto;

public class BookController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/* bookshop 으로 이동할건지 cart 로 이동할건지 url 변수 생성 */
		String url = "";
		req.setCharacterEncoding("utf-8");
		// url = "views/bookshop.jsp";	장바구니에 연결해서 같이 나오니까 else문 삭제
		
		/*
		if(req.getMethod().equalsIgnoreCase("get")) {
			url = "views/bookshop.jsp";
		}
		else {
			url = "views/cart.jsp";
		}
		*/
		String cmd = req.getParameter("command");
		HttpSession session = req.getSession();
		/* 여러개를 저장할 컬렉션 생성. 저장된 세션에 저장해주기*/
		ArrayList bookList = 
				(ArrayList)session.getAttribute("bookList");
		
		if(cmd.equals("BOOKSHOP")) {
			url = "/WEB-INF/views/bookshop.jsp";
		}
		
		if(cmd.equals("CART")) {
			url = "/WEB-INF/views/bookshop.jsp";
			
			/*처음에 하나는 만들어줘야함*/
			if(bookList == null) {
				bookList = new ArrayList();
			}
			
			/* 주문 했을 때 나오는 값들이니까 처음에 cart로 이동하면 null 값이 나옴 */
			String book = req.getParameter("book");
			String quantity = req.getParameter("quantity");
			
			StringTokenizer token = new StringTokenizer(book, "/");
			String title = token.nextToken().trim();
			String author= token.nextToken().trim();
			String price = token.nextToken().trim();
			
			BookDto dto = new BookDto();
			dto.setAuthor(author);
			dto.setPrice(Integer.parseInt(price));
			dto.setQuantity(Integer.parseInt(quantity));
			dto.setTitle(title);
			
			/* 여러권 주문한 것들을 누적해서 담을 수 있게 */
			bookList.add(dto);
			// session.setAttribute("dto", dto); 한권의 책만 저장할 때
			session.setAttribute("bookList", bookList);
		}
		else if (cmd.equals("CHECKOUT")) {
			url = "/WEB-INF/views/checkout.jsp";
			
			int sum = 0;
			for(int i=0; i<bookList.size(); i++) {
				BookDto book = (BookDto)bookList.get(i);
				sum += book.getPrice() * book.getQuantity();
			}
			
			session.setAttribute("amount", sum);
		}
		else if (cmd.equals("DEL")) {
			url = "/WEB-INF/views/bookshop.jsp";
			int idx = Integer.parseInt(req.getParameter("cnt"));
			
			bookList.remove(idx);
		}
		
		RequestDispatcher view =
				req.getRequestDispatcher(url);
		view.forward(req, resp);
	}
}
