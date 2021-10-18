<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%>

<link rel="stylesheet" href="/css/main.css">
		<div class="container container-fluid" style="margin-top:30px;">
					<table style="text-align: center;" class="table table-bordered">
				<tr>
					<td><h5>판매상품입니다.</h5>
						<h6>궁금한 사항이나 불편한 사항은 저희 고객센터로 전화주시거나 1:1문의로 남겨주세요.</h6>
						<h6>친절히 안내해 드립니다.</h6></td>
				</tr>
			</table>
		</div>

<div class="d-flex flex-column justify-content-center align-items-center">
			<!-- 공지사항 검색 -->
			<div id="addSearch" class="addSearch d-flex justify-content-center" style="margin-top:35px;">
					<select id="searchType" name="searchType">
						<option value="title"
							<c:if test="${page.searchType eq 'title'}">selected</c:if>>상품명</option>
						<option value="numb"
							<c:if test="${page.searchType eq 'numb'}">selected</c:if>>번호</option>
					</select>
					 <input type="search" id="keyword" name="keyword"
						value="${ keyword }" class="searchbar">
					<button type="submit" id="searchButton" class="btn btn-secondary">
						검색</button>
			</div>

<div id="mainItems" class="col-md-9 d-flex justify-content-center" style="margin-left:5px; margin-right:5px; margin-top:50px;">
	<c:set var="i" value="0" />
	<c:set var="j" value="5" />
	<table border="1" class="table table-bordered" style="table-layout: fixed; border-color:#F2F2F2; text-align:center;">
	  <c:forEach items="${list }" var="dto">
	    <c:if test="${i%j == 0 }">
	    <tr>
	    </c:if>
	       <td style="padding:10px;"><a href="items_view?add_idx=${ dto.add_idx }"><img style="width:100px; height:100px;" src="/upload/${dto.add_img }"><br />${ dto.add_title } <br /> ${ dto.add_price }원</a></td>
	       
	    <c:if test="${i%j == j-1 }">
	    </tr>
	    </c:if>
	    <c:set var="i" value="${i+1 }" />
	  </c:forEach>
	</table>
	
</div>

	
			<div style="display: block; text-align: center;">
			
			
				<c:if test="${page.prev}">
		<span>[ <a href="/items_list?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a> ]</span>
	</c:if>
	
	<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
		<span>
		
			<c:if test="${select != num}">
				<a href="/items_list?num=${num}${page.searchTypeKeyword}">${num}</a>
			</c:if> 			
			
			<c:if test="${select == num}">
				<b>${num}</b>
			</c:if>
	 			
		</span>
	</c:forEach>
	
	<c:if test="${page.next}">
		<span>[ <a href="/items_list?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a> ]</span>
	</c:if>
			
		
				
				
			</div>
			
	</div>		
			
			<script>

	document.getElementById("searchButton").onclick = function () {
		  
		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword =  document.getElementsByName("keyword")[0].value;
		
		location.href = "/items_list?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
	};
</script>
