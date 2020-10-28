<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="layout/header.jsp" %>

<div class="inner">
	<div class="dropzone" aria-disabled="false">
		<div class="no-image">
			<h3>Choose an image</h3>
			<div class="upload-box">
				<i aria-hidden="true" class="ui icon cloud-upload-line"></i><span>Drop
					files to upload or click anywhere in the box to browse.</span>
			</div>
			<p>Photos must be either JPG or PNG format.</p>
		</div>
		<input accept="image/jpeg, image/png" type="file" autocomplete="off"
			style="display: none;">
	</div>
</div>

<!-- Dropzone.js -->
<script src="resources/js/dropzone/dist/min/dropzone.min.js"></script>

<%@ include file="layout/footer.jsp" %>