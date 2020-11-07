<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width initial-scale=1.0" />
  <link rel='icon' href='favicon.ico' type='image/x-icon' />
  <!-- CSS -->
  <link rel="stylesheet" href="resources/css/reset.css" />
  <link rel="stylesheet" href="resources/css/style.css" />
  <title>Painter</title>
</head>

<body>
<!--
  <div class="title">Painter</div>
  <div class="controls">
    <div class="controls__size">
      <div class="text">Width :</div>
      <input class="controls__width" type="number" id="jsWidth" value="600" />
      <div class="text">Height :</div>
      <input class="controls__height" type="number" id="jsHeight" value="500" />
      <button id="jsResize">Resize</button>
    </div>
  </div>
   -->
  <div class="content">
    <canvas id="jsCanvas" class="canvas"></canvas>
  </div>
  <div class="controls">
    <div class="controls__range">
      <input type="range" id="jsRange" min="1.0" max="20.0" value="10.0" step="1.0" />
    </div>
    <div class="controls__btns">
      <button id="jsSave">Save</button>
      <button id="jsReset">Reset</button>
    </div>

    <div class="controls__colors jsColor"></div>
  </div>
<!-- JS -->
<script src="resources/js/painting.js">
</script>
</body>

</html>