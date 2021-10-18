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
<div style="margin-top:100px;"></div>
		<div class="container container-fluid" style="margin-top:30px;">
					<table style="text-align: center;" class="table table-bordered">
				<tr>
					<td><h5>주문 내역입니다.</h5>
						<h6>궁금한 사항이나 불편한 사항은 저희 고객센터로 전화주시거나 1:1문의로 남겨주세요.</h6>
						<h6>친절히 안내해 드립니다.</h6></td>
				</tr>
			</table>
		</div>


<div id="userOrderList"
	class=" d-flex flex-column justify-content-center align-items-center">
	<div class="col-md-9">
		<!-- 주문관리 테이블 -->
		<table style="text-align: center;" class="table table-bordered">
			<tr>
				<td scope="col">주문번호</td>
				<td scope="col">총금액</td>
				<td scope="col">배송상태</td>
				<td scope="col">주문 상세보기</td>
				<td scope="col">주문 취소</td>

			</tr>

	<c:forEach var="dto" items="${ order_list }">
					<tr>
				<td scope="col">${ dto.items_idx }</td>
				<td scope="col">${ dto.items_price }</td>
				<td scope="col">${ dto.items_status2 }</td>
				<td scope="col"><a href="order_view?items_member_idx=${ dto.items_member_idx }&items_order_idx=${dto.items_order_idx}&member_id=<%=member_id%>"><button class="btn btn-primary">상세보기</button></a></td>
				<td scope="col"><a href="order_delete?items_idx=${ dto.items_idx }&items_order_idx=${dto.items_order_idx}&member_id=<%=member_id%>"><button class="btn btn-secondary">주문 취소</button></a></td>

			</tr>
	</c:forEach>
	<tr><td colspan="5">${ error }</td></tr>
		</table>

		<!-- 페이지 네비게이션 -->
	</div>
</div>

<%
} else { //로그아웃 상태
%>
<div style="margin-top:200px;">
	<table>
		<tr>
			<td>로그인 해주세요</td>
		</tr>
		<tr>
			<td><a href="login"><button class="">로그인</button></a></td>
		</tr>
	</table>
</div>
<%
							}
							
							
							%>