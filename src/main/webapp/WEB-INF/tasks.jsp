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
	<title>Project Tasks</title>
</head>
<body>
    <div class="container">
       	<div class="header">
        	<div>
	        	<h1 class="mt-4 text-light"><span class="text-primary">Project:</span> 
	        	<c:out value="${project.title}"></c:out></h1>
        		<h5 class=""><span class="text-warning">Project Lead: </span>
        		<c:out value="${project.leader.firstName}"></c:out></h5>
        	</div>
        	<a class="btn btn-outline-info form-btn" href="/projects">Back to Dashboard</a>
        </div>
		<form:form class="task-form" action="/projects/${project.id}/tasks" method="post" modelAttribute="task">
		    <div class="errors">
			    <h6 class="text-danger"><form:errors path="ticket"/></h6>
		    </div>
		    <form:hidden path="project" value="${project.id}"/>
		    <form:hidden path="user" value="${user.id}"/>
		    <p class="form-grp">
		        <form:label path="ticket">Add a task ticket for<br>this team:</form:label>       
		        <form:textarea path="ticket" rows="3"/>
		    </p>
		    <div class="form-btns">
		    	<div></div>
			    <input class="btn btn-success form-btn submit" type="submit" value="Submit"/>
		    </div>
		</form:form>
	    <div class="task-list-header fw-bold fs-4 mt-5 bg-warning text-dark">Task List</div>
	    <div class="task-list bg-secondary">
    	<c:forEach var="oneTask" items="${tasks}">
    		<p class="timestamp fw-bold">
	    		<span class="">
		    		Added by <c:out value="${oneTask.user.firstName}"></c:out> 
		    		at <fmt:formatDate value="${oneTask.createdAt}" pattern="h:mm aa 'on' MMM d, yyyy"/>	
	    		</span>
	    		<c:if test="${oneTask.user.id == user.id || user.id == project.leader.id}">
		    		<a class="btn-close close-task" href="/projects/${project.id}/tasks/${oneTask.id}/delete"></a>
	    		</c:if>
    		</p>
    		<p class="ticket"><c:out value="${oneTask.ticket}"></c:out></p>
    	</c:forEach>
	    </div>     
    </div>
    <script type="text/javascript" src="/js/app.js"></script>
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>