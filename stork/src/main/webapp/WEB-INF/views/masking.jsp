<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header -->	
<%@ include file="layout/header.jsp"%>	
<!-- masking css -->
<link rel ="stylesheet" href="resources/css/style.css"/> 

	<!-- Body -->
    <h2 class="title">Let's Masking</h2>
    <div class="content">
      <canvas id="jsCanvas" class="canvas" ></canvas>
    </div>
    <div class="controls">
      <div class="controls__range">
        <input type="range" id="jsRange" min="5" max="25" value="15" step="1"/>
      </div>
      <div class="controls__btns">
      	<button id="jsSave">Save</button>
        <button id="jsReset">Reset</button>
        <button id="jsNext">Next</button>
      </div>
    </div>

<!-- masking js -->
<script>
//Constant
const INITIAL_COLOR = 'white';
const INITIAL_BG_COLOR = 'black';
const INITIAL_LINE_WIDTH = 15;

// Dom Element
const canvas = document.getElementById("jsCanvas");
const ctx = canvas.getContext('2d');
const range = document.getElementById('jsRange');
const saveBtn = document.getElementById('jsSave');
const resetBtn = document.getElementById('jsReset');
const nextBtn = document.getElementById('jsNext');

var image = new Image();
image.src = "<%=request.getAttribute("path")%>";

// Variable
let isPainting = false;
let isFilling = false;


// Init setting
const initSetting = () => {
  image.onload = function() {
    canvas.width = image.width;
    canvas.height = image.height; 
  	ctx.drawImage(image, 0, 0, image.width, image.height);
  	ctx.strokeStyle = INITIAL_COLOR;
    ctx.lineWidth = INITIAL_LINE_WIDTH;
    // Set init line width
    range.value = INITIAL_LINE_WIDTH;
  }
  canvas.width = image.width;
  canvas.height = image.height; 
  ctx.drawImage(image, 0, 0, image.width, image.height);
  ctx.strokeStyle = INITIAL_COLOR;
  ctx.lineWidth = INITIAL_LINE_WIDTH;
  // Set init line width
  range.value = INITIAL_LINE_WIDTH;
}

// Init event
const initEvent = () => {
  // Add event to Canvas
  if (canvas) {
    canvas.addEventListener("mousemove", onMouseMove);
    canvas.addEventListener("mouseleave", stopPainting);
    canvas.addEventListener("mouseup", stopPainting);
    canvas.addEventListener("mousedown", startPainting);
    canvas.addEventListener("click", handleCanvasClick);
    canvas.addEventListener("contextmenu", handleContextMenu)
  }
  // Add event to range
  if (range) {
    range.addEventListener("input", handleRangeChange);
  }
  // Add event to save button
  if (saveBtn) {
    saveBtn.addEventListener("click", handleSaveClick);
  }
  // Add event to reset button
  if (resetBtn) {
    resetBtn.addEventListener("click", handleResetClick);
  }
  // Add event to next button
  if (nextBtn) {
	nextBtn.addEventListener("click", handleNextClick);
  }
}

// Set start paint
const startPainting = () => {
  isPainting = true;
}
// Set stop paint
const stopPainting = () => {
  isPainting = false;
}
// Event of move mouse on canvas
const onMouseMove = (e) => {
  if (isFilling)
    return;
  const x = e.offsetX;
  const y = e.offsetY;
  if (!isPainting) {
    ctx.beginPath();
    ctx.moveTo(x, y);
  } else {
    ctx.lineTo(x, y);
    ctx.stroke();
  }
}

// Event of change line width
const handleRangeChange = (e) => {
  const size = e.target.value;
  ctx.lineWidth = size;
}

// Event of click canvas
const handleCanvasClick = () => {
  if (isFilling === true) {
    ctx.fillRect(0, 0, canvasWidth, canvasHeight);
  }
}
// Prevent event of right click
const handleContextMenu = (e) => {
	e.preventDefault();
}
// Event of Click save button
const handleSaveClick = () => {
	const image = canvas.toDataURL();
	const link = document.createElement('a');
	link.href = image;
	link.download = 'MaskedImage';
	link.click();
}
// Event of Click reset button
const handleResetClick = () => {
	initSetting();	
}
// Event of Click next button
const handleNextClick = () => {
	canvas.toBlob(function (blob) {
	    var formData = new FormData();
	    formData.set('image', blob);
	
		$.ajax({
	             url : 'masking.do',
	             type: 'post',
	             data: formData,
	             processData: false,
	             contentType: false,
	
	             success: function (data) {
	            	 $(location).attr("href", "inpaintingresult");
	             },
	
	             error: function () {
	           	console.log("error");
	             },
	           });
	  });  // Blob function 
}

// init
initSetting();
initEvent();

</script>
<!-- footer -->
<%@ include file="layout/footer.jsp" %>