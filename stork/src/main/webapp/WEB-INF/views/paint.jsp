<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width initial-scale=1.0" />
  <link rel='icon' href='favicon.ico' type='image/x-icon' />
  <link rel="stylesheet" href="resources/css/reset.css" />
  <link rel="stylesheet" href="resources/css/style.css" />
  <title>Painter</title>
</head>

<body>
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
  <div class="content">
    <canvas id="jsCanvas" class="canvas"></canvas>
  </div>
  <div class="controls">
    <div class="controls__range">
      <input type="range" id="jsRange" min="0.1" max="5.0" value="2.5" step="0.1" />
    </div>
    <div class="controls__btns">
      <button id="jsMode">Fill</button>
      <button id="jsSave">Save</button>
      <button id="jsReset">Reset</button>
    </div>
    <div class="controls__colors" id="jsColors">
      <div class="controls__color jsColor" style="background-color: #2c2c2c"></div>
      <div class="controls__color jsColor" style="background-color: white"></div>
      <div class="controls__color jsColor" style="background-color: #ff3b30"></div>
      <div class="controls__color jsColor" style="background-color: #ff9500"></div>
      <div class="controls__color jsColor" style="background-color: #ffcc00"></div>
      <div class="controls__color jsColor" style="background-color: #4cd963"></div>
      <div class="controls__color jsColor" style="background-color: #5ac8fa"></div>
      <div class="controls__color jsColor" style="background-color: #0579FF"></div>
      <div class="controls__color jsColor" style="background-color: #5856D6"></div>
    </div>
  </div>
  <script src="resources/js/painting.js"></script>
</body>

</html>