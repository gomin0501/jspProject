<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀린다꾸</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="../../css/styles.css">
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
 <div class="p-3 mb-2 display-3 text-center join">내 정보 수정</div>
<div class="p-3 mb-2 bg-light text-dark">
	<div class="container">
		<form name="form" action="memberUpdateProcess.jsp" method="post" class="add-member">
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String id=request.getParameter("id");
	try{
		String sql="select id,password,name,gender,substr(birth,1,4),substr(birth,5,2),substr(birth,-2),mail,phone,address from dakkumember where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			id=rs.getString(1);
			String password=rs.getString(2);
			String name=rs.getString(3);
			String gender=rs.getString(4);
			String year=rs.getString(5);
			String month=rs.getString(6);
			String day=rs.getString(7);
			String mail=rs.getString(8);
			String phone=rs.getString(9);
			String address=rs.getString(10);
			
			String em[]=mail.split("@");
	
%>
			<div class="mb-3 row d-flex justify-content-center">
				<label class="col-sm-2 p-2">아이디</label>
				<div class="col-sm-5">
					<input type="text" name="id" class="form-control text-bg-light p-2" placeholder="아이디를 입력하세요" value="<%=id %>">
				</div>
			</div>
			<div class="mb-3 row d-flex justify-content-center">
				<label class="col-sm-2 p-2">비밀번호</label>
				<div class="col-sm-5">
					<input type="password" name="password" class="form-control text-bg-light p-2" placeholder="비밀번호를 입력하세요" value="<%=password %>">
				</div>
			</div>
			<div class="mb-3 row d-flex justify-content-center">
				<label class="col-sm-2 p-2">비밀번호 확인</label>
				<div class="col-sm-5">
					<input type="password" name="psCheck" class="form-control text-bg-light p-2" placeholder="비밀번호를 한 번 더 입력하세요">
				</div>
			</div>
			<div class="mb-3 row d-flex justify-content-center">
				<label class="col-sm-2 p-2">이 름</label>
				<div class="col-sm-5">
					<input type="text" name="name" class="form-control text-bg-light p-2" placeholder="이름을 입력하세요" value="<%=name %>">
				</div>
			</div>
			
			<div class="mb-3 row d-flex justify-content-center">
				<label class="col-sm-2 p-2">성 별</label>
				<div class="col-sm-5">
					<input type="radio" value="남" name="gender" <%=gender.equals("남") ? "checked" : "" %>>남
					<input type="radio" value="여" name="gender" <%=gender.equals("여") ? "checked" : "" %>>여
					<br>
				</div>
			</div>
			<div class="mb-3 row d-flex justify-content-center">
				<label class="col-sm-2 p-2">생년월일</label>
				<div class="col-sm-5">
					<input type="text" name="year" class="border border-secondary-subtle rounded-3" placeholder="연도(4자)" 
						style="width:20%;padding:8px;" value="<%=year %>">
					<select name="month" class="border border-secondary-subtle rounded-3" style="width:20%;padding:8px;">
	    			<option>월</option>
	    			<option value="01" <%if(month.equals("01")){ %> selected <% } %>>1</option>
	    			<option value="02" <%if(month.equals("02")){ %> selected <% } %>>2</option>
	    			<option value="03" <%if(month.equals("03")){ %> selected <% } %>>3</option>
	    			<option value="04" <%if(month.equals("04")){ %> selected <% } %>>4</option>
	    			<option value="05" <%if(month.equals("05")){ %> selected <% } %>>5</option>
	    			<option value="06" <%if(month.equals("06")){ %> selected <% } %>>6</option>
	    			<option value="07" <%if(month.equals("07")){ %> selected <% } %>>7</option>
	    			<option value="08" <%if(month.equals("08")){ %> selected <% } %>>8</option>
	    			<option value="09" <%if(month.equals("09")){ %> selected <% } %>>9</option>
	    			<option value="10" <%if(month.equals("10")){ %> selected <% } %>>10</option>
	    			<option value="11" <%if(month.equals("11")){ %> selected <% } %>>11</option>
	    			<option value="12" <%if(month.equals("12")){ %> selected <% } %>>12</option>
	    		</select>
	    		<input type="text" name="day" placeholder="일" class="border border-secondary-subtle rounded-3" 
	    			style="width:20%;padding:8px;" value="<%=day %>">
				</div>
			</div>
			<div class="mb-3 row d-flex justify-content-center">
				<label class="col-sm-2 p-2">이메일</label>
				<div class="col-sm-5">
					<input type="text" name="emailId" class="border border-secondary-subtle rounded-3 mb-3" placeholder="메일을 입력하세요" 
						style="width:40%;padding:8px" value="<%=em[0] %>">
					@
					<select name="email" class="border border-secondary-subtle rounded-3 mb-3" style="width:40%;padding:8px;">
			      		<option value="naver.com" <%if(em[1].equals("naver.com")){ %> selected <% } %>>naver.com</option>
			      		<option value="daum.net" <%if(em[1].equals("daum.net")){ %> selected <% } %>>daum.net</option>
			      		<option value="nate.com" <%if(em[1].equals("nate.net")){ %> selected <% } %>>nate.com</option>
			      		<option value="hotmail.com" <%if(em[1].equals("hanmail.com")){ %> selected <% } %>>hanmail.com</option>
			      		<option value="gmail.com" <%if(em[1].equals("gmail.com")){ %> selected <% } %>>gmail.com</option>
	      			</select>
				</div>
			</div>
			<div class="mb-3 row d-flex justify-content-center">
				<label class="col-sm-2 p-2">휴대폰 번호</label>
				<div class="col-sm-5">
					<input type="text" class="form-control text-bg-light p-2" placeholder="휴대폰 번호를 입력하세요" name="phone" value="<%=phone %>">
				</div>
			</div>
			<div class="mb-3 row d-flex justify-content-center">
				<label class="col-sm-2 p-2">주 소</label>
				<div class="col-sm-5">
					<input type="text" class="form-control text-bg-light p-2" placeholder="주소를 입력하세요" name="address" value="<%=address %>">
				</div>
			</div>
			<div class="d-grid gap-2 col-6 mx-auto">
				<button onclick="check()" type="submit" class="btn btn-join btn-fade" >수정하기</button>
			</div>
<%}
	
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
	}
%>
		</form>
	</div>
</div>
<script src="memberForm.js"></script>
</section>
<br>
<%@ include file="footer.jsp" %>
</body>
</html>