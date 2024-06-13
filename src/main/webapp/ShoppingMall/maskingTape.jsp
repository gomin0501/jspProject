<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀린다꾸</title>
<link rel="stylesheet" href="../css/styles.css">
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<div class="container">
	<div class="p-3 mb-2 display-3 text-center login">마스킹 테이프</div>
	<div class="row" align="center">
	
		<%@ include file="dbconn.jsp" %>
		<%
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
		try{
			String sql="select * from dakkuproduct where category LIKE 'masking'";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				String productId=rs.getString(1);
				String name=rs.getString(2);
				String unitPrice=rs.getString(3);
				String description=rs.getString(4);
				String filename=rs.getString(8);
			System.out.println("filename:"+filename); //이름 맞는지 확인하기
		%>
		<div class="col-md-3 sticker" style="margin:30px 0;">
			<img src="<%=request.getContextPath() %>/ShoppingMall/upload/<%=filename %>" class="sticker-image">
			<p class="item"><%=unitPrice %>원</p>
			<p class="item-name"><%=name %></p>
			<small class="item-desc"><%=description %></small>
			<p><a href="productView.jsp?id=<%=productId %>" class="btn btn-outline-info" style="margin-top:10px;"
					role="button">상세 정보&raquo;</a>
			</p>
		</div>
		<%
			}
		}catch(Exception e){
			System.out.println("연결 오류");
			e.printStackTrace();
		}
		%>
	</div>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>