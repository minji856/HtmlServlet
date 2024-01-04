<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request Scope</title>
</head>
<body>
	<%-- 실행중에 머릿말에 들어갈 내용 입력하면 머릿말에 나오는. 계속 수정할 수 있는 대시보드 형식 --%>
	<%-- 이게 한 페이지가 아니기 때문에 scope 를 페이지로 하면 사라져 버려서 데이터 전달이 안된다. --%>
	<%-- 그래서 데이터를 bean 에다가 저장을 해놓고 header 에서 꺼내서 쓸 수 있게 --%>
	<%-- request scope 로. 물론 session 이나 application 써도 되지만 낭비다. 계속 쓸 게 아니여서 --%>
	<!-- 현재 알고있는 액션태그로는 좀 한계가있어서 인코딩은 자바코드로-->
	<% request.setCharacterEncoding("UTF-8"); %>
	<!-- 아래 처럼 객체를 생성해놔야 메모리가 생성이되서 저장을 한다 -->
	<jsp:useBean id="req" class="com.example.RequestBean" scope="request"/>
	<!-- value 로 정해놓는것이 아니고 파라미터로 전달하겠다 -->
	<jsp:setProperty property="header" name="req" param="header"/>
	<jsp:setProperty property="footer" name="req" param="footer"/>
	
	<jsp:include page="inc/header.jsp"></jsp:include>
	<form method="post" action="requestExam.jsp">
		머릿말에 들어갈 내용 : <br> 
		<!-- request.getParameter("header"); -->
		<textarea rows="2" cols="60" name="header"></textarea>
		<br><br>
		꼬릿말에 들어갈 내용 : <br>
		<textarea rows="2" cols="60" name="footer"></textarea>
		<br><br>
		<input type="submit" value="새로고침" />
	</form>
	<jsp:include page="inc/footer.jsp"></jsp:include>
</body>
</html>

<!-- 
Bean ClassName : com.example.RequestBean
name		r/w			datatype
------------------------------------
header		r/w			String
footer		r/w			String

 -->