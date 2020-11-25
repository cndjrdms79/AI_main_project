<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp"%>

<!-- partial:index.partial.html -->
<script class="jsbin"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js">
</script>

<form action = "${pageContext.request.contextPath }/mosaic2.do" method="post" enctype="multipart/form-data">
   	<h2 class="title">Mosaic Image File Upload</h2>	
	<div class="file-upload" >
		<div class="image-upload-wrap" aria-disabled="false">
			<div class="drag-text">
				<input class="file-upload-input" type="file" name="mosaicupload"
					onchange="readURL(this);" accept="image/*" autocomplete="off" />
				<input type= "hidden" name="maskname" value="<%=request.getAttribute("path")%>"/>
				<h3>Choose an image</h3>
				<div class="upload-box">
					<i aria-hidden="true" class="ui icon cloud-upload-line"></i><span>Drop
						files to upload or click anywhere in the box to browse.</span>
				</div>
				<p>Photos must be either JPG or PNG format.</p>
			</div>
		</div>

		<div class="file-upload-content">
			<img id=image class="file-upload-image" src="#" alt="your image" />
			<div class="image-title-wrap">
				<button class="remove-image" type="button" onclick="removeUpload()">Change Image</button>
				<input id="mosaic" class="remove-image" type="submit" value="Next Step" />
			</div>
		</div>
	</div>
</form>

<!-- Dropzone.js -->
<script src="resources/js/dropzone.js"></script>

<%@ include file="layout/footer.jsp"%>