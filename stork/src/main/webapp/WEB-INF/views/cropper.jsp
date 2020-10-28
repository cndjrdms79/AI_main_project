<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Cropper.js</title>
<link rel="stylesheet" href="resources/css/cropper.css">
<style>
.container {
	margin: 20px auto;
	max-width: 640px;
}

img {
	max-width: 100%;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Cropper with a range of aspect ratio</h1>
		<div>
			<img id="image" src="resources/img/chicago.jpg" alt="Picture">
		</div>
		<h3>Result</h3>
		<p>
			<button type="button" id="button">Crop</button>
		</p>
		<div id="result"></div>
	</div>
	<script src="resources/js/cropper.js"></script>
	<script>
    function getRoundedCanvas(sourceCanvas) {
      var canvas = document.createElement('canvas');
      var context = canvas.getContext('2d');
      var width = sourceCanvas.width;
      var height = sourceCanvas.height;

      canvas.width = width;
      canvas.height = height;
      context.imageSmoothingEnabled = true;
      context.drawImage(sourceCanvas, 0, 0, width, height);
      context.globalCompositeOperation = 'destination-in';
      context.beginPath();
      context.arc(width / 2, height / 2, Math.min(width, height) / 2, 0, 2 * Math.PI, true);
      context.fill();
      return canvas;
    }

    window.addEventListener('DOMContentLoaded', function () {
      var image = document.getElementById('image');
      var button = document.getElementById('button');
      var result = document.getElementById('result');
      var croppable = false;
      var cropper = new Cropper(image, {
        aspectRatio: 1,
        viewMode: 1,
        ready: function () {
          croppable = true;
        },
      });

      button.onclick = function () {
        var croppedCanvas;
        var croppedImage;

        if (!croppable) {
          return;
        }

        // Crop
        croppedCanvas = cropper.getCroppedCanvas();

        // Show
        croppedImage = document.createElement('img');
        croppedImage.src = croppedCanvas.toDataURL()
        result.innerHTML = '';
        result.appendChild(croppedImage);
      };
    });
  </script>
</body>
</html>