<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.ArrayList"%>

<%
String member_id = (String) session.getAttribute("member_id");
%>
<div class="main-content container col-md-9">
 				<div class="container container-fluid" style="margin-top:30px;">
					<table style="text-align: center;" class="table table-bordered">
				<tr>
					<td><h5>제품후기</h5>
						<h6>제품후기를 남겨주세요.</h6>
						</td>
				</tr>
			</table>
		</div>
 		
	<div id="shoppingSearch" class="shoppingSearch">
	<select style="width:75px; height:38px;" id="searchType" name="searchType">
		<option value="title"
			<c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
		<option value="name"
			<c:if test="${page.searchType eq 'name'}">selected</c:if>>상품명</option>
		<option value="content"
			<c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
	</select> <input type="search" id="keyword" name="keyword" value="${ keyword }"
		class="searchbar">
	<button id="searchButton" class="btn btn-secondary">
		검색</button>
</div>
			<!-- 주문관리 테이블 -->
			<table class="table">
				<thead>
					<tr>
					    
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">상품명</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
						
					</tr>
				</thead>
				<tbody>
						<c:forEach var="dto" items= "${ list }">
					<tr>
						<td>${ dto.review_idx }</td>
						<td><a href="shopping_review_view?review_idx=${ dto.review_idx }"><img style="width:50px; height:50px;" src="/upload/${ dto.review_img }">${dto.review_title}</a></td>
						<td>${ dto.review_items }</td>
						<td>${ dto.review_member_id }</td>
						<td><fmt:formatDate value="${ dto.review_date }"
									pattern="yyyy.MM.dd" /></td>

					</tr>
</c:forEach>
				</tbody>
			</table>
		

				<!-- 페이지 네비게이션 -->

		<div style="display: block; text-align: center;">


			<c:if test="${page.prev}">
				<span>[ <a
					href="/shopping_review?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a>
					]
				</span>
			</c:if>

			<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
				var="num">
				<span> <c:if test="${select != num}">
						<a href="/shopping_review?num=${num}${page.searchTypeKeyword}">${num}</a>
					</c:if> <c:if test="${select == num}">
						<b>${num}</b>
					</c:if>

				</span>
			</c:forEach>

			<c:if test="${page.next}">
				<span>[ <a
					href="/shopping_review?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a>
					]
				</span>
			</c:if>



		</div>
<div id="btn" class="container container-fluid d-flex flex-row justify-content-center" style="margin-top:30px;">
	<a href="shopping_review_write?member_id=<%=member_id%>">
		<input class="btn btn-primary" type="button" value="글쓰기" id="shopping_review_write" />
	</a>
</div>
		</div>


<script>
	document.getElementById("searchButton").onclick = function() {

		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword = document.getElementsByName("keyword")[0].value;

		location.href = "/shopping_review?num=1" + "&searchType=" + searchType
				+ "&keyword=" + keyword;
	};
</script>