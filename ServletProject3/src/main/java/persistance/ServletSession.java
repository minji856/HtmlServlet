package persistance;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ServletSession extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("euc-kr");
		
		String name = req.getParameter("name");
		/* 이미 세션이 만들어져있기 때문에 객체 생성 말고 주소를 가져온다 */
		HttpSession session = req.getSession();
		/* 세션에 계속 기억할 수 있도록 이름을 저장 */
		session.setAttribute("name", name);
		
		PrintWriter out = resp.getWriter();
		out.println("<html><body>");
		// 세션에서 값을 getAttribute로 꺼내와야함. name만 쓰면 안됨.
		out.println("당신의 이름은 " + session.getAttribute("name")
				+ "이다.<br><br>");		
		out.println("접속시간 : " + new Date(session.getCreationTime())
				+ "<br><br>");
		// 이미 서버에서 정한 고유 getId
		out.println("ID : " + session.getId() + "<br><br>");
		out.println("만료시간 : " + session.getMaxInactiveInterval() + "<br><br>");
		
		if(session.isNew())
			out.println("처음 접속하였습니다.");
		else
			out.println("최근에 접속하였습니다.");
		out.println("</body></html>");
		out.close();
	}
}
