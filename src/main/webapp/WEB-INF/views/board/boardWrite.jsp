<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:import url="../template/bootstrap.jsp"></c:import>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style type="text/css">
.filedel{
	color: red;
	cursor: pointer;
	font-weight: bold;
}
</style>

</head>
<body>

<c:import url="../template/header.jsp"></c:import> 
  
<div class="container">
  <h2>${board} Write Form</h2>
  <form id="frm" action="./${board}Write" method="post" enctype="multipart/form-data">
    
    <div class="form-group">
      <label for="title">Title:</label>
      <input type="text" class="form-control" id="title" placeholder="Enter title" name="title">
    </div>
    
     <div class="form-group">
      <label for="writer">Writer:</label>
      <input type="text" class="form-control" value="${member.id}" id="writer" placeholder="Enter writer" name="writer">
    </div>
  
    <div class="form-group">
      <label for="contents">Contents:</label>
        <textarea class="form-control" id="contents" name="contents"></textarea>
    </div>
    
    <div class="form-group">
 	<input type="button" value="FileAdd" class="btn btn-info" id="fileAdd">
 	</div>
 	
 	<div id="result"></div>
 	
 	<input type="button" class="btn btn-primary" value="Write" id="btn">
    <button type="submit" class="btn btn-default">Write</button>
  </form>
</div>

<script type="text/javascript" src="../resources/js/boardWrite.js"></script>

<script type="text/javascript">
	var count =0;
	
	 $('#contents').summernote({
		 height:300,
		 callbacks :{
			 	onImageUplaod: function(files, editor){
			 		var formData = new FormData(); //가상의 form태그를 하나 더 만들었다고 생각
			 		formData.append('file', files[0]); //파라미터 이름이 file 
			 		
			 		$.ajax({
			 			type:"POST",
			 			url:"./summernote",
			 			data:formData,
			 			enctype:"multipart/form-data",
			 			cache:false,
			 			contentType:false,
			 			processData:false,
			 			success:function(data){
			 				alert(data);
			 			}
			 		})
			 }
		 }
	});
	 
	 $('#btn').click(function(){
	 	 var contents = $('#contents').summernote('code');
	 	 alert(contents);
	 })
	
	$("#fileAdd").click(function(){
		var str=  "<div class='input-group'><input id='files' type='file' class='form-control' name='files'> <span class='input-group-addon filedel'>DEL</span>"
		
		if(count<5){
			$("#result").append(str);
			count ++;
		}
		else{
			alert("첨부파일은 5개까지");
		}
	});
	
	$("#result").on("click",".filedel", function(){
		$(this).parent(".input-group").remove();
		count--;
	});
	
	
</script>


</body>
</html>