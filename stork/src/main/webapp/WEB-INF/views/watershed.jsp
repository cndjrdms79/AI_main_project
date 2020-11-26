<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp"%>

<style>
	.Btn{
	  all: unset;
	  cursor: pointer;
	  background-color: white;
	  padding: 5px 0px;
	  width: 140px;
	  text-align: center;
	  border-radius: 5px;
	  box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px rgba(0, 0, 0, 0.08);
	  border: 1px solid rgba(0,0,0,0.2);
	  color: 1px solid rgba(0,0,0,0.8);
	  text-transform: uppercase;
	  font-weight: 600;
	  font-size: 12px;
	}
	.Btn:active{
	  transform: scale(0.98);
	}
</style>

<!-- partial:index.partial.html -->
<script class="jsbin"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

<form action = "${pageContext.request.contextPath }/watershed.do" method="post" enctype="multipart/form-data">
	<h2 class="title">Watershed Image File Upload</h2>	
	<div class="file-upload">
		<div class="image-upload-wrap" aria-disabled="false">
			<div class="drag-text">
				<input class="file-upload-input" type='file' name='watershedupload'
					onchange="readURL(this);" accept="image/*" autocomplete="off" />
				<h3>Choose an image</h3>
				<div class="upload-box">
					<i aria-hidden="true" class="ui icon cloud-upload-line"></i><span>Drop
						files to upload or click anywhere in the box to browse.</span>
				</div>
				<p>Photos must be either JPG or PNG format.</p>
			</div>
		</div>

		<div class="file-upload-content">
			<img class="file-upload-image" src="#" alt="your image" />
			<div class="image-title-wrap">
				<button class="Btn" type="button" onclick="removeUpload()">Change
					Image</button>
				<input class="Btn" type="submit" value="Next Step" />
			</div>
		</div>
	</div>
</form>

<!-- Dropzone.js -->
<script src="resources/js/dropzone.js"></script>

<%@ include file="layout/footer.jsp"%>
