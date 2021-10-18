<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%>

<link rel="stylesheet" href="/css/main.css">

<!-- 캐러셀 -->
<div class="container-fluid">
	<div id="demo" class="carousel slide align-center" data-ride="carousel">
		<div class="carousel-inner">
			<!-- 슬라이드 쇼 -->
			<div class="carousel-item active">
				<!--가로-->
				<img class="d-block w-100" src="./img/visual01.jpg"
					alt="First slide">
				<div class="carousel-caption">
					<div class="fadeInDown animated v-mt01">OneTwo#입니다.</div>
					<div class="fadeInDown animated v-mt02">회사 소개입니다.</div>
					<a href="introduce"><button
							class="learn-btn fadeInUp animated mv-btn d-none d-md-block">회사 소개</button></a>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="./img/visual02.jpg"
					alt="Second slide">
				<div class="carousel-caption">
					<div class="fadeInDown animated v-mt01">OneTwo#입니다.</div>
					<div class="fadeInDown animated v-mt02">판매상품 소개입니다.</div>
					<a href="items_list"><button
							class="learn-btn fadeInUp animated mv-btn d-none d-md-block">판매상품</button></a>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="./img/visual03.jpg"
					alt="Third slide">
				<div class="carousel-caption">
					<div class="fadeInDown animated v-mt01">OneTwo#입니다.</div>
					<div class="fadeInDown animated v-mt02">공지사항입니다.</div>
					<a href="user_notice"><button
							class="learn-btn fadeInUp animated mv-btn d-none d-md-block">공지사항</button></a>
				</div>
			</div>
			<!-- / 슬라이드 쇼 끝 -->
			<!-- 왼쪽 오른쪽 화살표 버튼 -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<!-- <span>Previous</span>  -->
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<!-- <span>Next</span>  -->
			</a>
			<!-- / 화살표 버튼 끝 -->
			<!-- 인디케이터 -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<!--0번부터시작-->
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>
			<!-- 인디케이터 끝 -->
		</div>
	</div>
</div>

<div style="margin-top:150px;"></div>
<div id="mainItems" style="margin-left:30px; margin-right:30px;">

<h1 style="text-align:center;">판 매 상 품</h1>
	<c:set var="i" value="0" />
	<c:set var="j" value="5" />
	<table class="table" style="border-color:#F2F2F2; text-align:center;">
	  <c:forEach items="${list }" var="dto">
	    <c:if test="${i%j == 0 }">
	    <tr>
	    </c:if>
	       <td><a href="items_view?add_idx=${ dto.add_idx }"><img style="margin:20px; width: 200px; height:200px;" src="/upload/${dto.add_img }"><br />${ dto.add_title } <br /> ${ dto.add_price }원</a></td>
	       
	    <c:if test="${i%j == j-1 }">
	    </tr>
	    </c:if>
	    <c:set var="i" value="${i+1 }" />
	  </c:forEach>
	</table>
	
</div>


