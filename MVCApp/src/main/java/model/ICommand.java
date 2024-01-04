package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* 공통적으로 사용할 기능들을 여기에 정의 */
public interface ICommand {
	/* string 으로 해도 되는데 보편적으로 처리될 수 있도록 object.
	 *  페이지 이동을 위한 */
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException;
}
