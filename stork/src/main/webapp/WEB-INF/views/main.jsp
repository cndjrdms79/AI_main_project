<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp" %>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img src="resources/img/chicago.jpg" alt="Los Angeles">
			<div class="container">
				<div class="carousel-caption text-left">
					<h1>Mosaic</h1>
					<p>this is mosaic. you know what i'm saying?</p>
					<p>
						<a class="btn btn-lg btn-primary" href="/mosaic" role="button">Signup today</a>
					</p>
				</div>
			</div>
		</div>
		<div class="carousel-item">
			<img src="resources/img/chicago.jpg" alt="Los Angeles">
			<div class="container">
				<div class="carousel-caption">
					<h1>Image Inpainting</h1>
					<p>this is image inpainting. you know what i'm saying?</p>
					<p>
						<a class="btn btn-lg btn-primary" href="/inpainting" role="button">Learnmore</a>
					</p>
				</div>
			</div>
		</div>
		<div class="carousel-item">
			<img src="resources/img/chicago.jpg" alt="Los Angeles">
			<div class="container">
				<div class="carousel-caption text-right">
					<h1>Watershed</h1>
					<p>this is watershed. you know what i'm saying?</p>
					<p>
						<a class="btn btn-lg btn-primary" href="/watershed" role="button">Browsegallery</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<a class="carousel-control-prev" href="#myCarousel" role="button"
		data-slide="prev"> <span class="carousel-control-prev-icon"
		aria-hidden="true"></span> <span class="sr-only">Previous</span>
	</a> <a class="carousel-control-next" href="#myCarousel" role="button"
		data-slide="next"> <span class="carousel-control-next-icon"
		aria-hidden="true"></span> <span class="sr-only">Next</span>
	</a>
</div>

<!-- Marketing messaging and featurettes
  ================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->
<div class="container marketing">
	<!-- START THE FEATURETTES -->

	<hr class="featurette-divider">

	<div class="row featurette">
		<div class="col-md-7">
			<h2 class="featurette-heading">
				Mosaic 
			</h2>
			<p class="lead">this is mosaic. you know what i'm saying?</p>
		</div>
		<div class="col-md-5">
			<svg
				class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
				width="500" height="500" xmlns="http://www.w3.org/2000/svg"
				preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
				aria-label="Placeholder: 500x500">
				<title>Placeholder</title><rect width="100%" height="100%" fill="#eee"></rect>
				<text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>
		</div>
	</div>

	<hr class="featurette-divider">

	<div class="row featurette">
		<div class="col-md-7 order-md-2">
			<h2 class="featurette-heading">
				Image Inpainting 
			</h2>
			<p class="lead">this is image inpainting. you know what i'm saying?</p>
		</div>
		<div class="col-md-5 order-md-1">
			<svg
				class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
				width="500" height="500" xmlns="http://www.w3.org/2000/svg"
				preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
				aria-label="Placeholder: 500x500">
				<title>Placeholder</title><rect width="100%" height="100%"
					fill="#eee"></rect>
				<text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>
		</div>
	</div>

	<hr class="featurette-divider">

	<div class="row featurette">
		<div class="col-md-7">
			<h2 class="featurette-heading">
				Watershed
			</h2>
			<p class="lead">this is image Watershed. you know what i'm saying?</p>
		</div>
		<div class="col-md-5">
			<svg
				class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
				width="500" height="500" xmlns="http://www.w3.org/2000/svg"
				preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
				aria-label="Placeholder: 500x500">
				<title>Placeholder</title><rect width="100%" height="100%"
					fill="#eee"></rect>
				<text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>
		</div>
	</div>

	<hr class="featurette-divider">

	<!-- /END THE FEATURETTES -->

</div>
<!-- /.container -->


<%@ include file="layout/footer.jsp"%>

