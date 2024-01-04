<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(request.getMethod().equalsIgnoreCase("get")){
%>

			<%-- 자기가 자기한테 요청을 보내는 --%>
	<form action="requestExam2.jsp" method="post">
		이름 : <input type="text" name="name"/><br><br>
		주소 : <input type="text" name="addr"/><br><br>
		취미 : <br>
			<input type="checkbox" name="hobby" value="등산">등산<br>
			<input type="checkbox" name="hobby" value="독서">독서<br>
			<input type="checkbox" name="hobby" value="여행">여행<br>
			<input type="checkbox" name="hobby" value="낚시">낚시<br>
	<input type="submit" value="전송"/>
</form>
<%
	}
	// post 방식일때
	else{
%>
	<%	
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String[] hobbies = request.getParameterValues("hobby");
	%>
	<!-- out.println(name); -->
	<ul>
		<li>이름 : <%=name %></li>
		<li>주소 : <%=addr %></li>
	<%
	if(hobbies != null){
		for(String hobby : hobbies){
	%>		
		<li><%=hobby%></li>
	<%	
		}
	}
}
	%>
</body>
</html>