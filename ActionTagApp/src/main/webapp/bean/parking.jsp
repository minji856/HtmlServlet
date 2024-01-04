<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.example.CarDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주차관리 프로그램</title>
</head>
<body>
	<jsp:useBean id="parking" class="com.example.ParkingBean" scope="application"/>
	<!-- param 이 프로퍼티랑 이름 같아서 생략가능 -->
	<jsp:setProperty property="enter" name="parking" param="enter"/>
	<jsp:setProperty property="exit" name="parking"/>
	
	<h1>주차 관리 프로그램</h1>
	<form action="parking.jsp" method="post">
		주차장에 들어온 차번호 : <input type="text" name="enter"/>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="입차"/> 
	</form>
	
	<form action="parking.jsp" method="post">
		주차장에서 나간 차번호 : <input type="text" name="exit"/>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="출차"/> 
	</form>
	<hr/>
	주차된 차량 목록 <br>
	<table border="1">
		<tr>
			<th>차량 번호</th> <th>입차 시간</th>
		</tr>
		<!-- 직접 반복문 돌려서 차량 번호 출력되게 carlist 로 return 했으면 백터로 받아야 한다 아니면 아래처럼-->		
		<%
			CarDto[] cars = parking.getCarList();
			for(int i=0; i<cars.length; i++){
				CarDto car = cars[i];
		%>
		<!-- 액션태그로 바꿔보기 -->
			<tr>
				<td><%= car.getPlateNumber() %></td>
				<td><%= car.getParkingTime() %></td>
				<td><jsp:getProperty property="plateNumber" name="car"/></td>
				<td><jsp:getProperty property="parkingTime" name="car"/></td>
			</tr>
		<%
		}
		%>
		<!-- 나간 차는 입력할 필요가 없다 -->
	</table>
	<!-- 반복문 처리가 안되어있어서 만들어 줘야한다 -->
	총 대수 : <jsp:getProperty property="total" name="parking"/>
</body>
</html>

<!-- 
*************************************************
className : com.example.CarDto
name r/w datatype
------------------------------------
plateNumber r String
parkingTime r java.util.Date

*************************************************
className : com.example.ParkingBean
name r/w datatype
------------------------------------
enter w String
exit w String
total r int
car r CarDto
carList r carDto[]
-->