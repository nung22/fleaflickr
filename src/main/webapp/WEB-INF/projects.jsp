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
	<title>Show Projects</title>
</head>
<body>
    <div class="container">
		<div class="header mb-3">
	       	<h1 class="page-title text-primary fw-bolder">Welcome, 
	       	<c:out value="${user.getFirstName()}"/>!</h1>
			<a class="btn btn-danger logout" href="/logout">Logout</a>
		</div>
		<div class="header table-header">
			<h4>All Projects:</h4>
			<a class="btn btn-success new-project" href="/projects/new">+ New Project</a>
		</div>
		<div class="table-holder rounded">
			<table class="table table-borderless table-striped text-center mb-5">
				<thead>
				    <tr class="fs-5">
				        <th>Project</th>
				        <th>Team Lead</th>
				        <th>Due Date</th>
				        <th>Action</th>
				    </tr>
				</thead>
				<tbody>
				<c:forEach var='oneProject' items='${projectsNotOnTeam}'>
				    <tr class="align-middle">
				        <td><a class="text-decoration-none" href="<c:url value='/projects/${oneProject.getId()}'/>">
				        <c:out value="${oneProject.getTitle()}"/></a></td>
				        <td><c:out value="${oneProject.getLeader().getFirstName()}"/></td>
				        <td><fmt:formatDate value="${oneProject.getDueDate()}" pattern="MMM d, yyyy"/></td>
				        <td><a class="text-decoration-none text-success" href="<c:url value='/join/${user.getId()}/${oneProject.getId()}'/>">
				        Join Team</a></td>
				    </tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<h4>Your Projects:</h4>
		<div class="table-holder rounded">
			<table class="table table-borderless table-striped text-center">
				<thead>
				    <tr class="fs-5">
				        <th>Project</th>
				        <th>Team Lead</th>
				        <th>Due Date</th>
				        <th>Action</th>
				    </tr>
				</thead>
				<tbody>
				<c:forEach var='oneProject' items='${projectsOnTeam}'>
				    <tr class="align-middle">
				        <td><a class="text-decoration-none" href="<c:url value='/projects/${oneProject.getId()}'/>">
				        <c:out value="${oneProject.getTitle()}"/></a></td>
				        <td><c:out value="${oneProject.getLeader().getFirstName()}"/></td>
				        <td><fmt:formatDate value="${oneProject.getDueDate()}" pattern="MMM d, yyyy"/></td>
				        <td>
				        <c:choose>
				        	<c:when test="${oneProject.getLeader().getId() == user.getId()}">
				        		<a class="text-decoration-none" href="<c:url value='/projects/edit/${oneProject.getId()}'/>">
				        		Edit</a>
				        	</c:when>
				        	<c:otherwise>
				        		<a class="text-decoration-none text-danger" href="<c:url value='/leave/${user.getId()}/${oneProject.getId()}'/>">
				        		Leave Team</a>
				        	</c:otherwise>
				        </c:choose>
				        </td>
				    </tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
    </div>
    <script type="text/javascript" src="/js/app.js"></script>
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>