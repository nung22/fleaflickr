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
	<title>Add Name</title>
</head>
<body>
    <div class="container">
		<div class="header">
        	<h1 class="mt-4 text-success">Add a name!</h1>
        </div>
		<form:form action="/names/new" method="post" modelAttribute="babyName">
		    <div class="errors create-errors">
			    <h6 class="text-danger"><form:errors path="name"/></h6>
			    <h6 class="text-danger"><form:errors path="gender"/></h6>
			    <h6 class="text-danger"><form:errors path="origin"/></h6>
			    <h6 class="text-danger"><form:errors path="meaning"/></h6>
		    </div>
		    <form:hidden path="creator" value="${user.id}"/>
		    <p class="form-grp">
		        <form:label path="name">New Name:</form:label>
		        <form:input path="name"/>
		    </p>
		    <p class="form-grp">
		        <form:label path="gender">Typical Gender:</form:label>
		        <form:select path="gender">
		        	<form:option class="text-center" value="" disabled="true" selected="true">--------- Pick a Gender ---------</form:option>
		        	<form:option value="Neutral"></form:option>
		        	<form:option value="Male"></form:option>
		        	<form:option value="Female"></form:option>
		        </form:select>
		    </p>
		    <p class="form-grp">
		        <form:label path="origin">Origin:</form:label>
				<form:input path="origin"/>
		    </p>
		    <p class="form-grp">
		        <form:label path="meaning">Meaning:</form:label>       
		        <form:textarea path="meaning" rows="3"/>
		    </p>
		    <div class="form-btns">
		    	<a class="btn btn-outline-warning form-btn" href="/home">Cancel</a>
			    <input class="btn btn-success form-btn submit" type="submit" value="Submit"/>
		    </div>    
		</form:form>  
    </div>
    <script type="text/javascript" src="/js/app.js"></script>
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>