<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/member/login.css">

<%
String member_id = (String) session.getAttribute("member_id");
%>
<div class="d-flex flex-row justify-content-center"
	style="margin-top: 30px;">
	<table style="text-align: center;" class="table table-bordered">
		<tr>
			<td><h5>회원 탈퇴 안내</h5>
				<h6>
					사용하고 계신 아이디
					<%=member_id%>(은)는 탈퇴할 경우 3개월간 재사용이 불가능 합니다.
				</h6>
				<h6>탈퇴 이후 등록한 게시물, 보유 포인트 등 이용 기록이 모두 삭제됩니다.</h6>
		</tr>
	</table>
</div>

<div class="d-flex flex-row justify-content-center"
	style="margin-top: 30px;">
	<form action="user_delete_submit" method="post" name="deleteAction">
		<table class="" style="text-align: center; border:none; font-weight:bold;">

			<tr>
				<td>탈퇴 사유를 선택해주세요! <br /><h3></h3> <input type="checkbox"
					value="이용률 감소">이용률 감소 <input type="checkbox"
					value="상품 품질 불만">상품 품질 불만 <input type="checkbox"
					value="상품 가격 불만">상품 가격 불만 <input type="checkbox"
					value="타 사이트 이용">타 사이트 이용 <input type="checkbox" value="기타">기타<h3></h3>
				</td>
			</tr>

			<tr>
				<td>쇼핑몰 이용에 개선사항이 있다면 의견을 남겨주세요!<h3></h3> <br>
				<textarea></textarea><h3></h3></td>
			</tr>
			<tr>
				<td><input type="hidden" id="member_id" name="member_id"
					value="${ dto.member_id }"> <input type="hidden"
					id="member_pw" name="member_pw" value="${dto.member_pw }"></td>

			</tr>
			<tr>
				<td><input type="submit" class="btn btn-primary" value="확인"><h3></h3>
				</td>
			</tr>
		</table>
	</form>
</div>
<div class="d-flex justify-content-center">
	<a href="/home"><button class="btn btn-secondary">홈으로</button></a>
</div>


