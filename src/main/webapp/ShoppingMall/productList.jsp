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
<div class="p-3 mb-2 display-3 text-center" >
 	<h3 style="font-weight:bold;">상품목록</h3></div>
<section>
<div class="container">
<%@ include file="dbconn.jsp" %>
	<div style="padding-top: 50px">
		<table class="table table-hover">
			<tr>
				<th>상품코드</th>
				<th>상품명</th>
				<th>가격</th>
				<th>상세정보</th>
				<th>작가</th>
				<th>분류</th>
				<th>재고수</th>
				<th>파일명</th>
			</tr>
<%
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
	try{
		String sql="select * from dakkuproduct";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		//database table에서 하나하나 가져오기
		while(rs.next()){
			String pid=rs.getString("productid");
			String name=rs.getString("name");
			String price=rs.getString("unitprice");
			String desc=rs.getString("description");
			String cate=rs.getString("category");
			if(cate.equals("sticker")){cate="스티커";}
			else if(cate.equals("masking")){cate="마스킹 테이프";}
			String author=rs.getString("author");
			String instock=rs.getString("unitsinstock");
			String file=rs.getString("filename");
		
	%>
		<tr>
			<td><a href="productUpdate.jsp?productId=<%=pid %>"><%=pid %></a></td>
			<td><%=name %></td>
			<td><%=price %></td>
			<td><%=desc %></td>
			<td><%=cate %></td>
			<td><%=author %></td>
			<td><%=instock %></td>
			<td><%=file %></td>
			<td>
			<a href="productDelete.jsp?productId=<%=pid %>" class="btn btn-danger"
			onclick="if(!confirm('상품을 삭제하시겠습니까?')) return false;">삭제</a>
							<!-- 쌍따옴표 안에 쌍따옴표가 들어가면 오류가 뜨기 때문에 단따옴표로 confirm문장처리 --> 
		</td>
		</tr>
		<%}
			}catch(Exception e){
				System.out.println("연결 오류");
				e.printStackTrace();
				}%>
		</table>
	</div>
</div><!-- container -->
</section>
<%@ include file="footer.jsp" %>
</body>
</html>