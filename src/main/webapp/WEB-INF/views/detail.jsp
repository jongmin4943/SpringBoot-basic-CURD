<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>유저 상세정보</h1>
<table border="1">
	<tr>
		<th>ID</th>
		<td>${user.id}</td>
	</tr>
	<tr>
		<th>Name</th>
		<td>${user.username}</td>
	</tr>
	<tr>
		<th>Password</th>
		<td>${user.password}</td>
	</tr>
	<tr>
		<th>Email</th>
		<td>${user.email}</td>
	</tr>
	<tr>
		<th>RegDate</th>
		<td>${user.regdate}</td>
	</tr>
</table>
<a href="/modify/${user.id}">수정</a>
<a href="/delete/${user.id}">삭제</a>
<a href="/">목록</a>
</body>
</html>