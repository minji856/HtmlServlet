<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward2</title>
</head>
<body>
	<h2>exam2.jsp</h2>
	이 페이지는 조건을 만족할 경우 exam3.jsp로 이동합니다.<br>
	만약 이 조건을 만족하지 않는다면 이동을 하지 않습니다.
	<%
		String name = request.getParameter("name");
		String pageUrl = request.getParameter("page");
		if(name.equals("hong")){
	%>
		<!-- <script> 자바스크립트로 페이지 이동
			location.href="exam3.jsp"
		</script> -->
		
		<%-- <jsp:forward page="exam3.jsp"></jsp:forward> --%>
		
		<!-- 도구를 많이 알기전까지 안 쓸 수 없다 -->
		<jsp:forward page="<%=pageUrl %>">
			<jsp:param value="Korean" name="nation"/>
		</jsp:forward>
	
	<% 
		}
	%>
</body>
</html>