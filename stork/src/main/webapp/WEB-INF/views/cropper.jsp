<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Cropper.js</title>
	<!-- cropper css -->
  <link rel="stylesheet" href="resources/css/cropper.css">
  <style>
    .container {
      margin: 20px auto;
      max-width: 100%;
    }

    img {
      max-width: 100%;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>CROP BOX</h1>
    <p>The image displays in its natural size, so the size of the crop box equals the real cropped size.</p>
    <h3>Image</h3>
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
    window.addEventListener('DOMContentLoaded', function () {
      var image = document.querySelector('#image');
      var data = document.querySelector('#data');
      var cropBoxData = document.querySelector('#cropBoxData');
      var button = document.getElementById('button');
      var result = document.getElementById('result');
      var cropper = new Cropper(image, {
        ready: function (event) {
          // Zoom the image to its natural size
          cropper.zoomTo(1);
        },

        crop: function (event) {
          data.textContent = JSON.stringify(cropper.getData());
          cropBoxData.textContent = JSON.stringify(cropper.getCropBoxData());
        },

        zoom: function (event) {
          // Keep the image in its natural size
          if (event.detail.oldRatio === 1) {
            event.preventDefault();
          }
        },
      });

      button.onclick = function () {
        result.innerHTML = '';
        result.appendChild(cropper.getCroppedCanvas());
      };
    });
  </script>
</body>
</html>
