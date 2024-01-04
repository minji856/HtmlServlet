<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 따로 컴파일 된다 --%>
	<jsp:include page="inc/header.jsp"></jsp:include>
	<%
		int i = 20;
	%>
	<%= i %>
	<h1>Welcome To My world</h1>
	...
	
	<%@ include file="inc/footer.jsp" %>
	
	<%
		// int j = 20;
	%>
	<%= j %>
</body>
</html>