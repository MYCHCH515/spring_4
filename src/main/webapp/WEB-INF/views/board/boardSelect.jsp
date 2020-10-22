<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
  <h3>${board} SelectPage</h3>
  	 <h3 id="num">${dto.num}</h3>
 	 <h3>Title : ${dto.title}</h3>
 	 <h3>Writer: ${dto.writer}</h3>
 	 <h3>Contents: ${dto.contents}</h3>
 	 <input type="button" title="${dto.num}" value = "Delete" class="btn btn-warning" id="del">
 	 <input type="button" title="${dto.num}" value="Update" class="btn btn-primary" id="upd">
 	 
 	 <c:if test="${board ne 'notice'}">
 	 <a href="./${board}Reply?num=${dto.num}" class="btn btn-info">Reply</a>
 	 </c:if>
</div>

<script type="text/javascript">
	$("#del").click(function(){
		//window.location.href="./noticeDelete?num=${dto.num}";	//상대경로 절대경로 상관없음 삭제할 num도 파라미터로 보내줘야함
		//var num = $("#num").html();
		var num = $(this).attr("title");
		//alert(num);
		window.location.href="./${board}Delete?num="+num;
	});
	
	$("#upd").click(function(){
		var num = $(this).attr("title");
		window.location.href="./${board}Update?num=${dto.num}";
	});



</script>
</body>
</html>