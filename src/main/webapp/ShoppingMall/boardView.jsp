<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀린다꾸</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/styles.css">
<style>
	.reply-toggle{
		position:relative;
	}
	.btn-reply{
		position:absolute;
		right:0;
		
	}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="dbconn.jsp" %>
	<div class="container">
		<div class="row" align="center">
<%
	PreparedStatement pstmt=null;
	String sql="";
	ResultSet rs=null;
	String rst="";
	String msg="";
	int num=Integer.parseInt(request.getParameter("num"));
	
	try{
		sql="select * from dakkuboard where num=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,num);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			String id=rs.getString(2);
			String name=rs.getString(3);
			String subject=rs.getString(5);
			String content=rs.getString(6);
			String filename=rs.getString(7);
			String regi_day=rs.getString(8);
			int hit=rs.getInt(9);
			hit++;
		%>
<div class="p-3 mb-2 display-5 text-start">[<%=subject %>]</div>
<div style="padding-top:20px">
<table class="table table-hover">
	
	<tr>
		<td class="col1" width="20%">글번호</td>
		<td class="col2"><input type="hidden" name="id" value="<%=id %>"><%=num %></td>
	</tr>
	<tr>
		<td class="col1">조회수</td>
		<td class="col2"><%=hit %></td>
	</tr>
	<tr>
		<td class="col1">아이디</td>
		<td class="col2"><%=id %></td>
	</tr>
	<tr>
		<td class="col1">작성일</td>
		<td class="col2"><%=regi_day %></td>
	</tr>
	<tr>
		<td colspan="2">
			<figure>
				<img src="<%=request.getContextPath() %>/ShoppingMall/upload/<%=filename %>" style="width:70%">
			</figure>
			<%=content %>				
		</td>		
	
</table>
	</div>
	</div>
	<div class="form-group row">
		 	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		 		<a href="boardUpdate.jsp?num=<%=num %>" class="btn me-md-2 btn-join btn-fade">수정</a>
				<a href="dakkuBoard.jsp" class="btn btn-secondary">목록</a>
		 	</div>
		</div>
<%
	sql="update dakkuboard set hit=? where num=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,hit);
	pstmt.setInt(2,num);
	pstmt.executeUpdate();
	
	System.out.println("num:"+num);
	%>
	<div class="container reply" style="margin-top:50px;background:#f0eeeb;">
	<form name="reply" method="post" style="margin:0 auto;" class="row row-cols-lg-auto g-3 align-items-center" 
		action="replyProcess.jsp">
		<div class="input-group" style="margin-top:50px">
			<input name="boardnum" type="hidden" value="<%=num %>">
		 	<textarea name="memo" cols="100" rows="2" class="form-control"	placeholder="댓글 쓰기"></textarea>
   			<button type="submit" class="btn btn-outline-secondary">댓글 쓰기</button>
		 </div>
	</form>
<%		}
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
	}
%>	
	<%	
	try{
		
		sql="select count(*) from reply where boardnum=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,num);
		rs=pstmt.executeQuery();
		
		
		int cnt=0;
		if(rs.next()){
			cnt=rs.getInt(1);
		}else{
			cnt=0;
		}
		
	%>
		<p style="margin-top:20px">댓글 : <%=cnt %>개</p>
	<%
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
	}%>
	<%
	try{
		sql="select * from reply where boardnum=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,num);
		rs=pstmt.executeQuery();
		
		while(rs.next()){
			int repNum=rs.getInt(1);
			String id=rs.getString(2);
			String memo=rs.getString(3);
			String time=rs.getString(4);
			int boardNum=rs.getInt(5);
			%>
			<input type="hidden" name="repNum" value="<%=repNum %>">
			<input type="hidden" name="boardnum" value="<%=boardNum %>">
			
		<div style="font-weight:bold;"><%=id %></div>
			<div><%=memo %></div>
			<div style="font-size:small;">
				<%=time %>
			</div>
		<div class="position-relative">	
			<div class="position-absolute bottom-0 end-0">
			<a href="replyDelete.jsp?num=<%=repNum %>&boardnum=<%=boardNum %>" class="btn btn-outline-secondary"
				onclick="if(!confirm('삭제할까요?')) return false;">삭제</a>
			</div>
		</div>
	<hr>
				
	<%	}
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