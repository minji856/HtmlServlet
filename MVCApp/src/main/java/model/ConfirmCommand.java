package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ConfirmCommand implements ICommand {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 입력값 전달 받기
		// 아이디 중복 여부, 패스워드 일치 여부(DB 연동)

		// bean 생성
		MemberDto dto = new MemberDto();
		dto.setEmail(req.getParameter("email"));
		dto.setId(req.getParameter("id"));
		dto.setPw(req.getParameter("pw"));
		
		// 데이터를 session에 저장해서 전달할 필요가 없다
		// 페이지 이동할때마다 데이터를 들고 다닐 필요 X
		HttpSession session = req.getSession();
		session.setAttribute("member", dto);
		
		return "/WEB-INF/views/member/registerConfirm.jsp";
	}

}
