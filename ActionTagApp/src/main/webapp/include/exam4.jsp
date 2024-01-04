<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>exam4.jsp</h2>
	exam5에게 파라미터 전달<br>
	<!-- 값이라도 들고갈 수 있게 -->
	<jsp:include page="exam5.jsp">
		<jsp:param value="scott" name="id"/>
		<jsp:param value="tiger" name="pw"/>
	</jsp:include>
</body>
</html>