package persistance;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletCookie extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("euc-kr");
		
		
		if(req.getMethod().equals("POST")) {
			String name = req.getParameter("name");
			String addr = req.getParameter("addr");
			
			// 쿠키 객체 생성
			Cookie nameCook = new Cookie("name", name);
			Cookie addrCook = new Cookie("addr", addr);
			
			// 언제까지 쿠키를 저장 시킬건지 (초단위) 60초 60분 24시간 하루를 초로 계산한것 *30 하면 한달
			nameCook.setMaxAge(60 * 60 * 24);
			addrCook.setMaxAge(60 * 60 * 24);
			
			resp.addCookie(nameCook);
			resp.addCookie(addrCook);
			
			resp.getWriter().println("쿠키가 저장되었습니다.");
		}
		else {
			Cookie[] cooks = req.getCookies();
			for(Cookie c : cooks) {
				// out 객체 안만들어놨음. out.println
				resp.getWriter().println(c.getName() + ", "
						+ c.getValue());
			}
		}
	}
}
