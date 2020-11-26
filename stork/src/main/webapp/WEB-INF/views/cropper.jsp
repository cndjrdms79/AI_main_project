<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- header -->	
<%@ include file="layout/header.jsp"%>	

  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <!-- cropper.css -->
  <link rel="stylesheet" href="resources/css/cropper.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
  <style>
    .content {
    	width: 700px;
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
		margin-bottom: 134px;
    }
    img {
      	width: 100%;
      	height: 100%;
    }
    .controls{
	  margin-top:10px;
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	}
	button{
	  all: unset;
	  cursor: pointer;
	  background-color: white;
	  padding: 5px 0px;
	  width: 200px;
	  text-align: center;
	  border-radius: 5px;
	  box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px rgba(0, 0, 0, 0.08);
	  border: 1px solid rgba(0,0,0,0.2);
	  color: 1px solid rgba(0,0,0,0.8);
	  text-transform: uppercase;
	  font-weight: 600;
	  font-size: 12px;
	}
	button:active{
	  transform: scale(0.98);
	}
  </style>

  <!-- Body -->	
  <div class="content">
    <h3 class="title">Upload cropped image to server</h3>
    <div class="img">
	    <img id="image" src="${path }" alt="image">
	    <div class="controls">
	    	<button id="crop">Next Step</button>
	    </div>
	</div>  
  </div>	
	
  
  
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" ></script>
  <script src="resources/js/cropper.js"></script>
  <script>
    window.addEventListener('DOMContentLoaded', function () {
      var image = document.getElementById('image');
      var button = document.getElementById('button');
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
          
          canvas.toBlob(function (blob) {
            var formData = new FormData();
            formData.set('image', blob);

			$.ajax({
	              url : 'cropper.do',
	              type: 'post',
	              data: formData,
	              processData: false,
	              contentType: false,

	              success: function (data) {            	
	                $(location).attr("href", "watershedresult?"+data+ "&<%=request.getAttribute("path")%>");
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