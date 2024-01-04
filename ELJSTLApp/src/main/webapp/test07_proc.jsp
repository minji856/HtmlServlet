<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	두 수의 덧셈 : <br> 
	${param.num1} + ${param.num2} = ${param.num1 + param.num2}
	<!-- 숫자형으로 바꾸고 퍼센트 태그 번갈아가면서 써야하는데 간단하게 자동으로 변환이된다 -->
	<hr>
	두 수는 모두 양수인가? <br>
	<!-- gt == > -->
	${(param.num1 gt 0) and (param.num2 gt 0)}<br>
	<hr>
	두 숫자가 모두 같은 숫자인가?(예/아니오로 대답)<br>
	<!-- 조건문을 간한하게 할 수 있는게 삼항 연산자 -->
	${(param.num1 == param.num2)? "예" : "아니오"}<br>
	<hr>
	안녕하세요. ${empty param.id? "guest" : param.id} 님! 환영합니다.
</body>
</html>