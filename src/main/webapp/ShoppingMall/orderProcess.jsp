<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	String sessionId=(String) session.getAttribute("sessionId");
	if(sessionId==null){
		%>
		<script>
			alert("로그인 후 이용가능합니다.");
			location.href="login.jsp";
		</script>
		<%
	}
		
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String productId=request.getParameter("id");
	String orderQty=request.getParameter("orderQty");
	
	try{
		String sql="select name,unitprice from dakkuproduct where productid=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,productId);
		rs=pstmt.executeQuery();
		
		String productName="";
		String unitPrice="";
		
		if(rs.next()){
			productName=rs.getString(1);
			unitPrice=rs.getString(2);
		}
		
		
		sql="insert into dakkuorder values(to_date(sysdate,'yyyy-mm-dd hh24:mi:ss'),?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,sessionId);
		pstmt.setString(2,productId);
		pstmt.setString(3,productName);
		pstmt.setString(4,unitPrice);
		pstmt.setString(5,orderQty);
		
		pstmt.executeUpdate();
		
		//재고값 바꾸기
		sql="update dakkuproduct set unitsinstock=unitsinstock-? where productid=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,Integer.parseInt(orderQty));
		pstmt.setString(2,productId);
		
		pstmt.executeUpdate();
		
		
	response.sendRedirect("orderList.jsp?id="+sessionId);
		%>
		<script>
			alert("주문이 완료되었습니다");
		</script>
	<%			
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
	}
%>
</body>
</html>