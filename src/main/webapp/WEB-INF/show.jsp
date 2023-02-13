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
	<title>Project Details</title>
</head>
<body>
    <div class="container">
       	<div class="header">
        	<div>
	        	<h1 class="mt-4 text-primary"><c:out value="${babyName.name}"></c:out></h1>
        		<h3 class="text-success added-by">(Added by <c:out value="${babyName.creator.firstName}"></c:out>)</h3>
        	</div>
        	<a class="btn btn-outline-info form-btn" href="/home">Back to Dashboard</a>
        </div>
        <div class="display">
		    <p class="form-grp">
		        <span class="label text-warning">Gender:</span>
		        <span class="info"><c:out value="${babyName.gender}"></c:out></span>
		    </p>
		    <p class="form-grp">
		        <span class="label text-warning">Origin:</span>
		        <span class="info"><c:out value="${babyName.origin}"></c:out></span>
		    </p>
		    <p class="form-grp">
		        <span class="label text-warning">Meaning:</span>       
		        <span class="info fst-italic"><c:out value="${babyName.meaning}"></c:out></span>
		    </p>
		    <p class="form-grp mb-5">
        		<c:choose>
		        <c:when test="${voted}">
			        <span class="label text-info">You voted for this name.</span>
		        </c:when>
		        <c:otherwise>
			        <td><a class="btn btn-success form-btn" href="<c:url value='/vote/${user.id}/${babyName.id}'/>">
					UpVote!</a></td>
		        </c:otherwise>
		        </c:choose>
		    </p>
        </div>
	    <c:if test="${user.id == babyName.creator.id}">
		    <div class="header mt-5 ms-3">
			    <a class="btn btn-outline-warning form-btn" href="/names/edit/${babyName.id}">Edit</a>
				<div></div>
		    </div>    
	    </c:if>
    </div>
    <script type="text/javascript" src="/js/app.js"></script>
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>