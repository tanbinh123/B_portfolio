<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.ArrayList"%>

<%
String member_id = (String) session.getAttribute("member_id");
%>

<form action="orderInfo_action" method="post" name="modify"
	id="memberModify">
	<div class="container container-fluid" style="margin-top: 30px;">
		<table style="text-align: center;" class="table table-bordered">
			<tr>
				<td><h5>배송 상세정보를 입력해주세요.</h5>
					<h6>궁금한 사항이나 불편한 사항은 저희 고객센터로 전화주시거나 1:1문의로 남겨주세요.</h6>
					<h6>친절히 안내해 드립니다.</h6></td>
			</tr>
		</table>
	</div>
	<div>
		<table style="text-align: center;" class="table table-bordered">
			<tr>
				<td scope="col">상품명</td>
				<td scope="col">상품가격</td>
				<td scope="col">개수</td>
				<td scope="col">총금액<input type="hidden" id="member_id"
					name="member_id" value="<%=member_id%>"></td>

			</tr>
			<c:set var="total" value="0" />
			<c:forEach items="${ cart_list }" var="cart_list">
				<tr>
					<td><img style="width: 150px; height: 100px;"
						src="/upload/${cart_list.cart_img }">${cart_list.cart_title }
						<input type="hidden" id="cart_title" name="cart_title"
						value="${ cart_list.cart_title }"> <input type="hidden"
						id="cart_img" name="cart_img" value="${ cart_list.cart_img }">
						<input type="hidden" id="cart_price" name="cart_price"
						value="${ cart_list.cart_price }"> <input type="hidden"
						id="cart_numb" name="cart_numb" value="${ cart_list.cart_numb }">
						<input type="hidden" id="cart_totalPrice" name="cart_totalPrice"
						value="${ cart_list.cart_totalPrice }"></td>
					<td>${ cart_list.cart_price }</td>
					<td>${ cart_list.cart_numb }</td>
					<td>${ cart_list.cart_totalPrice }</td>
					<c:set var="total" value="${total + cart_list.cart_totalPrice}" />
				</tr>

			</c:forEach>
			<tr>
				<td style="text-align: right;" colspan="3">합계 금액 :</td>
				<td><input type="hidden" id="total" name="total"
					value="${total}">
				<c:out value="${total}" /></td>

			</tr>

		</table>
	</div>
	<div>
		<table class="table">
			<tr>
				<td>주소입력</td>
				<td><input type="text" name="orderInfo_addressNumb"
					id="orderInfo_addressNumb" placeholder="우편번호"> <input
					type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="orderInfo_address" name="orderInfo_address"
					placeholder="주소"><br> <input type="text"
					id="orderInfo_address_detail" name="orderInfo_address_detail"
					placeholder="상세주소"> <input type="text"
					id="orderInfo_address_extra" name="orderInfo_address_extra"
					placeholder="참고항목"> <script
						src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script>
						function sample6_execDaumPostcode() {
							new daum.Postcode(
									{
										oncomplete : function(data) {
											// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

											// 각 주소의 노출 규칙에 따라 주소를 조합한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var addr = ''; // 주소 변수
											var extraAddr = ''; // 참고항목 변수

											//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
											if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
												addr = data.roadAddress;
											} else { // 사용자가 지번 주소를 선택했을 경우(J)
												addr = data.jibunAddress;
											}

											// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
											if (data.userSelectedType === 'R') {
												// 법정동명이 있을 경우 추가한다. (법정리는 제외)
												// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
												if (data.bname !== ''
														&& /[동|로|가]$/g
																.test(data.bname)) {
													extraAddr += data.bname;
												}
												// 건물명이 있고, 공동주택일 경우 추가한다.
												if (data.buildingName !== ''
														&& data.apartment === 'Y') {
													extraAddr += (extraAddr !== '' ? ', '
															+ data.buildingName
															: data.buildingName);
												}
												// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
												if (extraAddr !== '') {
													extraAddr = ' ('
															+ extraAddr + ')';
												}
												// 조합된 참고항목을 해당 필드에 넣는다.
												document
														.getElementById("orderInfo_address_extra").value = extraAddr;

											} else {
												document
														.getElementById("orderInfo_address_extra").value = '';
											}

											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											document
													.getElementById('orderInfo_addressNumb').value = data.zonecode;
											document
													.getElementById("orderInfo_address").value = addr;
											// 커서를 상세주소 필드로 이동한다.
											document.getElementById(
													"orderInfo_address_detail")
													.focus();
										}
									}).open();
						}
					</script> <input type="hidden" id="orderInfo_member_id"
					name="orderInfo_member_id" value="<%=member_id%>" readonly />
			</tr>
			<tr>
				<td>주문자 성함</td>
				<td><input type="text" name="orderInfo_name"
					id="orderInfo_name"></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="orderInfo_phone"
					id="orderInfo_phone"></td>
			</tr>
			<tr>
				<td>결제 방법</td>
				<td><input type="radio" name="orderInfo_check"
					id="orderInfo_check" value="1" checked="checked">무통장 입금</td>
			</tr>
			<tr>
				<td>계좌 번호</td>
				<td>국민 123456-78-901234 세종대왕</td>
			</tr>

		</table>
		<div style="text-align: center;" class="">
			<input type="submit" value="주문" class="btn btn-primary">

		</div>
	</div>
</form>


