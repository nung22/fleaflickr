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
	<title>Edit Project</title>
</head>
<body>
	<div class="loader"></div>
	<div class="container d-flex justify-content-center pt-5">
		<div class="px-5 pt-5 pb-2 rounded shadow mt-5" style="width:970px; background-color: #282c34;">
			<h1 class="text-light mb-4">Update project details</h1>
			<form:form action="/fleaflickr/projects/edit/${project.id}" method="put" modelAttribute="project">
				<div class="errors create-errors">
					<h6 class="text-danger"><form:errors path="title"/></h6>
					<h6 class="text-danger"><form:errors path="description"/></h6>
					<h6 class="text-danger"><form:errors path="dueDate"/></h6>
				</div>
				<form:hidden path="leader" value="${user.getId()}"/>
				<div class="d-flex justify-content-between">
					<div style="width:24rem">
						<div class="form-grp">
							<form:label class="form-label" path="title">Name</form:label>
							<form:input class="form-control" style="background-color:#212426; color: snow;" path="title" required="true"
							oninput="document.getElementById('key').value = this.value.substring(0,4).toUpperCase() "/>
						</div>
						<div class="form-grp">
							<form:label class="form-label" path="" aria-describedby="keyHelpBlock">Key <span style="font-size: medium; opacity: .5;">(auto-generated)</span></form:label>
							<form:input path="" class="form-control" id="key" disabled="true" style="background-color:#212426; color: snow; height:2.4rem; border-width: 0;" value="${project.title.substring(0,4).toUpperCase()}"/>
							<div id="keyHelpBlock" class="form-text">
								Created from first 4 characters of project name.
							</div>
						</div>
					</div>
					<div style="width:24rem">
						<div class="form-grp">
							<form:label class="form-label" path="description">Project Description</form:label>
							<form:textarea class="form-control" style="background-color:#212426; color: snow;" path="description" rows="3" required="true"/>
						</div>
						<div class="form-grp">
							<form:label class="form-label" path="dueDate">Due Date</form:label>
							<form:input class="form-control" style="background-color:#212426; color: snow;" path="dueDate" type="date" required="true"/>
						</div>
					</div>
				</div>
				<div class="modal-footer pt-4 mt-4 d-flex justify-content-between">
					<c:if test="${project.leader.id == user.id}">
						<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
							Delete project
						</button>
						<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered text-white">
								<div class="modal-content"  style="background-color: #212529; border-color:rgb(90, 90, 90); border-width: 1px;">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="staticBackdropLabel">Delete project</h1>
										<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body fs-6" style="opacity: .6">
										<p>You are about to permanently erase <strong class="text-decoration-underline"><c:out value="${project.title}"/></strong>. </p>
										<p>Once this action is taken, it cannot be undone. If you are certain about your decision, please proceed.</p>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
										<a class="btn btn-danger" href="/fleaflickr/projects/${project.id}/delete">Delete</a>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					<div>
						<a class="btn btn-dark" href="/fleaflickr/projects">Cancel</a>
						<input class="btn btn-primary ms-2" type="submit" value="Update project"/>
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