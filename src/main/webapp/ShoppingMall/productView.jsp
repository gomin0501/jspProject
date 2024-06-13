<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀린다꾸</title>
<script>
function CheckOrder(){
	let orderQty=document.getElementById("orderQty");
	if(orderQty.value.length==0 || isNaN(orderQty.value)){
		alert("[수량]\n숫자만 입력하세요");
		orderQty.select();
		orderQty.focus();
		return false;
	}
	document.order.submit();
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<div class="container">
<div class="row" align="center">
<%@ include file="dbconn.jsp" %>
		<%							   /* id라는 이름의 파라미터를 가져오기  */								
			String productId=request.getParameter("id");
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
		try{
			String sql="select * from dakkuproduct where productid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,productId);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				String name=rs.getString(2);
				String unitPrice=rs.getString(3);
				String desc=rs.getString(4);
				String category=rs.getString(5);
				String author=rs.getString(6);
				String unitsInstock=rs.getString(7);
				String filename=rs.getString(8);
			System.out.println("filename:"+filename); //이름 맞는지 확인하기
		%>
			<div class="col-md-3 d-inline product-div" style="margin-top: 35px;width:50%;">
				<img class="product-img" src="<%=request.getContextPath() %>/ShoppingMall/upload/<%=filename %>" style="width:100%;">
			</div>
			<div class="d-inline text-start mt-5" style="width:40%;margin-left:10%;">
				<form name="order" method="post" action="orderProcess.jsp">
					<input type="hidden" name="id" value="<%=productId %>">
					<h4 style="font-weight:bold"><%=name %></h4>
					<h4 style="color:#6f7575"><%=unitPrice %>원</h4>
					<hr>
					<p class="fs-6"><%=desc %></p>
					<p><span class="fw-bold">판매작가:</span> <%=author %></p>
					<p><span class="fw-bold">분류:</span> <%=category %></p>
					<p><span class="fw-bold">수량:</span>	
						<input type="text" id="orderQty" name="orderQty" placeholder="0">
					</p>
					<p><span class="fw-bold">재고 수:</span> <%=unitsInstock %></p>
				<br>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<input type="button" class="btn btn-join btn-fade me-md-2"
					rol="button" value="상품 주문 &raquo;" onclick="if(!confirm('상품을 주문하시겠습니까?')) return false;CheckOrder()">
					<a href="addCart.jsp?id=<%=productId %>" class="btn btn-secondary"
					rol="button" onclick="if(!confirm('상품을 장바구니에 추가하시겠습니까?')) return false;">장바구니 &raquo;</a>
					
			</div>
			</form>
		</div>
		
	</div>
<hr>
		<%
			}
		}catch(Exception e){
			System.out.println("연결 오류");
			e.printStackTrace();
		}
		%>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>