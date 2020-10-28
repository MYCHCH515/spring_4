<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/bootstrap.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="container">
	<table class="table table-condensed">
		<tr>
			<th>Num</th><td>${member.num}</td>
		</tr>
		<tr>
			<th>Id</th><td>${member.id}</td>
		</tr>
		<tr>
			<th>Name</th><td>${member.name}</td>
		</tr>
		<tr>
			<th>Email</th><td>${member.email}</td>
		</tr>
	</table>
	
	<!-- 회원가입할때 올린 사진들 나오게 해줌 -->
	<div>
		<img alt="" src="../resources/upload/member/..나머지주소db에서 가져오기">
	</div>
	
	<a href="./memberUpdate" class="btn btn-primary">Update</a>
	<a href="./memberDelete" class="btn btn-danger">Delete</a>
</div>


</body>
</html>