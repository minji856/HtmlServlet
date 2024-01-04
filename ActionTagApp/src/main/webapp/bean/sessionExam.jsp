<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionExam.jsp</title>
</head>
<body>
	<h1>세션을 이용한 타이머</h1>
	<!-- 이 페이지를 보게 된다면 세션이 만들어진거다. uesBean으로 객체 생성-->
	<!-- useBean 태그 안으로 글 넣어주면 끝나기 전까지 안 보여진다.-->
	<jsp:useBean id="timer" class="com.example.SessionBean" scope="session">
		세션 시작입니다. 타이머 작동을 시작합니다.
	</jsp:useBean>
	<br><br>
	<!-- bean 안에 메서드들 중 하나의 작업한 후에 시간이 얼마나 흘렀냐 -->
	bean 의 프로퍼티를 마지막으로 접근한 뒤에 경과한 시간은 
	<jsp:getProperty property="elapsedTimeAfterLastAccess" 
	name="timer"/>
	 초 입니다.<br><br>
	
	<!-- form 태그에 있는 restart 가 param 으로 전달된다 -->
	<jsp:setProperty property="restart" name="timer" param="restart"/>
	타이머를 리셋한 뒤에 경과된 시간은 
	<jsp:getProperty property="elapsedTime" name="timer"/> 
	 초 입니다. <br><br>
	<!-- 총 접속시간 -->
	타이머가 시작된 뒤에 경과된 시간은 
	<jsp:getProperty property="elapsedTimeAfterInst" name="timer"/>
	  초 입니다. <br><Br>
	<!-- method 는 지금은 크게 차이가 없다 -->
	<!-- 같은 form 태그안에 submit 2개는 좋은 방법은 아니되, 가능은 하다 -->
	<form action="sessionExam.jsp" method="post">
		<input type="submit" name="check" value="경과시간 확인"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" name="restart" value="타이머 리셋"/>
	</form>
</body>
</html>
<!-- 
className : com.example.SessionBean
name 					r/w 		datatype 		explain
---------------------------------------------------------
elapsedTime 				r 		 long 		타이머 리셋 후 경과시간
restart					    w 		 boolean 		타이머 리셋
elapsedTimeAfterInst 		r		  long 		객체 생성 후 경과시간
elapsedTimeAfterLastAcess 	r 		  long 		마지막 접근 후 경과시간
-->