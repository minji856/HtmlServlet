<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		ArrayList advice = (ArrayList)request.getAttribute("advice");
			for(int i=0; i<advice.size(); i++){
	%>
		<div style="color:blue"><%=advice.get(i) %></div>
	<%
		}
	%>
	
	<c:forEach var="adviceItem" items="${advice}">
    	<div style="color: blue">${adviceItem}</div>
	</c:forEach>
	
	<!-- 
	<c:set var="depart" value="${param.depart}" />
	선택한 학과 : ${depart}<br>
	<!-- 자바에서 할것을 jsp에게 시키는게 무리다 
	<c:choose>
		<c:when test="${depart eq 'kor'}">
			1. 국어를 잘해야 한다.<br>
			2. 국어를 사랑해야 한다.
		</c:when>
		<c:when test="${depart eq 'eng'}">
			1. 영어를 잘해야 한다.<br>
			2. 영어를 사랑해야 한다.
		</c:when>
		<c:when test="${depart eq 'com'}">
			1. 컴퓨터를 잘해야 한다.<br>
			2. 컴퓨터를 사랑해야 한다.
		</c:when>
		<c:when test="${depart eq 'bus'}">
			1. 경영을 잘해야 한다.<br>
			2. 경영을 사랑해야 한다.
		</c:when>
	</c:choose> -->
</body>
</html>