<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	String pw = (String)session.getAttribute("pw");
%>
	<h2>로그인에 성공하였습니다.</h2>
	<%=id %>님 안녕하세요
	<ul>
		<li>로그아웃</li>
		<li>메인페이지</li>
	</ul>
</body>
</html>