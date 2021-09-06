<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUpload</title>
</head>
<body>

	<form action="uploadOk" method="post" enctype="multipart/form-data">
	    아이디 : <input type="text" name="user_id"><br />
	    암호 : <input type="text" name="user_pw"><br />
		파일 : <input type="file" name="filename"><br />
		<input type="submit" value="File Upload">
	</form>
	
	<img src="/upload/20212299375772.png" />

</body>
</html>