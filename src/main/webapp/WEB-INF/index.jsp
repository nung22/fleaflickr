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
	<title>Joy Bundler</title>
</head>
<body>
    <div class="container">
       <h1 class="text-center site-title text-primary">Joy Bundler</h1>
       <h5 class="text-center text-warning mt-3">A place to vote on baby names.</h5>
       <div class="forms">
		    <div class="login-reg reg">
		        <form:form action="/register" method="post" modelAttribute="newUser">
		        	<h2 class="text-light fw-bold">Create Account</h2>		            
		            <!-- Error Messages -->
					<div class="errors">
						<h6 class="text-danger "><form:errors path="firstName"/></h6>
						<h6 class="text-danger "><form:errors path="lastName"/></h6>
						<h6 class="text-danger "><form:errors path="email"/></h6>
						<h6 class="text-danger "><form:errors path="password"/></h6>
						<h6 class="text-danger "><form:errors path="confirm"/></h6>
		            </div>
		            <!-- Form Input -->
		            <div class="form-group row mb-3">
		                <form:label class="text-light mb-1" path="firstName">First Name</form:label>
		                <form:input class="form-control bg-light"  path="firstName" placeholder="first name"/>
		            </div>
		            <div class="form-group row mb-3">
		                <form:label class="text-light mb-1" path="lastName">Last Name</form:label>
		                <form:input class="form-control bg-light"  path="lastName" placeholder="last name"/>
		            </div>
		            <div class="form-group row mb-3">
		                <form:label class="text-light mb-1" path="email">Email</form:label>
		                <form:input class="form-control bg-light" type="email" path="email" placeholder="name@example.com"/>
		            </div>
		            <div class="form-group row mb-3">
		                <form:label class="text-light mb-1" path="password">Password</form:label>
		                <form:input class="form-control bg-light" type="password" path="password" aria-describedby="passwordHelpBlock"/>
		                <div id="passwordHelpBlock" class="form-text">
		                    Your password must be at least 8 characters long.
		                </div>
		            </div>
		            <div class="form-group row mb-3">
		                <form:label class="text-light mb-1" path="confirm">Confirm PW</form:label>
		                <form:input class="form-control bg-light" type="password" path="confirm" placeholder="type password again"/>
		            </div>
		            <input class="form-control btn btn-primary fw-bold mt-2" type="submit" value="CREATE ACCOUNT"/>
		        </form:form>
		    </div>
		    <div class="login-reg login">
		        <form:form action="/login" method="post" modelAttribute="newLogin">
		        	<h2 class="text-light fw-bold">Sign In</h2>
		        	<div class="errors">
						<h6 class="text-danger "><form:errors path="email"/></h6>
					    <h6 class="text-danger "><form:errors path="password"/></h6>
		        	</div>
		            <div class="form-group row mb-3">
		                <form:label class="text-light mb-1" path="email">Email</form:label>
		                <form:input class="form-control bg-light" type="email" path="email" placeholder="name@example.com" required="true"/>
		            </div>
		            <div class="form-group row mb-3">
		                <form:label class="text-light mb-1" path="password">Password</form:label>
		                <form:input class="form-control bg-light" type="password" path="password" required="true"/>
		            </div>
		            <input class="form-control btn btn-primary fw-bold mt-2" type="submit" value="SIGN IN"/>
		        </form:form>
		    </div>
       </div>              
    </div>
    <script type="text/javascript" src="/js/app.js"></script>
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>