<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
	<title>Home</title>
	
<c:import url="./template/bootstrap.jsp"></c:import>
</head>
<body>
<c:import url="./template/header.jsp"></c:import>

<div class="container">

  <h3>Right Aligned Navbar</h3>
  <p>The .navbar-right class is used to right-align navigation bar buttons.</p>
</div>

<div> 
	<c:if test="${not empty member}">
		<h1>LoginSuccess</h1>
	</c:if>
	
	<c:if test="${empty member}">
		<h1>LoginFail</h1>
	</c:if>
	<img alt="main_img" src="./resources/images/index/i2.jpg">
	<a href="./cookie/makeCookie">MakeCookie</a>
</div>
</body>
</html>
