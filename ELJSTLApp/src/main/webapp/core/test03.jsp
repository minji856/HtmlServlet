<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jstl 반복문</title>
</head>
<body>
	<%
		String[] foods = {"불고기", "오므라이스", "짜장면"};
		request.setAttribute("foods", foods);
	%>
	
	<%
		String[] arrFoods = (String[])request.getAttribute("foods");
	
		for(int i=0; i<arrFoods.length; i++){
	%>
		 <%= arrFoods[i]%>
	<%
		} 
	%>
	<br>
	<!-- 카운트 값을 변수 var=i 로 받아오기 -->
	<c:forEach begin="0" end="3" step="1" var="i">
		${foods[i]}
	</c:forEach>
	<br>
	<c:forEach var="food" items="${requestScope.foods}">
		${food}
	</c:forEach>
	<hr>
	<!-- StringToknizer 합친거 -->
	<c:set var="guests" value="토끼/거북이*너구리-호랑이,기린" />
	<c:forTokens items="${guests}" delims="/*-," var="token">
		${token}
	</c:forTokens>
	
	<!-- 값을 가지고 url 옮길 수 도있다 -->
	<c:redirect url="test04.jsp">
		<c:param name="irum" value="신돌석"></c:param>
		<c:param name="age" value="40세"></c:param>
	</c:redirect>
</body>
</html>