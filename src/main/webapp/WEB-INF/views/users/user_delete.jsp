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
					<td><h5>탈퇴를 희망하시는게 맞나요?</h5>
						<h6>회원 탈퇴하시려면 아이디와 비밀번호를 입력해주세요.</h6>
				</tr>
			</table>
		</div>
      <form action="user_deleteAction" method="post" name="deleteAction">
        <table class="main1">
          <tr>
            <td>
              아이디<br>
              비밀번호
            </td>
            <td>
            <input type="hidden" id="member_id2" name="member_id2" value="<%=member_id%>">
              <input type="text" id="member_id" name="member_id" value="<%=member_id%>" readonly><br>
              <input type="password" id="member_pw" name="member_pw">
            </td>
            <td>
              <input type="submit" class="btn btn-primary" value="로그인">
            </td>
          </tr>
        </table>
        </form>
        
        <div class="loginSe2">
          <table class="main2">
            <tr>
              <td>-비밀번호를 잊으셨나요?</td>
              <td><a href="passwordFind"><input type="image" src="http://bdmp-004.cafe24.com/bizdemo99969/img/member/btn_pw_find.gif"></a></td>
            </tr>
          </table>
        </div>
  
