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
      <form action="user_pwModifyAction" method="post" name="loginAction">
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
  
