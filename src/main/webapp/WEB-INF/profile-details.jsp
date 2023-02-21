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
	<title>FleaFlickr | Project Details</title>
</head>
<body>
	<jsp:include page="./components/navbar.jsp">
    <jsp:param name="initials" value="${user.firstName.charAt(0)}${user.lastName.charAt(0)}"/>
    <jsp:param name="fullName" value="${user.firstName} ${user.lastName}"/>
    <jsp:param name="email" value="${user.email}"/>
    <jsp:param name="id" value="${user.id}"/>
	</jsp:include> 
	<div class="container">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="/fleaflickr/projects" class="text-light text-decoration-none"
					onmouseover="this.classList.remove('text-decoration-none')"
          onmouseout="this.classList.add('text-decoration-none')">
					Projects</a></li>
				<li class="breadcrumb-item active" aria-current="page">Profile - <c:out value="${user.firstName} ${user.lastName}"/></li>
			</ol>
		</nav>
		<div class="container d-flex justify-content-center">
			<div class="px-5 pt-5 pb-2 rounded shadow mt-2" style="width:650px; background-color: #282c34;">
				<div class="mb-4 d-flex gap-3 align-items-center">
					<h1 class="text-light">User profile</h1>
				</div>
				<div class="d-flex justify-content-between">
					<div style="width:15rem">
						<div class="form-grp">
							<div class="form-label">First name</div>
							<div class="form-control form-ipt border-0">
								<c:out value="${user.firstName}"/>
							</div>
						</div>
						<div class="form-grp">
							<div class="form-label">Last name</div>
							<div class="form-control form-ipt border-0">
								<c:out value="${user.lastName}"/>
							</div>
						</div>
					</div>
					<div style="width:15rem">
            <div class="form-grp">
              <div class="form-label">Email</div>
              <div class="form-control form-ipt border-0">
                <c:out value="${user.email}"/>
              </div>
            </div>
						<div class="form-grp">
							<div class="form-label">Joined</div>
							<div class="form-control form-ipt border-0">
								<fmt:formatDate
								value="${user.createdAt}"
								pattern="MMMM d, yyyy"
								/>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer pt-4 mt-4">
					<a class="btn btn-secondary" href="/fleaflickr/projects">Return to dashboard</a>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/js/app.js"></script>
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
<jsp:include page="./components/loader-animation.jsp"/>
</html> 