import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletTest2 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("euc-kr");
		
		PrintWriter out = resp.getWriter();
		out.println("<html><body>");
		
//		System.out.println("test...");
		/* 배열로 받아줘야한다. String[] */
		/*
		String[] singers = req.getParameterValues("singer");
		System.out.println("singers:" + singers.length); // 서버에서확인
		
		out.println("<h3>당신이 입력한 가수이름입니다.</h3>");
		out.println("<ul>");
		// 배열 반복문
		for(String singer : singers) {
			out.println("<li>" + singer + "<li>");
		}
		out.println("</ul>");
		
		/* 백엔드단에서 선택 안했을 때 해주는 예외처리 *
		try {
			String[] foods = req.getParameterValues("food");
			System.out.println("foods:" + foods.length);
			
			out.println("<h3>당신이 입력한 음식이름입니다.</h3>");
			out.println("<ul>");
			for(String food : foods) {
				out.println("<li>" + food + "<li>");
			}
			out.println("</ul>");
		}
		catch(NullPointerException err) {
			out.println("음식을 선택하지 않았습니다.");
		}
		
		try {
			String[] cities = req.getParameterValues("city");
			System.out.println("cities:" + cities.length);
			
			out.println("<h3>당신이 좋아하는 도시입니다.</h3>");
			out.println("<ul>");
			for(String city : cities) {
				out.println("<li>" + city + "<li>");
			}
			out.println("</ul>");
		}
		catch(NullPointerException err){
			out.println("도시를 선택하지 않았습니다.");
		}
		*/
		
		Enumeration<String> enumer = req.getParameterNames();
		// 더 이상 꺼낼께 없을 떄까지 반복 돌리는 hasMore
		while(enumer.hasMoreElements()) {
//			System.out.println(enumer.nextElement()); 
			String name = enumer.nextElement();
			if(name != null) {
				String[] values = req.getParameterValues(name);
				out.println("<h3>당신이 선택한 " + name + " 입니다.</h3>");
				out.println("<ul>");
				for(String val : values) {
					out.println("<li>" + val + "<li>");
				}
				out.println("</ul>");
			}
		}
		
		
		out.println("</body></html>");
		out.close();
//		System.out.println(singers);   => [Ljava.lang.String;@4f4b0b17
		
	}

}
