<%@ page language="java" contentType="text/html; charset ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Libre+Baskerville'>
	<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Figtree'>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/css/style.css"/>
	<title>Home | EasyBook</title>
</head>
<body>
	<jsp:include page="userNavbar.jsp">
		<jsp:param name="currentUsername" value="${currentUser.username}" />
	</jsp:include>
	<div class="home">
    <div id="carouselExampleCaptions" class="carousel slide carousel-fade home-carousel mt-4" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="10000">
                <img src="./assets/carousel/background.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block text-dark block-1">
                    <h5 class="first-slide">Your #1 Source For<br>Renting Riveting<br>Reads</h5>
                    <p class="first-slide">Some representative placeholder content for the first slide.</p>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="8000">
                <img src="./assets/carousel/book_stack.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block text-dark block-2">
                    <h5 class="second-slide">Sign Up Today<br>For a Discount<br>Off Your 1st Book</h5>
                    <p class="second-slide">Some representative placeholder content for the second slide.</p>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="8000">
                <img src="./assets/carousel/kids_reading_books.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block text-dark  block-3">
                    <h5 class="third-slide">Rent Books to Help Others</h5>
                    <p class="third-slide">10% of all proceeds are donated to <br> charities that support reading <br> programs in low-income communities.</p>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
	</div>
    <h1>Welcome Page <c:out value="${currentUser.username}"></c:out></h1>
    
    <form id="logoutForm" method="POST" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Logout!" />
    </form>
    <script type="text/javascript" src="/js/app.js"></script>
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>