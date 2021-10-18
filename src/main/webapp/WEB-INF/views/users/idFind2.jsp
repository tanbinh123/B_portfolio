<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/member/login.css">


<div style="margin-top: 200px;"></div>
<div class="d-flex justify-content-center flex-wrap col-md-12">
	<div class="findMain">
		<table style="text-align: center; width: 350px;"
			class="find col-md-10">
			<tr>
				<td colspan="2">당신의 아이디는 ${ dto.member_id }입니다.</td>
			</tr>
			<tr>
				<td colspan="2" style="padding:20px;"><a href="login"><button class="btn btn-primary">로그인
							하기</button></a></td>
			</tr>
							<tr>
					<td>-비밀번호를 잊으셨나요?</td>
					<td><a href="passwordFind"><input type="image"
							src="http://bdmp-004.cafe24.com/bizdemo99969/img/member/btn_pw_find.gif"></a></td>
				</tr>
		</table>

	</div>
</div>

