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
  <title>FleaFlickr | Project Dashboard</title>
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
      <h2>Projects</h2>
      <a class="btn btn-primary" href="/fleaflickr/projects/new">+ Create Project</a>
    </div>
    <c:choose>
    <c:when test="${projectsOnTeam.size() > 0}">
      <div class="table-holder">
        <table class="table table-dark table-hover">
          <thead>
            <tr style="line-height: 2.3rem; color: #909294;" class="fs-5">
              <th class="ps-5">Name</th>
              <th>Key</th>
              <th>Due Date</th>
              <th>Lead</th>
              <th class="text-center">Action</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="oneProject" items="${projectsOnTeam}">
              <tr style="line-height: 2.7rem;" class="align-middle">
                <td class="ps-5">
                  <a class="text-decoration-none link" href="/fleaflickr/projects/${oneProject.id}/tickets"
                  onmouseover="this.classList.add('text-decoration-underline')"
                  onmouseout="this.classList.remove('text-decoration-underline')">
                    <c:out value="${oneProject.title}"
                  /></a>
                </td>
                <td>
                  <c:out value="${oneProject.title.substring(0,4).toUpperCase()}" />
                </td>
                <td>
                  <fmt:formatDate
                  value="${oneProject.dueDate}"
                  pattern="MMMM d, yyyy"
                  />
                </td>
                <td class="d-flex flex-row gap-2 align-items-center">
                  <div class="text-light text-center d-flex align-items-center justify-content-center me-1" style="background-color: rgb(59, 59, 203); border-radius: 50%; width:2.1rem; height:2.1rem; font-size: 1rem;">
                    <span><c:out value="${oneProject.leader.firstName.charAt(0)}${oneProject.leader.lastName.charAt(0)}"/></span>
                  </div>
                  <c:out value="${oneProject.leader.firstName} ${oneProject.leader.lastName}" />
                </td>
                <td class="text-center">
                  <c:choose>
                    <c:when
                      test="${oneProject.leader.id == user.id}">
                      <a class="rounded btn" style="padding: .3rem .5rem .5rem .5rem;" id="projectIcon"
                      href="/fleaflickr/projects/edit/${oneProject.id}"
                      onmouseover="this.classList.add('bg-dark')"
                      onclick="this.classList.remove('bg-dark')"
                      onmouseout="this.classList.remove('bg-dark')">
                        <img src="/assets/icons/gear.png" width="18" alt="gear">
                      </a>
                    </c:when>
                    <c:otherwise>
                      <a class="btn rounded" style="padding: .3rem;" id="projectIcon"
                      href="/leave/${user.id}/${oneProject.id}"
                      onmouseover="this.classList.add('bg-danger')"
                      onclick="this.classList.remove('bg-danger')"
                      onmouseout="this.classList.remove('bg-danger')">
                        <img src="/assets/icons/exit.png" width="24" alt="gear">
                      </a>
                    </c:otherwise>
                  </c:choose>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </c:when>
    <c:otherwise>
      <div class="text-center h4 text-secondary pt-5">
        <p>It looks like you don't have any projects yet.</p>
        <p>Try to join an 
          <a class="link text-decoration-none" href="/fleaflickr/projects/available" onmouseover="this.classList.add('text-decoration-underline')" 
          onmouseout="this.classList.remove('text-decoration-underline')"
          onclick="this.classList.remove('text-decoration-underline')">existing one</a> 
          or 
          <a class="link text-decoration-none" href="/fleaflickr/projects/new" onmouseover="this.classList.add('text-decoration-underline')" 
          onmouseout="this.classList.remove('text-decoration-underline')"
          onclick="this.classList.remove('text-decoration-underline')">create your own</a>!
        </p>
      </div>
    </c:otherwise>
    </c:choose>
  </div>
  <script type="text/javascript" src="/js/app.js"></script>
  <script src="/webjars/jquery/jquery.min.js"></script>
  <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
<jsp:include page="./components/loader-animation.jsp"/>
</html>