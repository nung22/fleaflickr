<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="./components/loader-style.jsp"/>
<head>
	<meta charset="ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="./components/font.jsp"/>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/css/style.css"/>
	<title>Display Project</title>
</head>
<body>
	<jsp:include page="./components/navbar.jsp">
    <jsp:param name="initials" value="${user.firstName.charAt(0)}${user.lastName.charAt(0)}"/>
    <jsp:param name="fullName" value="${user.firstName} ${user.lastName}"/>
    <jsp:param name="email" value="${user.email}"/>
    <jsp:param name="id" value="${user.id}"/>
	</jsp:include> 
	<div class="container">
		<div class="header">
			<h1 class="mt-4 text-primary">Project Details</h1>
		</div>
		<div class="display">
		<div class="form-grp">
			<span class="label text-warning">Project Title:</span>
			<span class="info"><c:out value="${project.getTitle()}"></c:out></span>
		</div>
		<div class="form-grp">
			<span class="label text-warning">Project Description:</span>       
			<span class="info"><c:out value="${project.getDescription()}"></c:out></span>
		</div>
		<div class="form-grp">
			<span class="label text-warning">Due Date:</span>
			<span class="info"><fmt:formatDate value="${project.getDueDate()}" pattern="M/d/yyyy"/></span>
		</div>
		</div>
	<c:if test="${joinedProject}">
		<div class="header mt-5">
			<a class="btn btn-primary form-btn" href="/fleaflickr/projects/${project.getId()}/tickets">See Tickets</a>
			<c:if test="${project.getLeader().getId() == user.getId()}">
				<a class="btn btn-danger form-btn" href="/fleaflickr/projects/${project.id}/delete">Delete Project</a>
			</c:if>
		</div>    
	</c:if>
	</div>
	<script type="text/javascript" src="/js/app.js"></script>
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
<jsp:include page="./components/loader-animation.jsp"/>
</html> 