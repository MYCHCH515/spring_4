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
	.Check0{
		color: blue;
	}
	.Check1{
		color: red;
	}
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container">
	<h3>Member Join Page</h3>
	 <form action="./memberJoin" method="post" id="frm">
	    <div class="form-group">
	      <label for="id">Id:</label>
	      <input type="text" class="form-control" id="id" placeholder="Enter id" name="id" >
	    </div>
	    <div id="idResult"></div>
	    
	    <div class="form-group">
	      <label for="pw">Password:</label>
	      <input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw">
	    </div>
	    
	     <div class="form-group">
	      <label for="pw">Password Check:</label>
	      <input type="password" class="form-control" id="pw2" placeholder="Enter password" name="pw2">
	    </div>
	    <div id="pwResult"></div>
	    
	    <div class="form-group">
	      <label for="name">Name:</label>
	      <input type="text" class="form-control empty" id="name" placeholder="Enter name" name="name">
	      <div class="emptyResult"></div>
	    </div>
	    <div class="emptyResult"></div>

	   <div class="form-group">
	      <label for="email">Email:</label>
	      <input type="text" class="form-control empty" id="email" placeholder="Enter email" name="eamil">
	      <input type="text" class="form-control empty" id="email" placeholder="Enter Email" name="email">
	      <div class="emptyResult"></div>
	    </div>


	  	<input type="button" value="Join" id="join" class="btn btn-default"> 
  </form>
</div>
<script type="text/javascript">
var idCheck=false;
var pwCheck=false;
var emptyCheckResult = true;
//**********join btn**********
$("#join").click(function(){
	emptyCheck();
	if(idCheck && pwCheck && emptyCheckResult){
		$("#frm").submit();
	}
//	else{
//		alert("no");
//	}
});
//**********id check**************
$("#id").blur(function(){
	idCheck=false;	
	var id = $(this).val();	
	if(id==''){
		$("#idResult").html("Id를 입력하세요");
		$("#idResult").removeClass("Check0").addClass("Check1");
	}
	else{
		$.get("./memberIdCheck?id="+id,function(data){
			//a사용가능, b사용불가
			//true사용가능 false 사용불가
			//0사용가능 1사용불가	
			data=data.trim()
			var str = "중복된 ID 입니다";	
				$("#idResult").removeClass("Check0").addClass("Check1");
				if(data==0){
					str="사용가능한 ID 입니다"
					$("#idResult").removeClass("Check1").addClass("Check0");
					idCheck=true;
				}
				$("#idResult").html(str);	
		});
	}
});
//**********pw check************
$("#pw2").blur(function(){
	var pw = $("#pw").val();
	var pw2 = $(this).val();
	pwCheck=false;
	
	if(pw2==''){
		$("#pwResult").html("Password를 입력하세요");
	 	$("#pwResult").removeClass("Check0").addClass("Check1");
	 	
	}else if(pw==pw2){
		$("#pwResult").html("Password가 일치합니다");
		$("#pwResult").removeClass("Check1").addClass("Check0");
		pwCheck=true;
	}else{
		$("#pwResult").html("Password가 일치하지 않습니다");
	 	$("#pwResult").removeClass("Check0").addClass("Check1");
	}	
});
//*******empty check**************
function emptyCheck(){
	emptyCheckResult=true;
	$(".emptyResult").removeClass("Check1");
	$(".emptyResult").html('');
	$(".empty").each(function(){
		var data = $(this).val();
		if(data==''){
			emptyCheckResult=false;
			$(this).next().html("필수항목 입니다");
			$(".emptyResult").addClass("Check1");
		}
	});
}
	function emptyCheck() {
		emptyCheckResult=true;
		$(".emptyResult").removeClass("Check1");
		$(".emptyResult").html('');
		$(".empty").each(function() {
			var data = $(this).val();
			if(data==''){
				emptyCheckResult=false;
				$(this).next().html("필수 항목입니다");
				$(".emptyResult").addClass("Check1");
			}
		});
	}
</script>