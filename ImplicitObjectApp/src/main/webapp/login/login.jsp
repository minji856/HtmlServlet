<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	<%
	String testId = "guest";
	String testpw = "1111";
	
	String enteredId = request.getParameter("id");
	String enteredpw = request.getParameter("pw");
	session.setAttribute("id", enteredId);
	session.setAttribute("pw", enteredpw);

	%>
	
	<form action="login_success.jsp" method="post">
	    아이디:<input type="text" name="id"><br/>
	    비밀번호:<input type="password" name="pw"><br/>
	    <input type="submit" value="로그인"><br/>
	</form>
	
	<%
	// 아이디와 비밀번호 일치 여부 확인
	boolean logIn = testId.equals(enteredId) && testpw.equals(enteredpw);
	if (logIn) {
	%>
	    <p>로그인 성공!</p>
	<%
	} else {
	%>
	    <p>아이디 또는 비밀번호가 잘못되었습니다.</p><br>
	    
	<%
	}
	%>
	<!-- response.sendRedirect("login.jsp") -->
</body>
</html>