<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>contextExam1.jsp</h2>
	<h2>session에 확인</h2>
	<%
		session.setAttribute("i",10);
	%>
	
	<%-- 영역이 다르기 때문에 변수이름이 달라도 충볼이 일어나지 않는다. --%>
	<h2>application에 값 확인</h2>
	<%
		application.setAttribute("i", 100);
	%>
	
	<h2>pageContext에 값 확인</h2>
	<%
		pageContext.setAttribute("i", 200);
	%>
			<%-- null 이 나온다. 지역변수 --%>
</body>
</html>