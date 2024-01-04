<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application.jsp</title>
</head>
<body>
	<h2>전체 방문자 카운터</h2>
	<jsp:useBean id="cnt" class="com.example.ApplicationBean"
		scope="application"/>
	
	<!-- 새로고침하면 올라가는거 막는 -->	
	<% if(session.isNew()) { %>	
	<!-- value에 아무 숫자라도 넣어줘야한다 형식을 맞춰줘야하니까 -->
	<jsp:setProperty property="counter" name="cnt" value="1"/>
	<%
	}
	%>
	<!-- 메모리에 저장하면 서버가 꺼지면 날라가 버린다 그래서 파일처리 해줘야한다 -->
	방문자 수 :  <jsp:getProperty property="counter" name="cnt"/> 명
	<br><br>
	<form action="applicationExam.jsp" method="post">
		<input type="submit" name="check" value="새로 고침"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" name="restart" value="카운터 리셋"/>
	</form>
</body>
</html>