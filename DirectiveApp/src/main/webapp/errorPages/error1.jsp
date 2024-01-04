<%@ page contentType="text/html; charset=UTF-8"
	isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>에러가 났네?</h2>
	원인 : <%= exception.getMessage()  %>
</body>
</html>