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

	<form action="homework1.jsp" method="post">
		국어 : <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').
			replace(/(\..*)\./g, '$1');" name="kor" required/><br><br>
		영어 : <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').
			replace(/(\..*)\./g, '$1');" name="eng" required/><br><br>
		수학 : <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').
			replace(/(\..*)\./g, '$1');" name="mat" required/><br><br>
		<input type="submit" value="전송" />
 	</form>
<%
	}
	else {
%>	
 	<%
 	request.setCharacterEncoding("UTF-8");
	
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");	
	String mat = request.getParameter("mat");	
	
    int intkor = Integer.parseInt(kor);
    int inteng = Integer.parseInt(eng);
    int intmat = Integer.parseInt(mat);

    int total = intkor + inteng + intmat;
    double average = total / 3;
	
	%>
	
	당신의 성적입니다.<br>
 	총점 :<%= total %><br>
 	평균 :<%= average %><br>
 	<%
 	} 
 %>
</body>
</html>
<!-- 
	당신의 성적입니다.
	총점 :
	평균 :
 -->