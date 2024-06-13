<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
 <div class="p-3 mb-2 display-3 text-center join">장바구니</div>
<div class="container">
	<div class="row">
		<table>
			<tr>
				<td align="left"><a href="emptyCart.jsp" class="btn btn-danger"
				onclick="if(!confirm('정말로 장바구니를 비우시겠스니까?')) return false;">삭제하기</a></td>
				<td align="right"><a href="shippingInfo.jsp" class="btn btn-success">주문하기</a></td>
			</tr>
		</table>
	</div>
	<div style="padding-top: 50px">
		<table class="table table-hover">
			<tr>
				<th>상품</th>
				<th>가격</th>
				<th>수량</th>
				<th>소계</th>
				<th>비고</th>
			</tr>
	<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("UTF-8");
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String id=request.getParameter("id");
		Integer price=0;
		Integer Qty=0;
		Integer total=0;
		Integer sum=0;
		String productId="";
		String memberId="";
		String name="";
		int cart_id=0;
		String sql="select c.productId,m.id,p.name,c.unitprice,sum(c.qty) from dakkucart c,dakkuproduct p,dakkumember m";
			   sql +=" where memberid=? and c.productId=p.productId and m.id=c.memberId group by c.productId,m.id,p.name,c.unitprice";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs=pstmt.executeQuery();
		while(rs.next()){
			productId=rs.getString(1);
			memberId=rs.getString(2);
			name=rs.getString(3);
			Qty=rs.getInt(5);
			price=rs.getInt(4);
			total=Qty*price;
			sum=sum+total;
		%>
		<tr>
			<td><%=productId %> - <%=name %></td>
			<td><%=price %></td>
			<td><%=Qty %></td>
			<td><%=total %></td>
			<td><a href="removeCart.jsp?productId=<%=productId %>" class="btn btn-danger"
			onclick="if(!confirm('해당 상품을 장바구니에서 비우시겠습니까?')) return false;" 
			style="height: 30px; font-size:0.7em;">삭제</a></td>
		</tr>
		
		<%
		}
	%>		
		<tr>
			<th></th>
			<th></th>
			<th>총액</th>
			<th><%=sum %></th>
			<th></th>
		</tr>
		</table>
		<a href="home.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
	</div>
	<hr>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>