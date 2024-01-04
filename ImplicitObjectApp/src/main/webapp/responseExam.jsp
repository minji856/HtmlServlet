<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 강제적으로 페이지를 이동 시키는 것. h2가 보이기도 전에 네이버로 이동하게됨 --%>
	<h2>1. 다른 페이지로 이동</h2>
	<% response.sendRedirect("https://www.naver.com"); %>
</body>
</html>