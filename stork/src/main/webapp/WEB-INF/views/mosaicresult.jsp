<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp"%>

<div align="center">
	<br> <br> <br>
	<div align="center">
		<img
			src="/resources/upload/mosaic/<%=request.getParameter("before")%>"
			title="original" alt="original" align="center" /> <img
			src="/resources/upload/Modify/<%=request.getParameter("after")%>"
			title="" alt="">

	</div>
	<div>Original Image Result Image</div>

</div>


<a href="/main">Home</a>

<a href="/resources/upload/Modify/<%=request.getParameter("after")%>"
	download>Download</a>


<%@ include file="layout/footer.jsp"%>