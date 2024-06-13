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
<div class="container">
	<div class="p-3 mb-2 display-3 text-center login">⭐new⭐</div>
	<div class="row" align="center">
	
		<%@ include file="dbconn.jsp" %>
		<%
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
		try{
			String sql="select * from dakkuproduct";
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
		<div class="col-md-3 product" style="margin:30px 10px 70px;">
			<img src="<%=request.getContextPath() %>/ShoppingMall/upload/<%=filename %>" class="item-image">
			<p class="item"><%=unitPrice %>원</p>
			<p class="item-name"><%=name %></p>
			<small class="item-desc"  style="line-height:12px;font-size:smaller;"><%=description %></small>
			<p>                      <!-- 이 id라는 이름으로 파라미터로 넘겨준다 -->
				<a href="productView.jsp?id=<%=productId %>" class="btn btn-outline-info" style="margin:20px 0;"
					rol="button">상세 정보&raquo;</a>
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
<%@ include file="footer.jsp" %>
</body>
</html>