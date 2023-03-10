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
	<title>FleaFlickr | Tickets</title>
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
				<li class="breadcrumb-item active" aria-current="page">Tickets</li>
			</ol>
		</nav>
		<div class="header mb-3">
			<h2 class="fw-bold">Tickets</h2>
			<div class="d-flex gap-2">
				<a class="btn btn-dark dark-btn" href="/fleaflickr/projects/${project.id}">Project Details</a>
				<!-- Button trigger modal -->
				<c:if test="${user != null}">
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
						+ Create Ticket
					</button>
				</c:if>
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered text-white">
				<div class="modal-content p-3" style="background-color: #212529; border-color:rgb(90, 90, 90); border-width: 1px;">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="staticBackdropLabel">Create ticket</h1>
						<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<form:form class="ticket-form" action="/fleaflickr/projects/${project.id}/tickets" method="post" modelAttribute="ticket">
						<div class="modal-body">
							<div class="errors">
								<h6 class="text-danger"><form:errors path="title"/></h6>
								<h6 class="text-danger"><form:errors path="issueType"/></h6>
								<h6 class="text-danger"><form:errors path="priority"/></h6>
								<h6 class="text-danger"><form:errors path="status"/></h6>
								<h6 class="text-danger"><form:errors path="description"/></h6>
							</div>
							<form:hidden path="usersWhoCommented" value=""/>
							<form:hidden path="project" value="${project.id}"/>
							<form:hidden path="poster" value="${user.id}"/>
							<div class="form-grp">
								<form:label class="form-label" path="issueType">Issue type <span class="text-danger">*</span></form:label>
								<form:select class="form-select form-ipt" style="background-color:#282b2d; color: snow;" path="issueType">
									<option value="Bug" selected>Bug</option>
									<option value="Improvement">Improvement</option>
									<option value="Task">Task</option>
									<option value="New Feature">New Feature</option>
								</form:select>
							</div>
							<div class="form-grp">
								<form:label class="form-label" path="status">Status</form:label>
								<form:select class="form-select form-ipt" style="background-color:#282b2d; color: snow;" path="status">
									<option value="To Do" selected>To Do</option>
									<option value="In Progress">In Progress</option>
									<option value="In Review">In Review</option>
									<option value="Done">Done</option>
								</form:select>
							</div>
							<div class="form-grp">
								<form:label class="form-label" path="title">Summary <span class="text-danger">*</span></form:label>
								<form:input class="form-control form-ipt" style="background-color:#282b2d; color: snow;" placeholder="Type here" path="title" required="true"/>
							</div>
							<div class="form-grp">
								<form:label class="form-label" path="description">Description</form:label>
								<form:textarea class="form-control form-ipt" style="background-color:#282b2d; color: snow;" path="description" rows="3" placeholder="Add a description..."/>
							</div>
							<div class="form-grp">
								<form:label class="form-label" path="priority">Priority</form:label>
								<form:select class="form-select form-ipt" style="background-color:#282b2d; color: snow;" path="priority">
									<option value="Medium" selected>Medium</option>
									<option value="Highest">Highest</option>
									<option value="High">High</option>
									<option value="Low">Low</option>
									<option value="Lowest">Lowest</option>
								</form:select>
							</div>
							<div class="form-grp">
								<form:label class="form-label" path="assignee">Assignee</form:label>
								<form:select class="form-select form-ipt" style="background-color:#282b2d; color: snow;" path="assignee">
									<option value="${user.id}" selected>Automatic</option>
									<c:forEach var="oneUser" items="${allUsers}">
										<option value="${oneUser.id}">
											<c:out value="${oneUser.firstName} ${oneUser.lastName}"></c:out></option>
									</c:forEach>
								</form:select>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
							<input class="btn btn-primary submit" type="submit" value="Submit"/>
						</div>
					</form:form>
				</div>
			</div>
		</div>

    <div class="table-holder rounded">
			<table class="table table-dark table-hover">
				<thead class="m-10 table-header">
					<tr style="line-height: 2.3rem; color: #909294;" class="fs-6">
						<th class="ps-3" scope="col">Type</th>
						<th scope="col">Key</th>
						<th scope="col">Summary</th>
						<th scope="col">Priority</th>
						<th scope="col">Status</th>
						<th scope="col">Assignee</th>
					</tr>
				</thead>
				<tbody style="font-size: .9rem;">
				<c:forEach var="oneTicket" items="${tickets}" varStatus="status">
					<c:set var="reverseIndex" value="${tickets.size() - status.index - 1}" />
					<tr style="line-height: 2.3rem;" class="align-middle">
						<td class="ps-3">
							<c:if test="${tickets[reverseIndex].issueType == 'Bug'}">
								<div class="tool-tip rounded text-center issue-type" style="background-color: #aa372c;">
									<span>BUG</span>
									<!-- <p class="tooltip-text">Bug</p> -->
								</div>
							</c:if>
							<c:if test="${tickets[reverseIndex].issueType == 'Improvement'}">
								<div class="tool-tip rounded text-center issue-type" style="background-color: #427b28;">
									<span>IMPR</span>
									<!-- <p class="tooltip-text">Improvement</p> -->
								</div>
							</c:if>
							<c:if test="${tickets[reverseIndex].issueType == 'Task'}">
								<div class="tool-tip rounded text-center issue-type" style="background-color: #2f6c93;">
									<span>TASK</span>
									<!-- <p class="tooltip-text">Task</p> -->
								</div>
							</c:if>
							<c:if test="${tickets[reverseIndex].issueType == 'New Feature'}">
								<div class="tool-tip rounded text-center issue-type" style="background-color: #904ee2;">
									<span>NEW</span>
									<!-- <p class="tooltip-text">New Feature</p> -->
								</div>
							</c:if>
						</td>
						<td class="ps-2"><c:out value="${tickets[reverseIndex].project.title.substring(0,4).toUpperCase()}-${tickets[reverseIndex].id}"></c:out></td>
						<td class="ps-2">
							<a class="text-decoration-none" style="color: #4b92fc"
							href="<c:url value='/fleaflickr/projects/${project.id}/tickets/${tickets[reverseIndex].id}'/>"
							onmouseover="this.classList.add('text-decoration-underline')" onmouseout="this.classList.remove('text-decoration-underline')">
							<c:out value="${tickets[reverseIndex].title}"></c:out>
						</a>
						</td>
						<td class="px-4">
							<c:if test="${tickets[reverseIndex].priority == 'Highest'}">
								<img src="/assets/icons/highest.png" width="20" alt="highest priority">
							</c:if>
							<c:if test="${tickets[reverseIndex].priority == 'High'}">
								<img src="/assets/icons/high.png" width="20" alt="high priority">
							</c:if>
							<c:if test="${tickets[reverseIndex].priority == 'Medium'}">
								<img src="/assets/icons/medium.png" width="20" alt="medium priority">
							</c:if>
							<c:if test="${tickets[reverseIndex].priority == 'Low'}">
								<img src="/assets/icons/low.png" width="20" alt="low priority">
							</c:if>
							<c:if test="${tickets[reverseIndex].priority == 'Lowest'}">
								<img src="/assets/icons/lowest.png" width="20" alt="lowest priority">
							</c:if>
						</td>
						<td>
							<c:if test="${tickets[reverseIndex].status == 'To Do'}">
								<div class="tool-tip rounded text-center status" style="background-color: #6565657a;">
									<span>TO DO</span>
									<!-- <p class="tooltip-text">Bug</p> -->
								</div>
							</c:if>
							<c:if test="${tickets[reverseIndex].status == 'In Progress'}">
								<div class="tool-tip rounded text-center status" style="background-color: #3a47ff81;">
									<span>IN PROGRESS</span>
									<!-- <p class="tooltip-text">Improvement</p> -->
								</div>
							</c:if>
							<c:if test="${tickets[reverseIndex].status == 'In Review'}">
								<div class="tool-tip rounded text-center status" style="background-color: #c3bd007c;">
									<span>IN REVIEW</span>
									<!-- <p class="tooltip-text">Task</p> -->
								</div>
							</c:if>
							<c:if test="${tickets[reverseIndex].status == 'Done'}">
								<div class="tool-tip rounded text-center status" style="background-color: #06860a50;">
									<span>DONE</span>
									<!-- <p class="tooltip-text">New Feature</p> -->
								</div>
							</c:if>
						</td>
						<td class="ps-2"><c:out value="${tickets[reverseIndex].assignee.firstName} ${tickets[reverseIndex].assignee.lastName.charAt(0)}"></c:out>.</td>
						<!-- <td class="ps-2"><c:out value="${tickets[reverseIndex].poster.firstName} ${tickets[reverseIndex].poster.lastName.charAt(0)}"></c:out>.</td> -->
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
<jsp:include page="./components/loader-animation.jsp"/>
</html>