<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<div%@ page isErrorPage="true" %>
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
	<title>Create Tickets</title>
</head>
<body>
	<jsp:include page="./components/navbar.jsp"/> 
	<div class="container">
		<div class="header">
			<div>
				<h1 class="mt-4 text-light"><span class="text-primary">Project:</span> 
				<c:out value="${project.getTitle()}"></c:out></h1>
				<h5 class=""><span class="text-warning">Project Lead: </span>
				<c:out value="${project.getLeader().getFirstName()}"></c:out></h5>
			</div>
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				Create Ticket
			</button>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered text-white">
				<div class="modal-content p-3" style="background-color: #212529; border-color:rgb(90, 90, 90); border-width: 1px;">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="staticBackdropLabel">Create ticket</h1>
						<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<form:form class="ticket-form" action="/projects/${project.getId()}/tickets" method="post" modelAttribute="ticket">
						<div class="modal-body">
							<div class="errors">
								<h6 class="text-danger"><form:errors path="title"/></h6>
								<h6 class="text-danger"><form:errors path="issueType"/></h6>
								<h6 class="text-danger"><form:errors path="priority"/></h6>
								<h6 class="text-danger"><form:errors path="status"/></h6>
								<h6 class="text-danger"><form:errors path="description"/></h6>
							</div>
							<form:hidden path="project" value="${project.getId()}"/>
							<form:hidden path="poster" value="${user.getId()}"/>
							<div class="form-grp">
								<form:label class="form-label" path="issueType">Issue type <span class="text-danger">*</span></form:label>       
								<form:select class="form-control form-ipt" style="background-color:#282b2d; color: snow;" path="issueType">
									<option value="Bug" selected>Bug</option>
									<option value="Improvement">Improvement</option>
									<option value="Task">Task</option>
									<option value="New Feature">New Feature</option>
								</form:select>
							</div>
							<div class="form-grp">
								<form:label class="form-label" path="status">Status</form:label>
								<form:select class="form-control form-ipt" style="background-color:#282b2d; color: snow;" path="status">
									<option value="To Do" selected>To Do</option>
									<option value="In Progress">In Progress</option>
									<option value="In Review">In Review</option>
									<option value="Done">Done</option>
								</form:select>
							</div>
							<div class="form-grp">
								<form:label class="form-label" path="title">Summary <span class="text-danger">*</span></form:label>       
								<form:input class="form-control form-ipt" style="background-color:#282b2d; color: snow;" path="title" required="true"/>
							</div>
							<div class="form-grp">
								<form:label class="form-label" path="description">Description</form:label>       
								<form:textarea class="form-control form-ipt" style="background-color:#282b2d; color: snow;" path="description" rows="3" placeholder="Type here"/>
							</div>
							<div class="form-grp">
								<form:label class="form-label" path="priority">Priority</form:label>       
								<form:select class="form-control form-ipt" style="background-color:#282b2d; color: snow;" path="priority">
									<option value="Medium" selected>Medium</option>
									<option value="Highest">Highest</option>
									<option value="High">High</option>
									<option value="Low">Low</option>
									<option value="Lowest">Lowest</option>
								</form:select>
							</div>
							<div class="form-grp">
								<form:label class="form-label" path="assignee">Assignee</form:label>       
								<form:select class="form-control form-ipt" style="background-color:#282b2d; color: snow;" path="assignee">
									<option value="${user.getId()}" selected>Automatic</option>
									<c:forEach var="oneUser" items="${allUsers}">
										<option value="${oneUser.getId()}">
											<c:out value="${oneUser.getFirstName()} ${oneUser.getLastName()}"></c:out></option>
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

		<table class="table table-hover">
			<thead class="m-10 table-header">
				<tr class="h5">
					<th scope="col">Type</th>
					<th scope="col">Key</th>
					<th scope="col">Description</th>
					<th scope="col">Assignee</th>
					<th scope="col">Poster</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="oneTicket" items="${tickets}">
				<tr>
					<!-- <span class="">
						Added by <c:out value="${oneTicket.poster.firstName}"></c:out> 
						at <fmt:formatDate value="${oneTicket.getCreatedAt()}" pattern="h:mm aa 'on' MMM d, yyyy"/>	
					</span>
					<c:if test="${oneTicket.poster.id == user.id || user.id == project.leader.id}">
						<a class="btn-close close-ticket" href="/projects/${project.id}/tickets/${oneTicket.id}/delete"></a>
					</c:if> -->
					<td class="ps-2"><c:out value="${oneTicket.issueType}"></c:out></td>
					<td class="ps-2"><c:out value="${oneTicket.project.title.substring(0,4).toUpperCase()}-${oneTicket.id}"></c:out></td>
					<td class="ps-2"><c:out value="${oneTicket.title}"></c:out></td>
					<td class="ps-2"><c:out value="${oneTicket.assignee.firstName} ${oneTicket.assignee.lastName}"></c:out></td>
					<td class="ps-2"><c:out value="${oneTicket.poster.firstName} ${oneTicket.poster.lastName}"></c:out></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<script type="text/javascript" src="/js/app.js"></script>
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
<jsp:include page="./components/loader-animation.jsp"/>
</html>