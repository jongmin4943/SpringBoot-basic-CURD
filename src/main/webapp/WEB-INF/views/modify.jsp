<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>유저 수정</h1>
	<form action="/modify/${user.id}" method="post">
		<table border="1">
			<tr>
				<th>Id</th>
				<td><input type="text" name="id" readonly="readonly" value="${user.id}"/></td>
			</tr>
			<tr>
				<th>Name</th>
				<td><input type="text" name="username" readonly="readonly" value="${user.username}"/></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input type="password" name="password"/></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><input type="email" name="email" value="${user.email}"/></td>
			</tr>
			<tr>
				<th>RegDate</th>
				<td><input type="text" name="regdate" readonly="readonly" value="${user.regdate}"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="수정"/></td>
				<td><a href="/user/${user.id}">취소</a></td>
			</tr>
		</table>
	</form>
</body>
</html>