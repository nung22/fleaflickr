<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Figtree'>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/css/style.css"/>
	<title>Display Project</title>
</head>
<body>
    <div class="container">
       	<div class="header">
        	<h1 class="mt-4 text-primary">Project Details</h1>
        	<a class="btn btn-outline-info form-btn" href="/projects">Back to Dashboard</a>
        </div>
        <div class="display">
		    <p class="form-grp">
		        <span class="label text-warning">Project Title:</span>
		        <span class="info"><c:out value="${project.getTitle()}"></c:out></span>
		    </p>
		    <p class="form-grp">
		        <span class="label text-warning">Project Description:</span>       
		        <span class="info"><c:out value="${project.getDescription()}"></c:out></span>
		    </p>
		    <p class="form-grp">
		        <span class="label text-warning">Due Date:</span>
		        <span class="info"><fmt:formatDate value="${project.getDueDate()}" pattern="M/d/yyyy"/></span>
		    </p>
        </div>
	    <c:if test="${joinedProject}">
		    <div class="header mt-5">
			    <a class="btn btn-primary form-btn" href="/projects/${project.getId()}/tasks">See Tasks</a>
			    <c:if test="${project.getLeader().getId() == user.getId()}">
				    <a class="btn btn-danger form-btn" href="/projects/${project.getId()}/delete">Delete Project</a>
			    </c:if>
		    </div>    
	    </c:if>
    </div>
    <script type="text/javascript" src="/js/app.js"></script>
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html> 