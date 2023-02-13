<%-- <c:set value="${param.currentUsername}" var="currentUsername" /> --%>

<nav class="navbar navbar-expand-lg user-navbar">
    <div class="container-fluid site-width">
        <a class="navbar-brand text-dark" href="/">EasyBook</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="spacer"></div>
            <form class="d-flex input-group bg-light search" role="search">
                <input class="form-control search ps-3" type="search" placeholder="Search by Title, Author or ISBN" aria-label="Search">
                <button class="btn btn-outline-success search pe-3" type="submit">Search</button>
            </form>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item ms-5 text-center mt-1">
                    <c:if test="${currentUsername != null}">
	                <h6 class="greeting fw-bold text-decoration-underline">Hello, ${param.currentUsername}!</h6>
                    </c:if>
                    <a class="nav-link fs-5 fw-bold text-secondary" aria-current="page" onmouseover="addActive(this)" onmouseout="removeActive(this)" href="/account">Account</a>
                </li>
                <li class="nav-item ms-3">
                    <a class="nav-link" href="#"><img id="cart" src="./assets/icons/shopping_cart.png" alt="image of shopping cart"></a>
                </li>
<!--                 {% if session.is_admin == 1 %}
                <li class="nav-item ms-4 mt-2">
                    <a class="btn btn-warning btn-sm admin-tools fw-bold" aria-current="page" href="/admin_dashboard">Admin Tools</a>
                </li>
                {% endif %} -->
            </ul>
            <h1><c:out value="${param.currentUsername}"></c:out></h1>
        </div>
    </div>
</nav>

<div class="genres bg-dark">
	<div class="site-width">
	    <a href="/all_books" class="nav-link genre" onmouseover="addPill(this)" onmouseout="removePill(this)">ALL BOOKS</a>
	    <a href="/cookbooks" class="nav-link genre" onmouseover="addPill(this)" onmouseout="removePill(this)">COOKBOOKS</a>
	    <a href="/fantasy_scifi" class="nav-link genre" onmouseover="addPill(this)" onmouseout="removePill(this)">FANTASY & SCI-FI</a>
	    <a href="/horror genre" class="nav-link genre" onmouseover="addPill(this)" onmouseout="removePill(this)">HORROR</a>
	    <a href="/manga_graphic_novels" class="nav-link genre" onmouseover="addPill(this)" onmouseout="removePill(this)">MANGA & GRAPHIC NOVELS</a>
	    <a href="/mystery_crime" class="nav-link genre" onmouseover="addPill(this)" onmouseout="removePill(this)">MYSTERY & CRIME</a>
	</div>
</div>