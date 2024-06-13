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
 	<h3 style="font-weight:bold;">상품수정</h3></div>
<div class="container">
<%@ include file="dbconn.jsp" %>
<%
	String fileName="";
	try{
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String productId=request.getParameter("productId");
		String sql="select * from dakkuproduct where productid=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,productId);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			String name=rs.getString("name");
			String unitPrice=rs.getString("unitPrice");
			String description=rs.getString("description");
			String category=rs.getString("category");
			String author=rs.getString("author");
			String unitsInstock=rs.getString("unitsInstock");
			fileName=rs.getString("filename");
			%>
	<form name="newProduct" method="post" action="productUpdateProcess.jsp" enctype="multipart/form-data">
		<div class="mb-3 row d-flex justify-content-center">
			<label class="col-sm-2 p-2">상품코드</label>
			<div class="col-sm-5">
				<input type="text" name="productId" id="productId" class="form-control" 
					placeholder="상품코드를 입력하세요" value="<%=productId %>">
			</div>
		</div>
		<div class="mb-3 row d-flex justify-content-center">
			<label class="col-sm-2 p-2">상품명</label>
			<div class="col-sm-5">
				<input type="text" id="name" name="name" class="form-control" 
					placeholder="상품명을 입력하세요" value="<%=name %>">
			</div>
		</div>
		<div class="mb-3 row d-flex justify-content-center">
			<label class="col-sm-2 p-2">가 격</label>
			<div class="col-sm-5">
				<input type="text" id="unitPrice" name="unitPrice" class="form-control" 
					placeholder="가격을 입력하세요" value="<%=unitPrice %>">
			</div>
		</div>
		<div class="mb-3 row d-flex justify-content-center">
			<label class="col-sm-2 p-2">상세정보</label>
			<div class="col-sm-5">
				<textarea name="description" cols="50" rows="2" class="form-control"><%=description %></textarea>
			</div>
		</div>
		<div class="mb-3 row d-flex justify-content-center">
			<label class="col-sm-2 p-2">작가명</label>
			<div class="col-sm-5">
				<input type="text" id="author" name="author" class="form-control" 
					placeholder="작가명을 입력하세요" value="<%=author %>">
			</div>
		</div>
		<div class="mb-3 row d-flex justify-content-center">
			<label class="col-sm-2 p-2">분 류</label>
			<div class="col-sm-5">
				<input type="radio" value="sticker" name="category" 
					<%=category.equals("sticker")? "checked":""%>>스티커
				<input type="radio" value="masking" name="category"
					<%=category.equals("masking")? "checked":""%>>마스킹테이프
				<br>
			</div>
		</div>
		<div class="mb-3 row d-flex justify-content-center">
			<label class="col-sm-2 p-2">재고수</label>
			<div class="col-sm-5">
				<input type="text" name="unitsInstock" id="unitsInstock" 
					class="form-control" value="<%=unitsInstock %>">
			</div>
		</div>
		<div class="mb-3 row d-flex justify-content-center">
			<label class="col-sm-2 p-2">상품 이미지</label>
			<div class="col-sm-5">
				<input type="file" name="productImage" class="form-control"><%=fileName %>
			</div>
		</div>
	    <div class="d-grid gap-2 col-6 mx-auto">
	    	<button onclick="CheckAddProduct()" class="btn btn-dark">상품 수정</button>
	    </div>
	<%	}
		
	}catch(Exception e){
		System.out.println("productUpdate 오류");
		e.printStackTrace();
	}
%>
	</form>
</div><!-- container -->
<script src="productForm.js"> </script>

<%@ include file="footer.jsp" %>
</body>
</html>