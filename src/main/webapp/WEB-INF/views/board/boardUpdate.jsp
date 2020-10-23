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
  <h2>${board} Update Form</h2>
  <form id="frm" action="./${board}Update" method="post">
    <input type="hidden" name="num" value="${dto.num}">
    <div class="form-group">
      <label for="title">Title:</label>
      <input type="text" class="form-control" id="title" placeholder="Enter title" name="title" value="${dto.title}">
    </div>
    
     <div class="form-group">
      <label for="writer">Writer:</label>
      <input type="text" class="form-control" id="writer" placeholder="Enter writer" name="writer" value="${dto.writer}">
    </div>
  
    <div class="form-group">
      <label for="contents">Contents:</label>
        <textarea class="form-control" rows="10" id="contents" name="contents">${dto.contents}</textarea>
    </div>
 
 	<input type="button" class="btn btn-primary" value="Update" id="btn">
    <button type="submit" class="btn btn-default">Update</button>
  </form>
</div>
<script type="text/javascript" src="../resources/js/boardWrite.js"></script>

</body>
</html>