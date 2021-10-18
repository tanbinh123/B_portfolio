<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.ArrayList"%>

       <%
		String member_id = (String)session.getAttribute("member_id");
       %>

<%
if (member_id != null) { //로그인 상태
%> 
<div style="margin-top:100px;"></div>
		<div class="container container-fluid" style="margin-top:30px;">
					<table style="text-align: center;" class="table table-bordered">
				<tr>
					<td><h5>주문 상세내역입니다.</h5>
						<h6>궁금한 사항이나 불편한 사항은 저희 고객센터로 전화주시거나 1:1문의로 남겨주세요.</h6>
						<h6>친절히 안내해 드립니다.</h6></td>
				</tr>
			</table>
		</div>
<div id="cartViewDiv"
	class=" d-flex flex-column justify-content-center align-items-center">
	<div class="col-md-9">
		<!-- 주문관리 테이블 -->
		<table style="text-align: center;" class="table table-bordered">
			<tr>
				<td scope="col">주문번호</td>
				<td scope="col">상품명</td>
				<td scope="col">상품가격</td>
				<td scope="col">개수</td>
				<td scope="col">총금액</td>

			</tr>
			<c:set var="total" value="0" />
			<c:forEach items="${ order_view }" var="dto">
				<tr>
					<td></td>
					<td><img
						style="width: 150px; height: 100px;"
						src="/upload/${dto.order_img }">${dto.order_title }
						<input type="hidden" id="cart_title" name="cart_title" value="${ cart_list.cart_title }">
						<input type="hidden" id="cart_img" name="cart_img" value="${ cart_list.cart_img }">
						<input type="hidden" id="cart_price" name="cart_price" value="${ cart_list.cart_price }">
						<input type="hidden" id="cart_numb" name="cart_numb" value="${ cart_list.cart_numb }">
						<input type="hidden" id="cart_totalPrice" name="cart_totalPrice" value="${ cart_list.cart_totalPrice }"></td>
					<td >${ dto.order_price }</td>
					<td >${ dto.order_numb }</td>
					<td >${ dto.order_totalPrice }</td>
					
					<c:set var="total" value="${total + dto.order_totalPrice}" />
				</tr>

			</c:forEach>
			<tr>
				<td style="text-align: right;" colspan="4">합계 금액 :</td>
				<td><input type="hidden" id="total" name="total" value="${total}"><c:out value="${total}" /></td>

			</tr>
						<tr>
				<td style="text-align: center;" colspan="5">주문정보</td>
				</tr>
				<tr>
				<td style="text-align: center;" colspan="5">주문자 성함 : ${ userDto.orderInfo_name }
					<br/> 연락처: ${ userDto.orderInfo_phone } <br />
					우편번호 : ${ userDto.orderInfo_addressNumb }
					상세 주소 : ${ userDto.orderInfo_address } ${ userDto.orderInfo_address_detail } ${ userDto.orderInfo_address_extra } <br />
					결제 방식 : ${ userDto.orderInfo_status }<br />
					입금 계좌번호 : 국민 123456-78-901234 세종대왕</td>

			</tr>
			<tr>
			<td colspan="5"><a href="order_list?member_id=<%=member_id%>"><button class="btn btn-primary">주문목록</button></a></td>
			</tr>

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