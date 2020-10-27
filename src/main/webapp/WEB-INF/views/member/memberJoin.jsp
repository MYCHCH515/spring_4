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
	var id = $("#id").val();
	
	$.get("./memberPage",{id:id},function(data){
		if(id==member.id){
			$("#idResult").val('중복된아이디입니다')
		}
		else{
			$("#idResult").val('')
		}
	});
});


var id = document.getElementById("id");
var pw = document.getElementById("pw");
var pw2 = document.getElementById("pw2");
var na = document.getElementById("na");
var email = document.getElementById("email");
var idResult = document.getElementById("idResult");
var pwResult1 = document.getElementById("pwResult1");
var pwResult2 = document.getElementById("pwResult2");
var nameResult = document.getElementById("nameResult");
var emailResult = document.getElementById("emailResult");
var sub = document.getElementById("sub");
var check = document.getElementsByClassName("check");
check = [false,false,false,false,false];



$("#id").blur(function(){
	var id = $("#id").val();
	
	$.get("./memberPage?id=id",function(data){
		if(id==member.id){
			$("#idResult").html('중복된아이디입니다')
		}
		else{
			$("#idResult").val('')
		}
	});
});


$("#id").keyup(function(){
	var id = $("#id").val();
	
	if(id.length>=5&&id.length<=10){
		$("#idResult").html('')
	}
	else{
		$("#idResult").html('5글자이상 10글자 이하로 입력하세요')
	}
});

$("#pw").keyup(function(){
	var pw = $("#pw").val();
	
	if(pw.length>=6&&pw.length<=14){
		$("#pwResult").html('')
	}
	else{
		$("#pwResult").html('6글자이상 14글자 이하로 입력하세요')
	}
});

$("#p2").keyup(function(){
	var pw = $("#pw").val();
	var pw2 = $("#pw2").val();
	
	if(pw==pw2){
		$("#pw2Result").style.color="blue";
		$("#pw2Result").html('비밀번호가 일치합니다')
	}
	else{
		$("#pw2Result").style.color="red";
		$("#pw2Result").html('비밀번호가 일치하지않습니다')
	}
});

/**
pw2.addEventListener('keyup',function(){
	
	if(pw.value==pw2.value){
		pwResult2.style.color="blue";
		pwResult2.innerHTML="비밀번호가 일치합니다";
		check[2] = true;
	}
	else {
		pwResult2.style.color="red";
		pwResult2.innerHTML="비밀번호가 일치하지않습니다";
		check[2] = false;
	}
});

id.addEventListener('keyup',function(){
	var str =id.value;

	if(str.length>=5&&str.length<=10){
		idResult.innerHTML="";
		check[0] = true;
	}
	else{
		idResult.innerHTML="5글자이상 10글자 이하로 입력하세요";
		check[0]=false;
	}
});

pw.addEventListener('keyup',function(){
	var str =pw.value;
	if(str.length>=6&&str.length<=14){
		pwResult1.innerHTML="";
		check[1] = true;
	}
	else{
		pwResult1.innerHTML="6글자이상 14글자 이하로 입력하세요";
		check[1] = false;
	}
}); **/

pw2.addEventListener('keyup',function(){
	
	if(pw.value==pw2.value){
		pwResult2.style.color="blue";
		pwResult2.innerHTML="비밀번호가 일치합니다";
		check[2] = true;
	}
	else {
		pwResult2.style.color="red";
		pwResult2.innerHTML="비밀번호가 일치하지않습니다";
		check[2] = false;
	}
});
na.addEventListener('blur',function(){
	var str = na.value;
	if(str.length==""){
		nameResult.style.color="red";
		nameResult.innerHTML="이름을 입력하세요";
		check[3] = false;
	}
});

na.addEventListener('keyup',function(){
		nameResult.innerHTML="";
		check[3] = true;
	});

email.addEventListener('blur',function(){
	var str = email.value;
	if(str.length==""){
		emailResult.style.color="red";
		emailResult.innerHTML="이메일을 입력하세요";
		check[4] = false;
	}
});

email.addEventListener('keyup',function(){
		emailResult.innerHTML="";
		check[4] = true;
	});

sub.addEventListener('click',function(){
var result = true;
for(var i=0;i<check.length;i++){
	if(!check[i].value){ //하나라도 체크 안되어있으면 false 다체크되어있음 true
		result =false;
	}
}
if(result){
	alert("회원가입성공")
	$("#sub").submit();
}
else{
	alert("회원가입실패")
	$("#sub").submit();
}
});


</script>
</body>
</html>