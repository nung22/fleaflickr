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
  <title>FleaFlickr | Logout</title>
</head>
<body>
  <div class="loader"></div>
  <div class="container d-flex flex-column align-items-center justify-content-center">
    <div class="rounded shadow text-light d-flex flex-column gap-4 pb-4 align-items-center justify-content-center shadow" style="width: 24rem; background-color: #282c34;">
      <div class="text- bg-primary d-flex justify-content-center align-items-center gap-2 p-2 rounded-top" style="width: 24rem;">
        <img src="/assets/icons/bug.png" alt="Logo" width="35" height="35">
        <span class="h3 pt-2" style=" font-weight:bolder">FleaFlickr</span>
      </div>
      <h6 class="mt-5 fw-bold">Log out of your FleaFlickr account</h6>
      <div class="d-flex gap-3 align-items-center" style="margin-left: -5rem;">
        <img src="/assets/icons/profile_pic.png" style="background-color: rgb(221, 221, 223); border-radius: 50%; width:4.5rem; height:4.5rem" alt="stock profile pic">
        <div class="pt-2">
          <h5 class="fw-bold"><c:out value="${user.firstName} ${user.lastName}"/></h5>
          <p style="font-size: .75rem; margin-top: -5px; opacity: .8;">
            <c:out value="${user.email}"/></p>
        </div>
      </div>
      <div class="d-flex flex-column justify-content-center align-items-center">
        <a class="btn btn-primary mb-2" href="/logout" style="width: 19rem;">Log out</a>
        <div class="py-1 mt-4 d-flex align-items-center justify-content-center gap-2" style="border-top: 1px solid gray; font-size: .9rem; width: 19rem;" href="">
          <a class="text-decoration-none" style="color: #4b92fc" href="/fleaflickr/projects"
          onmouseover="this.classList.remove('text-decoration-none')"
          onmouseout="this.classList.add('text-decoration-none')">
            Go back
          </a>
          <div class="fs-1 pb-4 text-secondary">.</div>
          <a class="text-decoration-none" style="color: #4b92fc" href="#"
          onmouseover="this.classList.remove('text-decoration-none')"
          onmouseout="this.classList.add('text-decoration-none')">
            Log in with another account
          </a>
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

<!-- href="<c:url value='/projects/edit/${oneProject.getId()}'/>" -->
