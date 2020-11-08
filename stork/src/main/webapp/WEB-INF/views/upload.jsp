<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action = "${pageContext.request.contextPath }/upload.do" method="post" enctype="multipart/form-data">
		<label><input type="file" name="upload" /></label>
		<label><input type="file" name="upload" /></label>
		<input type="submit" value="Next Step" />
	
	</form>

</body>
</html>