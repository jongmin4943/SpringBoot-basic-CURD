<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>유저 입력</h1>
	<form action="/join" method="post">
		<table border="1">
			<tr>
				<th>Name</th>
				<td><input type="text" name="username"/></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input type="password" name="password"/></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><input type="email" name="email"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="등록"/></td>
				<td><a href="/">취소</a></td>
			</tr>
		</table>
	</form>
</body>
</html>