<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>contextExam2.jsp</h1>
	<h2>session값 확인</h2>
	<%= session.getAttribute("i") %>
	<!-- 변수가 아닌 아이디를 저장시켜서 활용 -->
	
	<h2>application값 확인</h2>
	<%= application.getAttribute("i") %>
	
	<!-- 확인이 되지 않음 / null 값 -->
	<h2>pageContext값 확인</h2>
	<%= pageContext.getAttribute("i") %>
	
</body>
</html>