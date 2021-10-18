<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.ArrayList"%>

<%
String member_id = (String) session.getAttribute("member_id");
%>

	<!-- 콘텐츠 -->
			<div class="main-content container col-md-9 ">
				<h3>｜제품후기</h3>
				<hr style="border: 1px solid rgb(211, 211, 211); width: 100%;">
				<input type="hidden" id="review_idx" name="review_idx"
					value="${ dto.review_idx }" />
				<table class="table">
					<tr>
					    <td width="35%">작성자</td><td colspan="2"> ${ dto.review_member_id }</td>
					    </tr>
					    <tr>
						<td>제목</td><td colspan="2"> ${ dto.review_title }</td>
						  </tr>
					    <tr>
						<td>상품명</td><td colspan="2"><img style="width:50px; height:50px;" src="/upload/${ dto.review_img }"> ${ dto.review_items }</td>
						  </tr>
					    <tr>
						<td>날짜</td><td colspan="2"> <fmt:formatDate value="${ dto.review_date }"
									pattern="yyyy.MM.dd" /></td>
					</tr>
					<tr>
						<td>내용</td><td colspan="2"> ${dto.review_content} </td>
					</tr>
<tr><td colspan="3" style="text-align:center; ">- 관리자 답변 -</td></tr>
<tr><td style="text-align:center; "></td><td style="">날짜</td><td style=" ">내용</td></tr>


						<c:forEach var="s_dto" items="${ s_reply_list }">
							<tr>
								<td>admin</td>
								<td><span class="date"><fmt:formatDate
											value="${s_dto.s_reply_date}" pattern="yyyy.MM.dd" /></span></td>
								<td>${s_dto.s_reply_content }</td>



							</tr>
						</c:forEach>
					</table>


				<hr style="border: 1px solid rgb(211, 211, 211); width: 100%;">
				<div id="listbtn" style="text-align:center;">
					<a href="shopping_review"><button class="listbtn btn btn-primary">목록</button></a>

				</div>
					<div id="btn" style="margin-top:30px;" class="d-flex flex-row justify-content-center">
					<% String review_member_id =  (String) session.getAttribute("review_member_id");						if (review_member_id.equals(member_id)) { 
						%>
			<a style="margin-right:20px;" href="shopping_review_modify?review_idx=${dto.review_idx}&member_id=<%=member_id%>">
				<input class="btn btn-secondary" type="button" value="수정" id="shopping_review_modify" />
			</a><span style="margin-right:25px;"></span><a href="shopping_review_delete?review_idx=${ dto.review_idx }">
				<input class="btn btn-secondary" type="button" value="삭제" id="shopping_review_delete" />
			</a>
			 <%
 } else {
 %> <%} %>
			
			
	</div>
			</div>


</body>
