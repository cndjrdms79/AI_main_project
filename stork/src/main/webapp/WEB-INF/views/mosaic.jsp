<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp" %>

<div class="sc-gZMcBi fWWKdU">
	<article class="image-selection` sc-bdVaJa cyjxVs">
		<h2>Step One</h2>
		<span class="subheader">Upload your image, scale, and use your
			cursor to drag your image to center. Uploaded image will be
			zoomed/cropped by default.</span>
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
		<div class="tools">
			<div class="sc-gzVnrw jjbZyn">
				<div>Image Scale:</div>
				<i aria-hidden="true" class="ui icon subtract-circle-line"></i><input
					type="range" max="3" min="1" step="0.001" class="ui slider"
					value="1"><i aria-hidden="true"
					class="ui icon add-circle-line"></i>
			</div>
			<div class="ui buttons selection-controls">
				<button class="ui button flat">Change Image</button>
				<div class="ui button primary">
					<a href="/research/inpainting/masking">Next Step</a>
				</div>
			</div>
		</div>
	</article>
</div>

<%@ include file="layout/footer.jsp" %>