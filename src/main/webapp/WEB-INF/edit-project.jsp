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
	<title>Edit Project</title>
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
			<h1 class="mt-4 text-warning">Edit Project</h1>
		</div>
		<form:form action="/fleaflickr/projects/edit/${project.getId()}" method="post" modelAttribute="project">
			<div class="errors edit-errors">
				<h6 class="text-danger"><form:errors path="title"/></h6>
				<h6 class="text-danger"><form:errors path="description"/></h6>
				<h6 class="text-danger"><form:errors path="dueDate"/></h6>
			</div>
			<input type="hidden" name="_method" value="put">
			<form:hidden path="leader"/>
			<p class="form-grp">
					<form:label path="title">Project Title:</form:label>
					<form:input path="title"/>
			</p>
			<p class="form-grp">
					<form:label path="description">Project Description:</form:label>       
					<form:textarea path="description" rows="3"/>
			</p>
			<p class="form-grp">
					<form:label path="dueDate">Due Date:</form:label>
					<form:input path="dueDate" type="date"/>
			</p>
			<div class="form-btns">
				<a class="btn btn-outline-warning form-btn" href="/fleaflickr/projects">Cancel</a>
				<input class="btn btn-success form-btn submit" type="submit" value="Submit"/>
			</div>
		</form:form>
	</div>
	<script type="text/javascript" src="/js/app.js"></script>
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
<jsp:include page="./components/loader-animation.jsp"/>
</html>