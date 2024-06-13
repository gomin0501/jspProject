<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String sessionId=(String) session.getAttribute("sessionId"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%	

	try{
	request.setCharacterEncoding("UTF-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	Integer price=0;
	
	String productId=request.getParameter("id");
	
	sessionId=(String)session.getAttribute("sessionId");
	System.out.println("name:"+sessionId);
	if(sessionId==null){
		%>
		<script>
			alert("먼저 로그인 하세요");
			history.back();
		</script>
		<%
	}else{
		String sql="select max(cart_id) from dakkucart";
		pstmt=conn.prepareStatement(sql);
		int cart_id=0;
		rs=pstmt.executeQuery();
		if(rs.next()){
			cart_id=rs.getInt(1)+1;
		}else{
			cart_id=1;
		}
		System.out.println("Cart_id:"+cart_id);
		sql="select unitprice from dakkuproduct where productId=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,productId);
		rs=pstmt.executeQuery();
		if(rs.next()){
			price=rs.getInt(1);
		}
		int Qty=1;
		sql="insert into dakkucart(cart_id,memberid,productid,qty,unitprice) values(?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,cart_id);
		pstmt.setString(2,sessionId);
		pstmt.setString(3,productId);
		pstmt.setInt(4,Qty);
		pstmt.setInt(5,price);
		pstmt.executeUpdate();
		
		response.sendRedirect("productView.jsp?id="+productId);
	}
		}catch(Exception e){
			System.out.println("연결 오류");
			e.printStackTrace();
		}
	
			
%>
</body>
</html>