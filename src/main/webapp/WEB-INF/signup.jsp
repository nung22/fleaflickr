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
  <title>FleaFlickr | Sign up</title>
</head>
<body>
  <div class="loader"></div>
  <div class="container d-flex flex-column align-items-center justify-content-center pt-4">
    <div class="rounded shadow text-light d-flex flex-column gap-1 align-items-center justify-content-center shadow" style="width: 24rem; background-color: #282c34;">
      <div class="text- bg-primary d-flex justify-content-center align-items-center gap-2 p-2 rounded-top" style="width: 24rem;">
        <img src="/assets/icons/bug.png" alt="Logo" width="35" height="35">
        <span class="h3 pt-2" style=" font-weight:bolder">FleaFlickr</span>
      </div>
      <h6 class="fw-bold mt-2">Sign up to continue</h6>
      <div class="login-reg reg">
        <form:form action="/register" method="post" modelAttribute="newUser">
          <!-- Error Messages -->
          <div class="errors mb-2">
            <span class="error-msg text-danger"><form:errors path="firstName" /></span>
            <span class="error-msg text-danger"><form:errors path="lastName" /></span>
            <span class="error-msg text-danger"><form:errors path="email" /></span>
            <span class="error-msg text-danger"><form:errors path="password" /></span>
            <span class="error-msg text-danger"><form:errors path="confirm" /></span>
          </div>
          <!-- Form Input -->
          <div class="d-flex flex-column align-items-center">
            <div class="form-group row mb-2">
              <form:label class="text-light mb-1" path="firstName">First Name</form:label>
              <form:input class="input form-control text-light bg-dark" path="firstName"/>
            </div>
            <div class="form-group row mb-2">
              <form:label class="text-light mb-1" path="lastName">Last Name</form:label>
              <form:input class="input form-control text-light bg-dark" path="lastName"/>
            </div>
            <div class="form-group row mb-2">
              <form:label class="text-light mb-1" path="email">Email</form:label>
              <form:input class="input form-control text-light bg-dark" type="email" path="email" placeholder="name@example.com"/>
            </div>
            <div class="form-group row mb-2">
              <form:label class="text-light mb-1" path="password">Password</form:label>
              <form:input class="input form-control text-light bg-dark" type="password" path="password"
                aria-describedby="passwordHelpBlock"/>
              <div id="passwordHelpBlock" class="form-text">
                Your password must be at least 8 characters long.
              </div>
            </div>
            <div class="form-group row mb-2">
              <form:label class="text-light mb-1" path="confirm">Confirm Password</form:label>
              <form:input class="input form-control text-light bg-dark" type="password" path="confirm" placeholder="Enter password again"/>
            </div>
            <input class="form-control btn btn-primary submit mt-2" type="submit" value="Create account"/>
          </div>
        </form:form>
      </div>
      <div class="d-flex align-items-center justify-content-center gap-2 mt-3" style="border-top: 1px solid gray; font-size: .9rem; width: 19rem; height: 4rem">
        <a class="text-decoration-none" style="color: #4b92fc" href="/"
        onmouseover="this.classList.remove('text-decoration-none')"
        onmouseout="this.classList.add('text-decoration-none')">
          Go back
        </a>
        <div class="fs-1 pb-4 text-secondary">.</div>
        <a class="text-decoration-none" style="color: #4b92fc" href="/fleaflickr/login"
        onmouseover="this.classList.remove('text-decoration-none')"
        onmouseout="this.classList.add('text-decoration-none')">
          Log in to existing account
        </a>
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
