<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Date today = (Date)request.getAttribute("currentDate");
	%>
	오늘은 <%=today %> 입니다.
	<br><br>
	<%-- currentDate = new Date(); 한번의 라운드 트립이후엔 사라지는 짧게 쓰는 변수 --%>
	<%
		request.removeAttribute("currentDate");
		today = (Date)request.getAttribute("currentDate");
	%>
	오늘은 <%=today %> 입니다.
	<br><br>
</body>
</html>