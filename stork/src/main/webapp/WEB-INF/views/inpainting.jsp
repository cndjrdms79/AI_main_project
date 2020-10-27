<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="layout/header.jsp" %>

<!-- Dropzone.js -->
<link href="resources/js/dropzone/dist/min/dropzone.min.css"
	rel="stylesheet">

<form action="form_upload.html" class="dropzone dz-clickable">
	<div class="dz-default dz-message">
		<span>Drop files here to upload</span>
	</div>
</form>

<!-- Dropzone.js -->
<script src="resources/js//dropzone/dist/min/dropzone.min.js"></script>
<%@ include file="layout/footer.jsp" %>