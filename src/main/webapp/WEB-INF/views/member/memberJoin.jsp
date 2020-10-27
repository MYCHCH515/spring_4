<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/bootstrap.jsp"></c:import>
<style type="text/css">
	.idCheck0{
		color: blue;
	}
	.idCheck1{
		color: red;
	}

</style>
</head>
<body>

<c:import url="../template/header.jsp"></c:import>

<div class="container">
	<h3>Member Join Page</h3>
	 <form action="./memberJoin" method="post">
	    <div class="form-group">
	      <label for="id">Id:</label>
	      <input type="text" class="form-control" id="id" placeholder="Enter id" name="id" class="check">
	    </div>
	    <div id="idResult"></div>
	    
	    <div class="form-group">
	      <label for="pw">Password:</label>
	      <input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw" class="check">
	    </div>
	    <div id="pwResult1"></div>
	    
	     <div class="form-group">
	      <label for="pw">Password Check:</label>
	      <input type="password" class="form-control" id="pw2" placeholder="Enter password" name="pw2" class="check">
	    </div>
	    <div id="pwResult2"></div>
	    
	    <div class="form-group">
	      <label for="name">Name:</label>
	      <input type="text" class="form-control" id="na" placeholder="Enter name" name="name" class="check">
	    </div>
	    <div id="nameResult"></div>
	    
	    <div class="form-group">
	      <label for="email">Email:</label>
	      <input type="text" class="form-control" id="email" placeholder="Enter email" name="eamil" class="check">
	    </div>
	    <div id="emailResult"></div>
	  
	    <button type="submit" id="sub" class="btn btn-default">Submit</button>
 		
  </form>
</div>

<script type="text/javascript">

$("#id").blur(function(){
	var id = $(this).val();
	
	$.get("./memberIdCheck?id="+id,function(data){
		//a사용가능, b사용불가
		//true사용가능 false 사용불가
		//0사용가능 1사용불가
			
		data=data.trim()
		var str = "중복된 ID 입니다"
			$("#idResult").addClass("idCheck1");
			if(data==0){
				str="사용가능한 ID 입니다"
				$("#idResult").removeClass("idCheck1").addClass("idCheck0");
			}
			$("#idResult").html(str);	
	});
});
</script>
