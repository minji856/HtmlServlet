<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기술로 이동한 페이지</title>
</head>
<body>
	<h2>exam3.jsp</h2>
	<!-- exam2에서 요청한거여서 null request가 비어있음 -->
	당신의 이름은 <%= request.getParameter("name") %> 입니다.
	당신의 국적은 <%= request.getParameter("nation") %> 입니다.
</body>
</html>