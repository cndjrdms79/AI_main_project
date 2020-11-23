<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp" %>

<style>
	button{
	  all: unset;
	  cursor: pointer;
	  background-color: white;
	  padding: 5px 0px;
	  width: 400px;
	  text-align: center;
	  border-radius: 5px;
	  box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px rgba(0, 0, 0, 0.08);
	  border: 1px solid rgba(0,0,0,0.2);
	  color: 1px solid rgba(0,0,0,0.8);
	  text-transform: uppercase;
	  font-weight: 600;
	  font-size: 12px;
	}
	button:active{
	  transform: scale(0.98);
	}
</style>

<div class="content">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img src="resources/img/crouMosaic.jpg" alt="Mosaic Image">
			<div class="container">
				<div class="carousel-caption text-left">
					<h1 style="background-color:rgba(0, 0, 0, 0.4); width: 135px">Mosaic</h1>
					<p style="background-color:rgba(0, 0, 0, 0.4); width: 485px">학습시킨 인물을 제외한 나머지 인물에 대해 모자이크 처리하는 기능</p>
					<p>
						<a class="btn btn-lg btn-primary" href="/mosaic" role="button">Let's Mosaic</a>
					</p>
				</div>
			</div>
		</div>
		<div class="carousel-item">
			<img src="resources/img/crouInpainting.jpg" alt="inpainting">
			<div class="container">
				<div class="carousel-caption text-left">
					<h1 style="background-color:rgba(0, 0, 0, 0.4); width: 315px">Image Inpainting</h1>
					<p style="background-color:rgba(0, 0, 0, 0.4); width: 370px">마스킹한 부분을 예측하여 이미지를 채워 넣는 기능</p>
					<p>
						<a class="btn btn-lg btn-primary" href="/inpainting" role="button">Let's Inpainting</a>
					</p>
				</div>
			</div>
		</div>
		<div class="carousel-item">
			<img src="resources/img/crouWatershed.jpg" alt="watershed">
			<div class="container">
				<div class="carousel-caption text-left">
					<h1 style="background-color:rgba(0, 0, 0, 0.4); width: 200px">Watershed</h1>
					<p style="background-color:rgba(0, 0, 0, 0.4); width: 330px">이미지에서 원하는 객체를 분할 처리하는 기능</p>
					<p>
						<a class="btn btn-lg btn-primary" href="/watershed" role="button">Let's Watershed</a>
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
</div>
<!-- Marketing messaging and featurettes
  ================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->
<div class="container marketing">
	<!-- START THE FEATURETTES -->

	<hr class="featurette-divider">
	<div class="row featurette">
		<div class="col-md-7">
			<h2 class="featurette-heading">Mosaic</h2>
			<p class="lead">학습시킨 인물의 얼굴을 제외한 나머지 인물의 얼굴을 이미지에서 모자이크 처리하는 기능입니다.</p>
			<p class="lead">● 모자이크 기능에 대한 순서는 다음과 같습니다.</p>
			<p >1. 모자이크 처리하지 않을 인물을 얼굴 사진을 업로드합니다.</p>
			<p >2. 모자이크 처리하고 싶은 사진을 업로드합니다.</p>
			<p >3. 모자이크 처리된 사진을 저장합니다.</p>
			<a href="/mosaic"><button>Let's Mosaic</button></a>
		</div>
		<div class="col-md-5">
			<img src = "resources/img/mosaic.png" width="500" height="500" class="img-fluid img-thumbnail" />
		</div>
	</div>

	<hr class="featurette-divider">
	<div class="row featurette">
		<div class="col-md-7 order-md-2">
			<h2 class="featurette-heading">Image Inpainting </h2>
			<p class="lead">이미지의 원하지 않는 부분을 마스킹하면 해당 부분을 예측하여 자연스러운 이미지를 생성해주는 기능입니다.</p>
			<p class="lead">● 이미지 인페인팅 기능에 대한 순서는 다음과 같습니다.</p>
			<p>1. 원하는 이미지를 선택합니다.</p>
			<p>2. 이미지에서 원하지 않는 부분을 마스킹합니다.</p>
			<p>3. 마스킹한 부분이 자연스럽게 수정된 사진을 저장합니다.</p>
			<a href="/inpainting"><button>Let's Inpainting</button></a>
			<p></p>
		</div>
		<div class="col-md-5 order-md-1">
			<img src="resources/img/ImageInpainting.gif " width="500" height="500" class="img-fluid img-thumbnail" />
		</div>
	</div>

	<hr class="featurette-divider">
	<div class="row featurette">
		<div class="col-md-7">
			<h2 class="featurette-heading">Watershed</h2>
			<p class="lead">이미지에서 원하는 객체를 분할 처리해주는 기능입니다.</p>
			<p class="lead">● 워터쉐드 기능에 대한 순서는 다음과 같습니다.</p>
			<p>1. 다음 기능을 원하는 이미지를 선택합니다.</p>
			<p>2. 원하는 객체가 있는 부분을 마우스를 이용해 지정합니다.</p>
			<p>3. 분할 처리된 객체를 저장합니다.</p>
			<a href="/watershed"><button>Let's Watershed</button></a>
		</div>
		<div class="col-md-5">
			<img src="resources/img/ImageInpainting2.gif " width="500" height="500" class="img-fluid img-thumbnail" />
		</div>
	</div>

	<hr class="featurette-divider">

	<!-- /END THE FEATURETTES -->

</div>
<!-- /.container -->


<%@ include file="layout/footer.jsp"%>

