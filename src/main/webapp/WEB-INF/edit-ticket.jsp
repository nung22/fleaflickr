<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<style> .loader {
	position: fixed;
	background-color: #aaaaaa;
	opacity: 1;
	height: 100%;
	width: 100%;
	top: 0;
	left: 0;
	z-index: 10;
}
</style>
<head>
	<meta charset="ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans"/>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/css/style.css"/>
	<title>FleaFlickr | Edit Ticket</title>
</head>
<body>
	<div class="loader"></div>
	<div class="container pt-5">
    <div class="px-5 pt-5 pb-2 rounded mt-2 shadow" style="width:970px; background-color: #282c34;">
			<h1 class="text-light mb-4">Update ticket details</h1>
			<form:form action="/fleaflickr/projects/${project.id}/tickets/${ticket.id}/edit" method="put" modelAttribute="ticket">
        <div class="errors">
          <h6 class="text-danger"><form:errors path="title"/></h6>
          <h6 class="text-danger"><form:errors path="issueType"/></h6>
          <h6 class="text-danger"><form:errors path="priority"/></h6>
          <h6 class="text-danger"><form:errors path="status"/></h6>
          <h6 class="text-danger"><form:errors path="description"/></h6>
        </div>
				<form:hidden path="id" value="${ticket.id}"/>
				<form:hidden path="usersWhoCommented" value=""/>
				<form:hidden path="poster" value="${ticket.poster.id}"/>
				<form:hidden path="project" value="${project.id}"/>
				<div class="d-flex justify-content-between">
					<div style="width:24rem">
						<div class="form-grp">
							<form:label class="fw-bold form-label" path="title">Summary</form:label>
							<form:input class="form-control" style="background-color:#212426; color: snow;" path="title" required="true"/>
						</div>
						<div class="form-grp">
							<form:label class="fw-bold form-label" path="description">Description</form:label>
							<form:textarea class="form-control" style="background-color:#212426; color: snow;" path="description" rows="8" 
							placeholder="Add a description..."/>
						</div>
					</div>
					<div style="width:24rem">
						<div class="form-grp">
							<form:label class="fw-bold form-label" path="issueType">Issue type</form:label>       
							<form:select class="form-select form-ipt" style="background-color:#212426; color: snow;" path="issueType">
								<option value="Bug" 
								<c:if test="${'Bug' == ticket.issueType}">selected</c:if>>Bug</option>
								<option value="Improvement" 
								<c:if test="${'Improvement' == ticket.issueType}">selected</c:if>>Improvement</option>
								<option value="Task" 
								<c:if test="${'Task' == ticket.issueType}">selected</c:if>>Task</option>
								<option value="New Feature" 
								<c:if test="${'New Feature' == ticket.issueType}">selected</c:if>>New Feature</option>
							</form:select>
						</div>
						<div class="form-grp">
							<form:label class="fw-bold form-label" path="status">Status</form:label>
							<form:select class="form-select form-ipt" style="background-color:#212426; color: snow;" path="status">
								<option value="To Do"
								<c:if test="${'To Do' == ticket.status}">selected</c:if>>To Do</option>
								<option value="In Progress"
								<c:if test="${'In Progress' == ticket.status}">selected</c:if>>In Progress</option>
								<option value="In Review"
								<c:if test="${'In Review' == ticket.status}">selected</c:if>>In Review</option>
								<option value="Done"
								<c:if test="${'Done' == ticket.status}">selected</c:if>>Done</option>
							</form:select>
						</div>
						<div class="form-grp">
							<form:label class="fw-bold form-label" path="priority">Priority</form:label>       
							<form:select class="form-select form-ipt" style="background-color:#212426; color: snow;" path="priority">
								<option value="Medium"
								<c:if test="${'Medium' == ticket.priority}">selected</c:if>>Medium</option>
								<option value="Highest"
								<c:if test="${'Highest' == ticket.priority}">selected</c:if>>Highest</option>
								<option value="High"
								<c:if test="${'High' == ticket.priority}">selected</c:if>>High</option>
								<option value="Low"
								<c:if test="${'Low' == ticket.priority}">selected</c:if>>Low</option>
								<option value="Lowest"
								<c:if test="${'Lowest' == ticket.priority}">selected</c:if>>Lowest</option>
							</form:select>
						</div>
						<div class="form-grp">
							<form:label class="fw-bold form-label" path="assignee">Assignee</form:label>       
							<form:select class="form-select form-ipt" style="background-color:#212426; color: snow;" path="assignee">
								<c:forEach var="oneUser" items="${allUsers}">
									<option value="${oneUser.id}"
									<c:if test="${oneUser == ticket.assignee}">selected</c:if>>
										<c:out value="${oneUser.firstName} ${oneUser.lastName}"></c:out></option>
								</c:forEach>
							</form:select>
						</div>
					</div>
				</div>
				<div class="modal-footer pt-4 mt-4 d-flex justify-content-between">
					<c:if test="${project.leader.id == user.id || ticket.poster.id == user.id}">
						<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
							Delete ticket
						</button>
						<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered text-white">
								<div class="modal-content"  style="background-color: #212529; border-color:rgb(90, 90, 90); border-width: 1px;">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="staticBackdropLabel">Delete ticket</h1>
										<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body fs-6" style="opacity: .6">
										<p>You are about to permanently erase <strong class="text-decoration-underline"><c:out value="${project.title.substring(0,4).toUpperCase()}-${ticket.id}"/></strong>. </p>
										<p>Once this action is taken, it cannot be undone. If you are certain about your decision, please proceed.</p>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
										<a class="btn btn-danger" href="/fleaflickr/projects/${project.id}/tickets/${ticket.id}/delete">Delete</a>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					<div class="d-flex gap-2">
						<a class="btn btn-dark" href="/fleaflickr/projects/${project.id}/tickets">Cancel</a>
						<input class="btn btn-primary" type="submit" value="Update ticket" style="width:8.5rem"/>
					</div>
				</div>
			</form:form>
		</div>
	</div>
	<script type="text/javascript" src="/js/app.js"></script>
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
<style>
  .loader {
    -webkit-animation: load-out 1s;
    animation: load-out 1s;
    -webkit-animation-fill-mode: forwards;
    animation-fill-mode: forwards;
  }
  
  @-webkit-keyframes load-out {
    from {
      top: 0;
      opacity: 1;
    }
    to {
      top: 100%;
      opacity: 0;
    }
  }
  
  @keyframes load-out {
    from {
      top: 0;
      opacity: 1;
    }
    to {
      top: 100%;
      opacity: 0;
      }
  }
</style>
</html>