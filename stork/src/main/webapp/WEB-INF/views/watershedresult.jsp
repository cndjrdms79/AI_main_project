<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Header -->
<%@ include file="layout/header.jsp"%>
<style>
	.Btn{
	  all: unset;
	  cursor: pointer;
	  background-color: white;
	  padding: 5px 0px;
	  width: 100px;
	  text-align: center;
	  border-radius: 5px;
	  box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px rgba(0, 0, 0, 0.08);
	  border: 1px solid rgba(0,0,0,0.2);
	  color: 1px solid rgba(0,0,0,0.8);
	  text-transform: uppercase;
	  font-weight: 600;
	  font-size: 12px;
	  margin-top: 5px;
	}
	.Btn:active{
	  transform: scale(0.98);
	}
    .first {
	   	width: 600px;
		height: 512px;
		display: -ms-flexbox;
		display: flex;
		display: center;
		-ms-flex-direction: column;
		flex-direction: column;
		-ms-flex-align: center;
		align-items: center;
		-ms-flex-line-pack: center;
		align-content: center;
		float: left;
		margin-left: 80px;
		margin-bottom: 134px;
    }
    .second {
	   	width: 600px;
		height: 512px;
		display: -ms-flexbox;
		display: flex;
		display: center;
		-ms-flex-direction: column;
		flex-direction: column;
		-ms-flex-align: center;
		align-items: center;
		-ms-flex-line-pack: center;
		align-content: center;
		margin-left: auto;
		margin-right: auto;
		float: left;
		margin-left: 5%;
		margin-bottom: 134px
    }
    #Result {
		max-height: 580px;
		max-width: 500px;
		margin: auto;
		padding: 20px;
	}
	#Result2 {
		max-height: 580px;
		max-width: 500px;
		margin: auto;
		padding: 20px;
	}
	
</style>

<div class="first">
	<h3 class="title" style="margin-left: 120px">Original Image</h3>
	<div id="Result"></div>
	<a href="/main"><button class="Btn" style="margin-left: 70px">Home</button></a>
</div>
<div class="second">
	<h3 class="title" style="margin-left: 140px">Result Image</h3> 
	<div id="Result2"></div>
	<button id="Save" class="Btn" style="margin-left: 95px">SAVE</button>
</div>



<script>
var para = document.location.href.split("&")[1];
var para22 = document.location.search.split("&")[0];
var para2 = para22.replace("?","");
console.log(para);
console.log(para2);

var result = document.getElementById("Result");
var result2 = document.getElementById("Result2");

const image1 = new Image();
const image2 = new Image();
image1.src = para;
image2.src = "/resources/upload/Modify/" + para2;
result.appendChild(image1);
result2.appendChild(image2);

document.getElementById("Save").addEventListener("click", imgSave);

function imgSave() {
	var image = "/resources/upload/Modify/" + para2;
	var link = document.createElement("a");
	link.href = image;
	link.download = "result";
	link.click();
} 
</script>

<!-- Footer -->
<%@ include file="layout/footer.jsp"%>