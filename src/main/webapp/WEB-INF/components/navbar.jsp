<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="loader"></div>
<nav class="navbar sticky-top navbar-expand-lg bg-body-tertiary bg-primary shadow-lg mb-5 bg-body-tertiary px-3" style="height:4.3rem; padding: 0; z-index: 0;">
  <div class="container-fluid" >
    <a class="navbar-brand text-light d-flex align-items-center gap-2 px-2 rounded me-5" href="/fleaflickr/projects" onmouseover="addPill(this)" onmouseout="removePill(this)">
      <img src="/assets/icons/bug.png" alt="Logo" width="35" height="35">
      <span class="h4 pt-2" style=" font-weight:bolder">FleaFlickr</span>
    </a>
    <c:choose>
      <c:when test="${user != null}">
        <ul class="navbar-nav me-auto mt-1 mb-lg-0">
          <li class="nav-item dropdown">
            <a onmouseover="addPill(this)" onmouseout="removePill(this)"
            class="me-2 rounded text-light nav-link dropdown-toggle" href="" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Projects
            </a>
            <ul class="dropdown-menu dropdown-menu-dark shadow" style="background-color: #3384ff;">
              <li><a onmouseover="addPill(this)" onmouseout="removePill(this)"
                class="me-2 rounded text-light dropdown-item" href="/fleaflickr/projects/available">Project Hub</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a onmouseover="addPill(this)" onmouseout="removePill(this)"
                class="me-2 rounded text-light dropdown-item" href="/fleaflickr/projects">Your Projects</a></li>
            </ul>
          </li>
        </ul>
        <div class="d-flex align-items-center justify-content-center ms-4"
        style="border-radius: 50%; width: 3.3rem; height:3.3rem" onmouseover="addPill(this)" onmouseout="removePill(this)">
          <button type="button" class="text-light text-center d-flex align-items-center justify-content-center btn" style="background-color: rgb(59, 59, 203); border-radius: 50%; width:2.3rem; height:2.3rem"
          data-bs-toggle="collapse" data-bs-target="#userSettings" aria-expanded="false" aria-controls="userSettings">
            <span style="margin-right: -.1rem;">${param.initials}</span>
          </button>
        </div>
      </c:when>
      <c:otherwise>
        <div class="d-flex gap-3">
          <a class="btn btn-warning sign-up" href="/fleaflickr/signup">Sign up</a>
          <a class="btn btn-primary fw-bold" href="/fleaflickr/login">Log in</a>
        </div>
      </c:otherwise>
    </c:choose>
  </div>
</nav>
<div>
  <div class="collapse collapse-horizontal position-absolute top-0 end-0" id="userSettings" style="margin-right: 2rem; margin-top: 4rem; z-index: 1;">
    <div class="card card-body text-light shadow-lg d-flex flex-column gap-1" style="width: 300px; background-color: #3384ff;">
      <h6 class="fw-bold">ACCOUNT</h6>
      <div class="d-flex gap-3">
        <div class="text-light text-center d-flex align-items-center justify-content-center" style="background-color: rgb(59, 59, 203); border-radius: 50%; width:2.3rem; height:2.3rem">
          <span style="margin-right: -.1rem;">${param.initials}</span>
        </div>
        <div>
          <h6>${param.fullName}</h6>
          <p style="font-size: .75rem; margin-top: -5px; opacity: .8;">${param.email}</p>
        </div>
      </div>
      <div class="d-flex flex-column gap-1 py-1" style="border: 2px solid snow; border-left-width: 0; border-right-width: 0;">
        <a class="btn text-light" href="#" onmouseover="addUserInfoPill(this)" onmouseout="removeUserInfoPill(this)">Profile</a>
        <a class="btn text-light" href="#" onmouseover="addUserInfoPill(this)" onmouseout="removeUserInfoPill(this)">Personal Settings</a>
      </div>
      <a class="btn text-light" href="/fleaflickr/logout-page" onmouseover="addUserInfoPill(this)" onmouseout="removeUserInfoPill(this)">Logout</a>
    </div>
  </div>
</div>