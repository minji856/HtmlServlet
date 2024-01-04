<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward</title>
</head>
<body>
	<h2>exam1.jsp</h2>
	<!-- home이라고 적으면 exam3로 이동함 -->
	<form method="get" action="exam2.jsp">
		<input type="text" name="name"/><br><br>
		<input type="text" name="page"/><br><br>
		<input type="submit" value="전송"/><br><br>
	</form>
</body>
</html>