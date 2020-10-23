<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="${pageContext.request.contextPath}/">Home</a></li>
      
      <li><a href="${pageContext.request.contextPath}/notice/noticeList">Notice</a></li>
      <li><a href="${pageContext.request.contextPath}/member/memberList">Member</a></li>
      <li><a href="${pageContext.request.contextPath}/qna/qnaList">Q&A</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
    	<c:choose>
    		<c:when test="${not empty member}"> 
    			<li><a href="${pageContext.request.contextPath}/member/memberPage"><span class="glyphicon glyphicon-user"></span> My</a></li>
      			<li><a href="${pageContext.request.contextPath}/member/memberLogout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    		</c:when>
    		
    		<c:otherwise> 	
     			 <li><a href="${pageContext.request.contextPath}/member/memberJoin"><span class="glyphicon glyphicon-user"></span> Join</a></li>
     			 <li><a href="${pageContext.request.contextPath}/member/memberLogin"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    		</c:otherwise>
    	</c:choose>
    </ul>
  </div>
</nav>
