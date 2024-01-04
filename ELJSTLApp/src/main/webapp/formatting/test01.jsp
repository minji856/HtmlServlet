<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fmt 기본 문법들</title>
</head>
<body>
	<fmt:formatNumber value="10000000"/><br>
	<!-- 기본형 true, 단위 나누는것을 다시 풀음 -->
	<fmt:formatNumber value="10000000" groupingUsed="false"/><br>
	<fmt:formatNumber value="3.141598" pattern="#.###"/><br>
	<fmt:formatNumber value="0.5" type="percent"/><br>
	<fmt:formatNumber value="25000000000" type="currency"/><br> <!-- 자동원화 -->
	<fmt:formatNumber value="25000000000" type="currency"
		currencySymbol="$"/><br>
	<hr>
	<%
		Date date = new Date();
	%>	
	<c:set var="today" value="<%=new Date()%>"/>
	
	<fmt:formatDate value="${today}" type="date"/><br> <!-- 기본값 -->
	<fmt:formatDate value="${today}" type="time"/><br>
	<fmt:formatDate value="${today}" type="both"/><br>
	<br>
	<fmt:formatDate value="${today}" dateStyle="short"/><br>
	<fmt:formatDate value="${today}" dateStyle="medium"/><br>
	<fmt:formatDate value="${today}" dateStyle="Long"/><br>
	<fmt:formatDate value="${today}" dateStyle="full"/><br>
	<br>
	<fmt:formatDate value="${today}" type="time" timeStyle="short"/><br>
	<fmt:formatDate value="${today}" type="time" timeStyle="medium"/><br>
	<fmt:formatDate value="${today}" type="time" timeStyle="Long"/><br>
	<fmt:formatDate value="${today}" type="time" timeStyle="full"/><br>
	<br>
	<!-- type은 생략하면 기본값이 date -->
	<fmt:formatDate value="${today}" pattern="yyyy/MM/dd(E)"/><br>
	
	<hr>
	
	<!-- 내가 원하는 국가 형태.국가 코드 -->
	<fmt:setLocale value="en_us"/>
	<fmt:formatNumber value="25000000000" type="currency"/><br>
	<fmt:formatDate value="${today}" type="both" dateStyle="full"
		timeStyle="full" /><br>
	<!-- 실제로 미국에 있는 시간이 나타내는게 아니다 -->
	
	<hr>
	
	<!-- 해당 국가 표준시간 -->
	<fmt:setLocale value="ko_kr" />
	서울 : <fmt:formatDate value="${today}" type="both" /><br>
	<br>
	<!-- 태그 안에다가 사용해주면 홍콩 시간만 쓰고 밖엔 다시 한국시간 -->
	<fmt:timeZone value="Asia/Hong_Kong">
	홍콩 : <fmt:formatDate value="${today}" type="both" /><br>
	</fmt:timeZone>
	<br>
	<fmt:timeZone value="Euroup/London">
	런던 : <fmt:formatDate value="${today}" type="both" /><br>
	</fmt:timeZone>
	<br>
	<fmt:timeZone value="America/New_York">
	뉴욕 : <fmt:formatDate value="${today}" type="both" /><br>
	</fmt:timeZone>
	<br>
	
</body>
</html>