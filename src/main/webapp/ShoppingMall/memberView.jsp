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
<div class="row" align="center">
<%@ include file="dbconn.jsp" %>
<%
	String id=request.getParameter("id");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		String sql="select * from dakkumember where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			String name=rs.getString(3);
			String gender=rs.getString(4);
			String birth=rs.getString(5);
			String mail=rs.getString(6);
			String phone=rs.getString(7);
			String address=rs.getString(8);
		%>
<div style="padding-top:50px">
<table class="table table-hover" style="width:60%;">
	
	<tr>
		<td class="col1">아이디</td>
		<td class="col2"><%=id %></td>
	</tr>
	<tr>
		<td class="col1">이름</td>
		<td class="col2"><%=name %></td>
	</tr>
	<tr>
		<td class="col1">성별</td>
		<td class="col2"><%=gender %></td>
	</tr>
	<tr>
		<td class="col1">생년월일</td>
		<td class="col2"><%=birth %></td>
	</tr>
	<tr>
		<td class="col1">메일</td>
		<td class="col2"><%=mail %></td>
	</tr>
	<tr>
		<td class="col1">휴대폰 번호</td>
		<td class="col2"><%=phone %></td>
	</tr>
	<tr>
		<td class="col1">주소</td>
		<td class="col2"><%=address %></td>
	</tr>
	
</table>	
	<div class="d-grid gap-2 d-md-flex justify-content-md-center">
		<a href="memberUpdate.jsp?id=<%=id %>" class="btn btn-join btn-fade" >수정하기</a>
		<a href="memberDelete.jsp?id=<%=id %>" class="btn btn-secondary" 
			onclick="if(!confirm('탈퇴 하시겠습니까?')) return false;">탈퇴하기</a>
	</div>		
	<%}
		
		
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
	}
%>
</div>
</div>
</div>
<%@ include file="footer.jsp" %>
</body>
<script>
	function check()
</script>
</html>