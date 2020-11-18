<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- header -->	
<%@ include file="layout/header.jsp"%>	

  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" crossorigin="anonymous">
  <link rel="stylesheet" href="resources/css/cropper.css">
  <style>
    .container {
      margin: 20px auto;
      max-width: 70%;
    }

    img {
      max-width: 100%;
    }
  </style>
</head>
<body>
  <div class="container">
    <h3>Upload cropped image to server</h3>
    <div>
	    <img id="image" src="${path }" alt="image">
	    <button id="crop" class="btn btn-primary">CROP and SAVE</button>
	</div>   
	<div id="result"></div>
  </div>
  
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" ></script>
  <script src="resources/js/cropper.js"></script>
  <script>
    window.addEventListener('DOMContentLoaded', function () {
      var image = document.getElementById('image');
      var button = document.getElementById('button');
      var result = document.getElementById('result');
      var save = document.getElementById('save'); 
      var cropper = new Cropper(image, {
    	  zoom: function (event) {
	          // Keep the image in its natural size
	          if (event.detail.oldRatio === 1) {
	            event.preventDefault();
	          }
	      }
      }); 

      
      document.getElementById('crop').addEventListener('click', function () {
        var canvas;
        
        if (cropper) {
          canvas = cropper.getCroppedCanvas();
          result.innerHTML = '';
          result.appendChild(canvas);
          
          canvas.toBlob(function (blob) {
            var formData = new FormData();
            formData.set('file', blob);
            
			console.log(formData.get("file"));
			console.log('file upload...');

			$.ajax({
	              url : 'imsi',
	              type: 'post',
	              data: formData,
	              processData: false,
	              contentType: false,

	              success: function () {
	                console.log("complete");
	                alert("저장되엇습니다.")
	                $(location).attr("href", "main");
	              },

	              error: function () {
	            	console.log("error");
	              },
	            });
		  });  // Blob function 
		
        } // if(copper)
 
      }); // button crop

    }); // DOM
  </script>
  
<!-- footer -->
<%@ include file="layout/footer.jsp" %>