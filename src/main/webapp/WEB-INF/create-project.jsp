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
	<title>Create Project</title>
</head>
<body>
	<jsp:include page="./components/navbar.jsp">
    <jsp:param name="initials" value="${user.firstName.charAt(0)}${user.lastName.charAt(0)}"/>
    <jsp:param name="fullName" value="${user.firstName} ${user.lastName}"/>
    <jsp:param name="email" value="${user.email}"/>
    <jsp:param name="id" value="${user.id}"/>
	</jsp:include> 
	<div class="container d-flex justify-content-center">
		<div class="px-5 pt-5 pb-2 rounded shadow" style="width:970px; background-color: #282c34;">
			<div class="mb-4">
				<h1 class="text-light" aria-describedby="createProjectHelpBlock">Add project details</h1>
				<div id="createProjectHelpBlock" class="form-text text-light fw-light fs-6" style="opacity: .6;">
					You can change this information anytime in your project settings.
				</div>
			</div>
			<form:form action="/fleaflickr/projects/new" method="post" modelAttribute="project">
				<div class="errors create-errors">
					<h6 class="text-danger"><form:errors path="title"/></h6>
					<h6 class="text-danger"><form:errors path="description"/></h6>
					<h6 class="text-danger"><form:errors path="dueDate"/></h6>
				</div>
				<form:hidden path="leader" value="${user.getId()}"/>
				<div class="d-flex justify-content-between">
					<div style="width:24rem">
						<div class="form-grp">
							<form:label class="form-label" path="title">Name</form:label>
							<form:input class="form-control" style="background-color:#212426; color: snow;" path="title" required="true"
							oninput="document.getElementById('key').innerHTML = this.value.substring(0,4).toUpperCase() "/>
						</div>
						<div class="form-grp">
							<form:label class="form-label" path=""  aria-describedby="keyHelpBlock">Key <span style="font-size: medium; opacity: .5;">(auto-generated)</span></form:label>
							<div class="form-control" id="key" style="background-color:#212426; color: snow; height:2.4rem; border-width: 0;"></div>
							<div id="keyHelpBlock" class="form-text">
								Created from first 4 characters of project name.
							</div>
						</div>
					</div>
					<div style="width:24rem">
						<div class="form-grp">
							<form:label class="form-label" path="description">Project Description</form:label>
							<form:textarea class="form-control" style="background-color:#212426; color: snow;" path="description" rows="3" required="true"/>
						</div>
						<div class="form-grp">
							<form:label class="form-label" path="dueDate">Due Date</form:label>
							<form:input class="form-control" style="background-color:#212426; color: snow;" path="dueDate" type="date" required="true"/>
						</div>
					</div>
				</div>
				<div class="modal-footer pt-4 mt-4">
					<a class="btn btn-dark" href="/fleaflickr/projects">Cancel</a>
					<input class="btn btn-primary ms-2" type="submit" value="Create project" style="width:8.5rem"/>
				</div>
			</form:form>
		</div>
	</div>
	<script type="text/javascript" src="/js/app.js"></script>
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
<jsp:include page="./components/loader-animation.jsp"/>
</html>