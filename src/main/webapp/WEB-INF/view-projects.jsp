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
  <meta charset="ISO-8859-1" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <jsp:include page="./components/font.jsp"/>
  <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
  <link rel="stylesheet" href="/css/style.css" />
  <title>Show Projects</title>
</head>
<body>
	<jsp:include page="./components/navbar.jsp">
    <jsp:param name="initials" value="${user.firstName.charAt(0)}${user.lastName.charAt(0)}"/>
    <jsp:param name="fullName" value="${user.firstName} ${user.lastName}"/>
    <jsp:param name="email" value="${user.email}"/>
    <jsp:param name="id" value="${user.id}"/>
	</jsp:include> 
  <div class="container">
    <div class="d-flex justify-content-between table-header mb-5">
      <h2>Your Projects</h2>
      <a class="btn btn-primary" href="/fleaflickr/projects/new">+ Create Project</a>
    </div>
    <div class="table-holder rounded">
      <table class="table table-dark table-hover">
        <thead>
          <tr style="line-height: 2.3rem; opacity: .5;" class="fs-5">
            <th class="ps-5">Name</th>
            <th>Key</th>
            <th>Due Date</th>
            <th>Lead</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="oneProject" items="${projectsOnTeam}">
            <tr style="line-height: 2.3rem;" class="align-middle">
              <td class="ps-5">
                <a
                  class="text-decoration-none" style="color: #4b92fc"
                  href="<c:url value='/fleaflickr/projects/${oneProject.getId()}'/>"
                onmouseover="this.classList.add('text-decoration-underline')" onmouseout="this.classList.remove('text-decoration-underline')">
                  <c:out value="${oneProject.getTitle()}"
                /></a>
              </td>
              <td>
                <c:out value="${oneProject.getTitle().substring(0,4).toUpperCase()}" />
              </td>
              <td>
                <fmt:formatDate
                value="${oneProject.getDueDate()}"
                pattern="MMMM d, yyyy"
                />
              </td>
              <td>
                <c:out value="${oneProject.getLeader().getFirstName()} ${oneProject.getLeader().getLastName()}" />
              </td>
              <td>
                <c:choose>
                  <c:when
                    test="${oneProject.getLeader().getId() == user.getId()}">
                    <a class="rounded btn" style="padding: .3rem .5rem .5rem .5rem;" id="projectIcon"
                      onmouseover="this.classList.add('bg-dark')" onmouseout="this.classList.remove('bg-dark')">
                      <img src="/assets/icons/gear.png" width="18" alt="gear">
                    </a>           
                  </c:when>
                  <c:otherwise>
                    <a class="text-decoration-none text-danger" href="<c:url value='/leave/${user.getId()}/${oneProject.getId()}'/>" on>
                    Leave Team</a>
                  </c:otherwise>
                </c:choose>
              </td>
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

<!-- href="<c:url value='/fleaflickr/projects/edit/${oneProject.getId()}'/>" -->
