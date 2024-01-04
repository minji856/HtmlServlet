<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	GlobalData : <%= application.getInitParameter("globalData") %><br>
	GlobalData : ${initParam.globalData}
</body>
</html>