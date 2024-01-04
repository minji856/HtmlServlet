import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletTest1 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//System.out.println("서블릿 테스트...");
//		String name = req.getParameter("name");
//		String age = req.getParameter("age");
		
//		System.out.println("get:" + name + ", " + age);
//		PrintWriter out = resp.getWriter();
//		out.println("<html><body>");
//		out.println("<ul>");		
//		out.println("<li>이름 : " + name + "</li>");		
//		out.println("<li>나이 : " + age + "</li>");
//		out.println("</ul>");	
//		out.println("</body></html>");
//		out.close();
		
		/* get방식으로 했을때 똑같은 코드를 만드는게 아니고 한쪽으로 몰아줄 수 있게(호출할 수 있게)*/
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("euc-kr");
		
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		
		//System.out.println("post" + name + ", " + age);
		// request한테 물어보면 post야 get이야? ip도 알아낼 수 있고 모든 헤더정보 꺼내온다
		System.out.println(req.getMethod() + ":" + name + ", " + age);
		/* 사용자에게 보여지는 부분 */
		PrintWriter out = resp.getWriter();
		out.println("<html><body>");
		out.println("<ul>");		
		out.println("<li>이름 : " + name + "</li>");		
		out.println("<li>나이 : " + age + "</li>");
		out.println("</ul>");	
		out.println("</body></html>");
		out.close();
	}

}
