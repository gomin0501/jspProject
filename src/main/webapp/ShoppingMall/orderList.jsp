<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀린다꾸</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
 <div class="p-3 mb-2 display-3 text-center join">주문내역</div>
<div class="container">
	
	<div style="padding-top: 50px">
		<table class="table table-hover">
			<tr>
				<th>주문날짜</th>
				<th>상품</th>
				<th>가격</th>
				<th>수량</th>
				<th>소계</th>
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
		String productName="";
		
		
		try{
		String sql="select to_char(orderdate,'yy-mm-dd'),orderid,productname,unitprice,sum(orderqty) from dakkuorder where orderid=?";
				sql +="group by orderdate,orderid,productname,unitprice,orderqty";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String orderDate=rs.getString(1);
			String orderId=rs.getString(2);
			productName=rs.getString(3);
			price=rs.getInt(4);
			Qty=rs.getInt(5);
			total=Qty*price;
			sum=sum+total;
		%>
		<tr>
			<td><%=orderDate %></td>
			<td><%=productName %></td>
			<td><%=price %></td>
			<td><%=Qty %></td>
			<td><%=total %></td>
			
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
		<%}catch(Exception e){
			System.out.println("연결 오류");
			e.printStackTrace();
		}
			%>
		</table>
	</div>
	<hr>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>