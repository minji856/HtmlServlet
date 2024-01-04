<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조건문</title>
</head>
<body>
	<%
		String str1 = "aaa";
	
		if(str1.equals("aaa")){
	%>
		<b>aaa가 맞습니다.</b>
	<%
		}
	%>
	<hr>
	<c:set var="str2" value="aaa" />
	<c:if test="${str2 eq 'aaa'}">
		<b>aaa가 맞습니다.</b>
	</c:if>
	<hr>
	
	<form action="test02.jsp">
		숫자1 : <input type="text" name="num1"/><br><br>
		숫자2 : <input type="text" name="num2"/><br><br>
		<input type="submit" value="최대값 구하기" />
	</form>
	<br><br>
	<!-- null 값을 숫자로 바꾸는 능력은 없으니 예외처리 (한 페이지 내에서 처리해야해서) -->
	<%
		try{
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		if(num1 > num2){
	%>
			<%=num1%>이 크다.
			
	<%
		}
		else{
	%>
			<%=num2 %>가 크다.
	<%
			}
		}
	catch(Exception err){}
	%>
	<hr>
	<!-- else를 처리하려면 하나 더 써줘야한다. = 단일처리문이기때문 -->
	<c:if test="${param.num1 > param.num2}" >
		${param.num1}이 크다.
	</c:if>
	<c:if test="${param.num1 < param.num2}" >
		${param.num2}이 크다.
	</c:if>
	<hr> <!-- 다중조건 -->
	<c:choose>
		<c:when test="${param.num1 > param.num2}" >
			${param.num1}이 크다.
		</c:when>
		<c:when test="${param.num1 < param.num2}" >
			${param.num2}이 크다.
		</c:when>
		<c:otherwise>               
			<c:if test="${!empty param.num1}" />
				똑같다.
		</c:otherwise>
	</c:choose>
</body>
</html>