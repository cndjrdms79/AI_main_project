<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp"%>

</br>
</br>
</br>

<!-- partial:index.partial.html -->
<script class="jsbin"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

<form id="fileform" action="http://localhost:5000/fileUpload" method="POST" enctype="multipart/form-data">
	<div class="file-upload">
		<div class="image-upload-wrap" aria-disabled="false">
			<div class="drag-text">
				<input class="file-upload-input" type='file' name='file'
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
				<button class="remove-image" type="button" onclick="removeUpload()">Change
					Image</button>
				<button class="remove-image" type="button" OnClick="FileBt();">Next Step</button>
			</div>
		</div>
	</div>
</form>

<script src="resources/js/FileSaver.js"></script>
<script src="resources/js/html2canvas.js"></script>
<!-- Dropzone.js -->
<script src="resources/js/dropzone.js"></script>

<script>
//파일 전송 Submit 이후 페이지 이동
function FileBt(){
	document.getElementById("fileform").submit();
}
</script>

</br>
</br>
</br>
<%@ include file="layout/footer.jsp"%>
