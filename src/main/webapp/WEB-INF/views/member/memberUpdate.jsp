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
	<h3>MemberUpdate Form</h3>
	 <form action="./memberUpdate" method="post">
	    <div class="form-group">
	      <label for="name">Name:</label>
	      <input type="text" class="form-control" id="name" name="name" value="${member.name}">
	    </div>
	    <div class="form-group">
	      <label for="email">Email:</label>
	      <input type="email" class="form-control" id="email" name="email" value="${member.email}">
	    </div>
	  
	    <button type="submit" class="btn btn-default">Update</button>
  </form>

</div>

</body>
</html>