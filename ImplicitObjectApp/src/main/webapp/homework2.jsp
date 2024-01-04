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
	<form action="homework2.jsp" method="post">
		다음에서 구입하고자 하는 상품을 선택해 주세요<br>
		<input type="checkbox" name="food" value="500">사과<br>
		<input type="checkbox" name="food" value="24000">쌀<br>
		<input type="checkbox" name="food" value="1500">우유<br>
		<input type="checkbox" name="food" value="3700">김치<br>
		<input type="checkbox" name="food" value="2000">햄<br>
		<input type="submit" value="전송"/>
	</form>
<%
	}
	else {
		String[] foods = request.getParameterValues("food");

	    int total = 0;
	    if (foods != null) {
	        for (String foodPrice : foods) {
	            total += Integer.parseInt(foodPrice);
	        }
	    }
	%>
	당신이 주문한 상품의 합계입니다.<br>
	합계 : <%= total %>원
	<%
	}
	%>
</body>
</html>
<!-- 
	당신이 주문한 상품의 합계입니다.
	합계:
 -->