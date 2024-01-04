<%@ page contentType="text/html; charset=UTF-8"%>

[머릿말내용]<br>
<jsp:useBean id="req" class="com.example.RequestBean" scope="request" />
<jsp:getProperty property="header" name="req" />
<hr/>