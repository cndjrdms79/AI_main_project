<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp"%>
 <style>
   .container {
     margin: 20px auto;
     max-width: 60%;
   }

   img {
     max-width: 100%;
   }
 </style>
</br>
</br>
</br>

<!-- partial:index.partial.html -->
<script class="jsbin"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<!-- ajax canvas images -->
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>


<div class="container">
<div class="controls">
	<canvas id="jsCanvas" class="canvas"></canvas>
	<button class="remove-image" type="button" onclick="saveImage();">Next Step</button>
	<div class="controls__range">
		<input type="range" id="jsRange" min="5" max="25" value="15" step="1" />
	</div>
	<button id="btn1" class="remove-image">Next Step</button>
    <div id="result"></div>
</div>
</div>

<!-- masking.js -->
<script>
//masking
const canvas = document.getElementById("jsCanvas");
const ctx = canvas.getContext("2d");
const colors = document.getElementsByClassName("jsColor");
const range = document.getElementById("jsRange");
const mode = document.getElementById("jsMode");
const saveBtn = document.getElementById("jsSave");

const INITIAL_COLOR = 'white'
const INITIAL_BG_COLOR = 'black';
const INITIAL_LINE_WIDTH = 15;

var img = new Image();
img.onload = function() {
	canvas.width = img.width;
    canvas.height = img.height;
    ctx.drawImage(img, 0, 0);
  };
  
img.src = "<%=request.getAttribute("path")%>";

ctx.fillStyle = img;
ctx.fillRect(0, 0, canvas.width, canvas.height);
ctx.strokeStyle = INITIAL_COLOR;
ctx.fillStyle = INITIAL_COLOR;
ctx.lineWidth = INITIAL_LINE_WIDTH;
// Set initial line width
range.value = INITIAL_LINE_WIDTH;

let painting = false;
let filling = false;

function stopPainting(event){
    painting = false;
}

function startPainting(event){
    painting = true;
}

function onMouseMove(event){
    const x = event.offsetX;
    const y = event.offsetY;
    if(!painting) {
        ctx.beginPath();
        ctx.moveTo(x, y);
    } else {
        ctx.lineTo(x, y);
        ctx.stroke();
    }
}

function handleColorClick(event){
    const color = event.target.style.backgroundColor;
    ctx.strokeStyle = color;
    ctx.fillStyle = color;
}

function handleRangeChange(event){
    const size = event.target.value;
    ctx.lineWidth = size;
}

function handleModeClick(){
    if(filling===true){
        filling = false;
        mode.innerText = "Fill";
    } else{
        filling = true;
        mode.innerText = "Paint";
    }
}

function handleCanvasClick(){
    if(filling){
        ctx.fillRect(0, 0, canvas.width, canvas.height);
    }
}

function handleCM(){
    event.preventDefault();
}

function handleSaveClick(){
    const image = canvas.toDataURL();
    const link = document.createElement("a");
}

$('#btn1').on('click', function(){
    var form = {
            name : canvas.toDataURL()
    }
    $.ajax({
        url: "masking.do",
        type: "POST",
        data: form,
        success: function(data){
            $('#result').text(data);
        },
        error: function(){
            alert("simpleWithObject err");
        }
    });
});

if(canvas){
    canvas.addEventListener("mousemove", onMouseMove);
    canvas.addEventListener("mousedown", startPainting);
    canvas.addEventListener("mouseup", stopPainting);
    canvas.addEventListener("mouseleave", stopPainting);
    canvas.addEventListener("click", handleCanvasClick);
    canvas.addEventListener("contextmenu", handleCM);
}

Array.from(colors).forEach(color => color.addEventListener("click", handleColorClick));

if(range){
    range.addEventListener("input", handleRangeChange);
}

if(saveBtn){
    saveBtn.addEventListener("click", handleSaveClick);
}
</script>

</br>
</br>
</br>
<%@ include file="layout/footer.jsp"%>
