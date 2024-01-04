<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setAttribute("cnt1", 100);
	int cnt2 = (Integer)request.getAttribute("cnt1");
%>

<%= cnt2 %><br>
<% out.println(cnt2); %><br>
${cnt1}, ${requestScope.cnt1} <!-- 원래 이렇게 써야하는데 생략된거 -->
${sessionScope.cnt1}<br> <!-- null 값 에러가 나지 않는다 -->

<%= session.getAttribute("cnt1") %><br> <!-- 이미 request에서 꺼내 갔기 때문에 안나온다 -->

${requestScope["cnt1"]}
${cnt2}
</body>
</html>