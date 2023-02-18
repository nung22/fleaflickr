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
  <title>FleaFlickr | Log in</title>
</head>
<body>
  <div class="loader"></div>
  <div class="container d-flex flex-column align-items-center justify-content-center pt-4">
    <div class="rounded shadow text-light d-flex flex-column gap-4 align-items-center justify-content-center shadow" style="width: 24rem; background-color: #282c34;">
      <div class="text- bg-primary d-flex justify-content-center align-items-center gap-2 p-2 rounded-top" style="width: 24rem;">
        <img src="/assets/icons/bug.png" alt="Logo" width="35" height="35">
        <span class="h3 pt-2" style=" font-weight:bolder">FleaFlickr</span>
      </div>
      <h6 class="fw-bold mt-2">Log in to continue</h6>
      <div class="login-reg login">
        <form:form action="/login" method="post" modelAttribute="newLogin">
          <div class="errors">
            <h6 class="text-danger"><form:errors path="email" /></h6>
            <h6 class="text-danger"><form:errors path="password" /></h6>
          </div>
          <div class="d-flex flex-column align-items-center">
            <div class="form-group row mb-3">
              <form:label class="mb-1" path="email">Email</form:label>
              <form:input
                class="form-control text-light input bg-dark"
                type="email"
                path="email"
                placeholder="Enter your email"
                required="true"
              />
            </div>
            <div class="form-group row mb-3">
              <form:label class="mb-1" path="password">Password</form:label>
              <form:input
              id="pw"
              class="form-control text-light input bg-dark"
              type="password"
              path="password"
              placeholder="Enter password"
              required="true"
              />
            </div>
            <input class="form-control btn btn-primary mt-2 submit" type="submit" value="Log in"/>
          </div>
        </form:form>
      </div>
      <div class="d-flex align-items-center justify-content-center gap-2" style="border-top: 1px solid gray; font-size: .9rem; width: 19rem; height: 4rem;">
        <a class="text-decoration-none" style="color: #4b92fc" href="/"
        onmouseover="this.classList.remove('text-decoration-none')"
        onmouseout="this.classList.add('text-decoration-none')">
          Go back
        </a>
        <div class="fs-1 pb-4 text-secondary">.</div>
        <a class="text-decoration-none" style="color: #4b92fc" href="/fleaflickr/signup"
        onmouseover="this.classList.remove('text-decoration-none')"
        onmouseout="this.classList.add('text-decoration-none')">
        Create an account
      </a>
    </div>
  </div>
  <img id="password-hidden" class="btn password-visibility" src="/assets/icons/closed_eye.png" 
  onclick="revealPassword(this)" alt="password not visible">
  <img id="password-visible" class="btn password-visibility invisible" src="/assets/icons/open_eye.png" 
  onclick="hidePassword(this)" alt="password visible">
  </div>
  <script type="text/javascript" src="/js/app.js"></script>
  <script src="/webjars/jquery/jquery.min.js"></script>
  <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
<jsp:include page="./components/loader-animation.jsp"/>
</html>