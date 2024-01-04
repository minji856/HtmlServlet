<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String addr = "서울시 강남구"; // 선언부에 선언하지 않는 이상 지역변수.
		pageContext.setAttribute("addr", "서울시 종로구",
				pageContext.SESSION_SCOPE);	// session.setattribute 랑 똑같은거다
	%>
	<%--같은 페이지에선 당연히 꺼내 쓸 수 있다. 세션에 저장해서 null 이 나옴 --%>
	주소 : <%= pageContext.getAttribute("addr") %>
</body>
</html>