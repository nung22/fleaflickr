<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="loader"></div>
<nav class="navbar sticky-top navbar-expand-lg bg-body-tertiary bg-primary shadow-lg mb-5 bg-body-tertiary px-3" style="height:4.3rem; padding: 0; z-index: 0;">
  <div class="container-fluid" >
    <a class="navbar-brand text-light d-flex align-items-center gap-2 px-2 rounded me-5" href="/projects" onmouseover="addPill(this)" onmouseout="removePill(this)">
      <img src="/assets/icons/bug.png" alt="Logo" width="35" height="35">
      <span class="h4 pt-2" style=" font-weight:bolder">FleaFlickr</span>
    </a>
    <c:if test="${param.initials.length() == 2}">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mt-1 mb-lg-0">
            <li class="nav-item">
              <a onmouseover="addPill(this)" onmouseout="removePill(this)"
              class="me-2 rounded text-light nav-link active" aria-current="page" href="#">Home</a>
            </li>
            <li class="nav-item">
              <a onmouseover="addPill(this)" onmouseout="removePill(this)"
              class="me-2 rounded text-light nav-link" href="#">Link</a>
            </li>
            <li class="nav-item dropdown">
              <a onmouseover="addPill(this)" onmouseout="removePill(this)"
              class="me-2 rounded text-light nav-link dropdown-toggle" href="" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Dropdown
              </a>
              <ul class="dropdown-menu dropdown-menu-dark shadow" style="background-color: #3384ff;">
                <li><a onmouseover="addPill(this)" onmouseout="removePill(this)"
                  class="me-2 rounded text-light dropdown-item" href="#">Action</a></li>
                <li><a onmouseover="addPill(this)" onmouseout="removePill(this)"
                  class="me-2 rounded text-light dropdown-item" href="#">Another action</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a onmouseover="addPill(this)" onmouseout="removePill(this)"
                  class="me-2 rounded text-light dropdown-item" href="#">Something else here</a></li>
              </ul>
            </li>
          </ul>
          <!-- <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
          </form> -->
          <div class="d-flex align-items-center justify-content-center ms-4"
          style="border-radius: 50%; width: 3.3rem; height:3.3rem" onmouseover="addPill(this)" onmouseout="removePill(this)">
            <button type="button" class="text-light text-center d-flex align-items-center justify-content-center btn" style="background-color: rgb(36, 36, 181); border-radius: 50%; width:2.3rem; height:2.3rem"
            data-bs-toggle="collapse" data-bs-target="#userSettings" aria-expanded="false" aria-controls="userSettings">
              <span>${param.initials} </span>
            </button>
          </div>
        </div>
    </c:if>
  </div>
</nav>
<div>
  <div class="collapse collapse-horizontal position-absolute top-0 end-0" id="userSettings" style="margin-right: 2rem; margin-top: 4rem; z-index: 1;">
    <div class="card card-body text-light shadow-lg d-flex flex-column gap-1" style="width: 300px; background-color: #3384ff;">
      <h6 class="fw-bold">ACCOUNT</h6>
      <div class="d-flex gap-3">
        <div class="text-light text-center d-flex align-items-center justify-content-center" style="background-color: rgb(36, 36, 181); border-radius: 50%; width:2.3rem; height:2.3rem">
          <span>${param.initials} </span>
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
      <a class="btn text-light" href="/logout" onmouseover="addUserInfoPill(this)" onmouseout="removeUserInfoPill(this)">Logout</a>
    </div>
  </div>
</div>