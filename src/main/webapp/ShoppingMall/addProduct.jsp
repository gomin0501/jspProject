<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀린다꾸</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/styles.css">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-3.7.1.min.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
 <div class="p-3 mb-2 display-3 text-center" >
 	<h3 style="font-weight:bold;">상품등록</h3></div>
<div class="container">
	<!-- action:폼을 memberProcess.jsp로 넘겨준다 -->
	<form name="newProduct" method="post" action="productProcess.jsp" enctype="multipart/form-data">
		<div class="mb-3 row d-flex justify-content-center">
			<label class="col-sm-2 p-2">상품코드</label>
			<div class="col-sm-5">
				<input type="text" name="productId" id="productId" class="form-control" placeholder="상품코드를 입력하세요">
			</div>
		</div>
		<div class="mb-3 row d-flex justify-content-center">
			<label class="col-sm-2 p-2">상품명</label>
			<div class="col-sm-5">
				<input type="text" id="name" name="name" class="form-control" placeholder="상품명을 입력하세요">
			</div>
		</div>
		<div class="mb-3 row d-flex justify-content-center">
			<label class="col-sm-2 p-2">가 격</label>
			<div class="col-sm-5">
				<input type="text" id="unitPrice" name="unitPrice" class="form-control" placeholder="가격을 입력하세요">
			</div>
		</div>
		<div class="mb-3 row d-flex justify-content-center">
			<label class="col-sm-2 p-2">상세정보</label>
			<div class="col-sm-5">
				<textarea name="description" cols="50" rows="2" class="form-control"></textarea>
			</div>
		</div>
		<div class="mb-3 row d-flex justify-content-center">
			<label class="col-sm-2 p-2">작가명</label>
			<div class="col-sm-5">
				<input type="text" id="author" name="author" class="form-control" placeholder="작가명을 입력하세요">
			</div>
		</div>
		<div class="mb-3 row d-flex justify-content-center">
			<label class="col-sm-2 p-2">분 류</label>
			<div class="col-sm-5">
				<input type="radio" value="sticker" name="category">스티커
				<input type="radio" value="masking" name="category">마스킹테이프
				<br>
			</div>
		</div>
		<div class="mb-3 row d-flex justify-content-center">
			<label class="col-sm-2 p-2">재고수</label>
			<div class="col-sm-5">
				<input type="text" name="unitsInstock" id="unitsInstock" class="form-control">
			</div>
		</div>
		<div class="mb-3 row d-flex justify-content-center">
			<label class="col-sm-2 p-2">상품 이미지</label>
			<div class="col-sm-5">
				<input type="file" name="productImage" class="form-control">
			</div>
		</div>
	    <div class="d-grid gap-2 col-6 mx-auto">
	    	<button onclick="CheckAddProduct()" class="btn btn-dark">상품 등록</button>
	    </div>
	</form>
</div><!-- container -->
<script src="productForm.js"> </script>

<%@ include file="footer.jsp" %>
</body>
</html>