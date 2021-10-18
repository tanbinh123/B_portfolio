<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.ArrayList"%>

<%
String member_id = (String) session.getAttribute("member_id");
%>

<%
if (member_id != null) { //로그인 상태
 %>
<div class="d-flex flex-row">
	<div class="d-flex flex-column col-md-2">
		<div style="margin: 20px;">
			<table style="text-align: center;" class="table table-bordered">
				<tr>
					<td><h4>마이페이지</h4></td>
				</tr>
			</table>
		</div>

		<div style="margin: 20px;">
			<table style="text-align: center;" class="table table-bordered">
				<tr>
					<td>
						<ul>
							<li><h5>쇼핑이용정보</h5></li>
							<li><a href="user_order_list?member_id=<%=member_id%>">주문내역</a></li>
							<li><a href="user_cart_view?member_id=<%=member_id%>">장바구니</a></li>
						</ul>
						<ul>
							<li><h5>회원정보</h5></li>
							<li><a href="user_modify?member_id=<%=member_id%>">회원정보
									수정</a></li>
							<li><a href="user_passwordModify?member_id=<%=member_id%>">비밀번호
									수정</a></li>
							<li><a href="user_delete">회원 탈퇴</a></li>
						</ul>
						<ul>
							<li><h5>커뮤니티</h5></li>
							<li><a href="shopping_review">제품 후기</a></li>
							<li><a href="faq_list">자주하는질문</a></li>
							<li><a href="user_qna">묻고 답하기</a></li>
						</ul>
						<ul>
							<li><h5>쇼핑팁</h5></li>
							<li><a href="user_cancel?member_id=<%=member_id%>">환불 신청</a></li>
							<li><a href="user_howToCancel">환불 신청 방법</a></li>
						</ul>
					<td>
				</tr>
			</table>
		</div>
		<div style="margin: 20px;">
			<table style="text-align: center;" class="table">
				<tr>
					<td><h5>1:1문의</h5>
						<h6>비공개로 고객님께</h6>
						<h6>맞춤 답변을 드립니다.</h6></td>
				</tr>
			</table>
		</div>
		<div style="margin: 20px;">
			<table style="text-align: center;" class="table">
				<tr>
					<td><h6>고객센터</h6>
						<h6>070-0000-0000</h6> <br />
						<h6>평일 10~18시</h6>
						<h6>주말, 공휴일 휴무</h6></td>
				</tr>
			</table>
		</div>
	</div>
	<!-- 메인 -->
	<div class="main-content container col-md-9">
		<c:import url="${ myPage }" />
	</div>
</div>



<%
						}		else
						{  //로그아웃 상태
							%>
<div class=" d-flex flex-row justify-content-center">
	<table style="text-align: center; margin-top:200px;">
		<tr>
			<td class="">로그인 해주세요<br /> <a href="login"><button
						type="button" class="btn btn-primary">로그인</button></a></td>
		</tr>
	</table>
</div>
<%
							}
							
							
							%>
							
							
							