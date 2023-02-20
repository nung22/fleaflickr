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
	<title>FleaFlickr | Ticket Details</title>
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
				<li class="breadcrumb-item">
					<a href="/fleaflickr/projects/${project.id}" class="text-light text-decoration-none"
					onmouseover="this.classList.remove('text-decoration-none')"
					onmouseout="this.classList.add('text-decoration-none')">
					<c:out value="${project.title}"/></a></li>
				<li class="breadcrumb-item">
					<a href="/fleaflickr/projects/${project.id}/tickets" class="text-light text-decoration-none"
					onmouseover="this.classList.remove('text-decoration-none')"
          onmouseout="this.classList.add('text-decoration-none')">
					Tickets</a></li>
				<li class="breadcrumb-item active" aria-current="page"><c:out value="${project.title.substring(0,4).toUpperCase()}-${ticket.id}"/></li>
			</ol>
		</nav>
		<div class="container d-flex justify-content-center">
			<div class="px-5 pt-5 pb-2 rounded shadow mt-2" style="width:970px; background-color: #282c34;">
				<div class="d-flex justify-content-between">
          <div style="width:24rem">
            <div class="mb-4 d-flex gap-3 align-items-center">
              <h1 class="text-light">Ticket details</h1>
              <c:if test="${project.leader.id == user.id}">
              <a class="rounded" style="padding: .3rem .5rem .5rem .5rem;" id="projectIcon"
              href="<c:url value='/fleaflickr/projects/${project.id}/tickets/${ticket.id}/edit'/>"
              onmouseover="this.classList.add('bg-dark')" onmouseout="this.classList.remove('bg-dark')">
                <img src="/assets/icons/gear.png" style="width:1.3rem; opacity: .4;" alt="gear">
              </a>
              </c:if>
            </div>
						<div class="form-grp">
							<div class="form-label">Summary</div>
							<div class="form-control form-ipt border-0">
								<c:out value="${ticket.title}"/>
							</div>
						</div>
            <div class="form-grp">
              <div class="form-label">Description</div>
              <div class="form-control form-ipt border-0" style="height: 7.5rem;">
                <c:out value="${ticket.description}"/>
              </div>
            </div>
            <div class="form-grp">
              <div class="form-label">Created</div>
              <div class="form-control form-ipt border-0">
                <fmt:formatDate
                value="${ticket.createdAt}"
                pattern="MMMM d, yyyy"
                />
              </div>
            </div>
            <div class="form-grp">
              <div class="form-label">Updated</div>
              <div class="form-control form-ipt border-0">
                <fmt:formatDate
                value="${ticket.updatedAt}"
                pattern="MMMM d, yyyy"
                />
              </div>
            </div>
					</div>
					<div style="width:24rem">
            <div class="form-grp">
              <div class="form-label">Status</div>
              <div class="form-control form-ipt border-0" id="key" style="height:2.2rem;">
                <c:out value="${ticket.status}"/>
              </div>
            </div>
            <div class="form-grp">
              <div class="form-label">Assignee</div>
              <div class="form-control form-ipt border-0">
                <c:out value="${ticket.assignee.firstName} ${ticket.assignee.lastName}"/>
              </div>
            </div>
            <div class="form-grp">
              <div class="form-label">Reporter</div>
              <div class="form-control form-ipt border-0">
                <c:out value="${ticket.poster.firstName} ${ticket.poster.lastName}"/>
              </div>
            </div>
					</div>
				</div>
				<div class="modal-footer pt-4 mt-4">
					<a class="btn btn-secondary" href="/fleaflickr/projects/${project.id}/tickets">View tickets</a>
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