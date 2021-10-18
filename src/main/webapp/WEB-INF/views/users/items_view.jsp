<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/style.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<div class="itemcontent d-flex justify-content-center flex-column">
	<div class="d-flex  justify-content-center">
		<form method="post" action="addCartAction">
			<table class="viewClass border">
				<tr>
					<td class="view-class table-bordered" rowspan="5"><img
						src="upload/${ dto.add_img }"></td>
					<td class="view-class"><input id="add_idx" name="add_idx"
						type="hidden" value="${ dto.add_idx }"> <input
						id="add_title" name="add_title" type="hidden"
						value="${ dto.add_title }"> <input id="add_price"
						name="add_price" type="hidden" value="${ dto.add_price }">
						<input id="add_img" name="add_img" type="hidden"
						value="${ dto.add_img }">
						<h3>${ dto.add_title }</h3></td>
				</tr>
				<tr>
					<td class="view-class"><h3 name="add_price">${ dto.add_price }</h3></td>
				</tr>
				<tr>
					<td class="view-class"><h5>배송일: 1~2일 이내</h5>
						<h5>판매자 : Onetwo#</h5>
						<h5>택배사 : 대한통운</h5> <%
 String member_id3 = (String) session.getAttribute("member_id");
 String member_pw = (String) session.getAttribute("member_pw");//null체크
 if (member_id3 != null) { //로그인 상태
 %> <input type="hidden" id="member_id" name="member_id"
						value="<%=member_id3%>"> <input type="hidden"
						id="member_pw" name="member_pw" value="<%=member_pw%>"> <%
						}		else
						{  //로그아웃 상태
							%> <span></span> <%
							}
							
							
							%>
				</tr>
				<%
		String member_id = (String)session.getAttribute("member_id");
 %>
				<%
if (member_id != null) { //로그인 상태
 %>
				<tr>

					<td class="view-class"><select name="add_numb" id="add_numb"><c:forEach
								begin="1" end="99" var="i">
								<option value="${ i }">${ i }</option>
							</c:forEach></select>개</td>
				</tr>
				<tr>


					<td class="view-class"><input id="addCart_btn" type="submit"
						class="btn btn-primary" value="장바구니 담기"><span
						style="margin: 10px;"></span></td>
				</tr>

				<%
						}		else
						{  //로그아웃 상태
							%>
				<tr>
					<td class="view-class">로그인 해주세요<br />
					<a href="login"><button type="button" class="btn btn-primary">로그인</button></a></td>
				</tr>
				<%
							}
							
							
							%>

			</table>
		</form>
	</div>


	<hr
		style="height: 10px; color: gray; margin-top: 50px; margin-bottom: 50px;">

	<div
		class="content-detail d-flex flex-column  align-items-center  justify-content-center">
		<div>
			<p style="font-size: 32px;">제품 설명</p>
			<p style="text-align: center; font-size: 16px;">${ dto.add_content }</p>

		</div>
		<div style="margin-bottom: 150px;">
			<a href="items_list"><button class="btn btn-primary">목록으로</button></a>
		</div>
	</div>

</div>
