<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>윤종민 NCS 스프링부트</h1>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Regdate</th>
			<th>Option</th>
		</tr>
		<c:forEach items="${users}" var="user" varStatus="vs">
			<tr>
				<td>${user.id}</td>
				<td><a href="/user/${user.id}">${user.username}</a></td>
				<td>${user.regdate}</td>
				<td><a href="/modify/${user.id}">수정</a>/<a href="/delete/${user.id}">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
	<a href="/join">유저 등록</a>
	
	<a href="/rest">RestPage</a>
	
</body>
</html>