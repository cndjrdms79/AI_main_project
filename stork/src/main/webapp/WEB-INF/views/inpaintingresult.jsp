<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Header -->
<%@ include file="layout/header.jsp"%>
<style>
button {
	all: unset;
	cursor: pointer;
	background-color: white;
	padding: 5px 0px;
	width: 100px;
	text-align: center;
	border-radius: 5px;
	box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px
		rgba(0, 0, 0, 0.08);
	border: 1px solid rgba(0, 0, 0, 0.2);
	color: 1px solid rgba(0, 0, 0, 0.8);
	text-transform: uppercase;
	font-weight: 600;
	font-size: 12px;
	margin-top: 5px;
}

button:active {
	transform: scale(0.98);
}

.first {
	width: 700px;
	height: 512px;
	display: -ms-flexbox;
	display: flex;
	display: center;
	-ms-flex-direction: column;
	flex-direction: column;
	-ms-flex-align: center;
	align-items: center;
	-ms-flex-line-pack: center;
	align-content: center;
	margin-left: auto;
	margin-right: auto;
	float: left;
	margin-left: 20px;
	margin-bottom: 134px;
}

.second {
	width: 700px;
	height: 512px;
	display: inline-block;
	display: -ms-flexbox;
	display: flex;
	display: center;
	-ms-flex-direction: column;
	flex-direction: column;
	-ms-flex-align: center;
	align-items: center;
	-ms-flex-line-pack: center;
	align-content: center;
	margin-right: auto;
	float: left;
	margin-left: 300px;
	margin-bottom: 134px
}
</style>
<div class="main">
	<div class="first">
		<img src="resources/img/before.jpg" />
		<h3 class="title">Original Image</h3>
		<a href="/main" download><button>Home</button></a>
	</div>
	<div class="second">
		<img src="resources/img/after.jpg" />
		<h3 class="title">Result Image</h3>
		<a href="/resources/img/after.jpg" download><button>Download</button></a>
	</div>
</div>

<!-- Footer -->
<%@ include file="layout/footer.jsp"%>