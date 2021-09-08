<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>임시업로드창</title>
</head>
<body>

	<form action="uploadOk" method="post" enctype="multipart/form-data">
		회원이름 : <input type="text" name="items_name"><br />
		회원이메일 : <input type="email" name="items_email"><br />
		주문 상품 이름 : <input type="text" name="items_title"><br />
		주문 상품 가격 : <input type="text" name="items_price"><br />
		주문 상품 갯수 : <input type="text" name="items_numb"><br />
		주문 상품 배송 상태 1:주문확인전 2:주문 확인 3: 배송 준비중 4:배송 중 5: 배송 완료 : <input type="text" name="items_status"><br />
		회원 index : <input type="text" name="items_member_idx"><br />
		주문 아이템 이미지 : <input type="file" name="file"><br />
		<input type="submit" value="주문내역 업로드">
	</form>

	<img src="/upload/logo.png" />

</body>
</html>