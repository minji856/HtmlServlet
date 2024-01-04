<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.example.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bean 연습</title>
</head>
<body>
	<jsp:useBean id="simple1" class="com.example.MessageBean" />
	<jsp:setProperty property="msg" name="simple1"
		value="간단한 빈 예제입니다."/>
	
	메시지 : <jsp:getProperty property="msg" name="simple1"/>
	<hr/>
	<%--패키지가 없을 때 자바코드가 남발이 된다. --%>
	<%
		MessageBean simple2 = new MessageBean();
		simple1.setMsg("이것은 스크립트릿으로 작성된 구문입니다.");
		simple2.setMsg("스크립트릿으로 생성된 객체입니다.");
	%>
	메시지 : <%= simple1.getMsg() %><br>
	메시지 : <%= simple2.getMsg() %><br>	
</body>
</html>


<!-- 
	Bean ClassName : com.example.MessageBean
	
	Property Spec.
	------------------
	name		r/w		 DataType(DT)		explain
	--------------------------------------------------
	message		r/w		  String			메시지를 저장하고 가져오는 기능
 -->