<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test08_proc.jsp</title>
</head>
<body>
	<!-- request 를 통해서 정보를 받을 수 있다 -->
	<h2> <%= request.getParameter("name") %>님 환영합니다.</h2> <!--옛날방법. jsp니까 가능-->
	<h2> ${param.name}님 환영합니다.</h2>
	
	총 방문자 수 : <%= request.getAttribute("visitCount") %> 명 <br>
	<!-- requestScope 생략하면 page 부터 찾기 시작하지만 가급적 생략 지양 -->
	총 방문자 수 : ${requestScope.visitCount} 명 <br>
	<hr>
	<h2>${param.name}님이 좋아하는 음식</h2>
	<%
		String[] foods = (String[])request.getAttribute("foods");
	%>
	
	<%= foods[0] %>, <%= foods[1] %>, <%= foods[2] %>, <%= foods[3] %>
	<br><br>
	${foods}, ${requestScope.foods[0]}, ${foods[1]}, ${foods[2]}, ${foods[3]}
	<!-- 에러 -->
	${requestScope.movies[0]}, {requestScope.movies[1]}, {requestScope.movies[2]}, {requestScope.movies[3]}
	
	<hr>
	뽀삐의 주인 이름 : ${param.hong} <br>
	홍길동의 강아지 이름 : <br>
</body>
</html>