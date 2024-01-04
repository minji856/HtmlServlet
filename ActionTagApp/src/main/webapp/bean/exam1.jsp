<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bean</title>
</head>
<body>
	<h2>간단한 Bean예제</h2>
	<%--bean에 만들어놨으니까 주석처리 
	<%Calendar cal = Calendar.getInstance();%> --%>
		
		<!-- id = cal.getInstance() 랑 같은 -->
	<jsp:useBean id="cal" class="com.example.CalendarBean" />
		<!-- getYear에서 이름만 가져오는데 이때 소문자로 가져와서 쓴다 -->
	<h3>오늘은 <jsp:getProperty property="year" name="cal"/>년 &nbsp;
 		<jsp:getProperty property="month" name="cal"/>월 &nbsp;
 		<jsp:getProperty property="date" name="cal"/>입니다.</h3>
</body>
</html>