<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체크 아웃</title>
</head>
<body>
	<h1>도서 구매 주문 페이지</h1>
	<b>주문한 도서</b>
	<table border="1">
		<tr>
			<th>도서 제목</th><th>작가</th><th>가겨</th><th>수량</th>
		</tr>
		<!-- 주문한 도서들 출력 ${bookList} 생략 -->
		<c:forEach var="dto" items="${sessionScope.bookList}">
			<tr>
				<td>${dto.title}</td>
				<td>${dto.author}</td>
				<td>${dto.price}</td>
				<td>${dto.quantity}</td>
			</tr>
		</c:forEach>
	</table>
	<br>
		<b>전체 구입 액수 : ${amount}</b>
	<br>
	<form method="post" action="/MVCApp/bookshop">
		<input type="submit" value="결제" />
	</form>
</body>
</html>