<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/member/login.css">

 <%
		String member_id = (String)session.getAttribute("member_id");
 %>
		<div class="container container-fluid" style="margin-top:30px;">
					<table style="text-align: center;" class="table table-bordered">
				<tr>
					<td><h5>무엇을 도와드릴까요?</h5>
						<h6>궁금한 사항이나 불편한 사항은 저희 고객센터로 전화주시거나 1:1문의로 남겨주세요.</h6>
						<h6>친절히 안내해 드립니다.</h6></td>
				</tr>
			</table>
		</div>
		<div>
   	<form action="member_id_modify" method="post" name="modify" id="memberModify">
			<table class="table">
				<tr>
					<td>아이디</td>
					<td><input type="hidden" name="member_pw" id="member_pw" value="${ dto.member_pw }" />
					<input type="text" id="member_id" name="member_id" value="<%=member_id%>" readonly />
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="member_name" id="member_name" value="${ dto.member_name }"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="member_email" id="member_email" value="${ dto.member_email }"></td>
				</tr>
				<tr>
					<td>이메일 수신여부</td>
					<td><input type="radio" name="member_email_receive"
						id="member_email_receive" value="1" checked="checked">수신<input type="radio" name="member_email_receive"
						value="2">수신안함</td>
				</tr>
				

			</table>
									<div style="text-align:center;" class="">
							<input type="submit" value="수정" class="btn btn-primary">
						
						</div>
		</form>
		<div class="d-flex justify-content-center" style="margin-top:25px;">
			<a href="home"><button class="btn btn-secondary">메인으로</button></a>
			</div>
        </div>
  
