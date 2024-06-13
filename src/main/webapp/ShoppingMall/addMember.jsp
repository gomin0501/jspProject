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
 <div class="p-3 mb-2 display-3 text-center join">회원가입</div>
<div class="p-3 mb-2 bg-light text-dark">
	<div class="container">
		<form name="form" action="memberProcess.jsp" method="post" class="add-member">
			<div class="mb-3 row d-flex justify-content-center">
				<label class="col-sm-2 p-2">아이디</label>
				<div class="col-sm-5">
					<input type="text" name="id" class="form-control text-bg-light p-2" placeholder="아이디를 입력하세요">
				</div>
			</div>
			<div class="mb-3 row d-flex justify-content-center">
				<label class="col-sm-2 p-2">비밀번호</label>
				<div class="col-sm-5">
					<input type="password" name="password" class="form-control text-bg-light p-2" placeholder="비밀번호를 입력하세요">
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
					<input type="text" name="name" class="form-control text-bg-light p-2" placeholder="이름을 입력하세요">
				</div>
			</div>
			
			<div class="mb-3 row d-flex justify-content-center">
				<label class="col-sm-2 p-2">성 별</label>
				<div class="col-sm-5">
					<input type="radio" value="남" name="gender">남
					<input type="radio" value="여" name="gender">여
					<br>
				</div>
			</div>
			<div class="mb-3 row d-flex justify-content-center">
				<label class="col-sm-2 p-2">생년월일</label>
				<div class="col-sm-5">
					<input type="text" name="year" class="border border-secondary-subtle rounded-3" placeholder="연도(4자)" style="width:20%;padding:8px;">
					<select name="month" class="border border-secondary-subtle rounded-3" style="width:20%;padding:8px;">
	    			<option>월</option>
	    			<option value="01">1</option>
	    			<option value="02">2</option>
	    			<option value="03">3</option>
	    			<option value="04">4</option>
	    			<option value="05">5</option>
	    			<option value="06">6</option>
	    			<option value="07">7</option>
	    			<option value="08">8</option>
	    			<option value="09">9</option>
	    			<option value="10">10</option>
	    			<option value="11">11</option>
	    			<option value="12">12</option>
	    		</select>
	    		<input type="text" name="day" placeholder="일" class="border border-secondary-subtle rounded-3" style="width:20%;padding:8px;">
				</div>
			</div>
			<div class="mb-3 row d-flex justify-content-center">
				<label class="col-sm-2 p-2">이메일</label>
				<div class="col-sm-5">
					<input type="text" name="emailId" class="border border-secondary-subtle rounded-3 mb-3" placeholder="메일을 입력하세요" style="width:40%;padding:8px">
					@
					<select name="email" class="border border-secondary-subtle rounded-3 mb-3" style="width:40%;padding:8px;">
			      		<option value="naver.com">naver.com</option>
			      		<option value="daum.net">daum.net</option>
			      		<option value="nate.com">nate.com</option>
			      		<option value="hotmail.com">hanmail.com</option>
			      		<option value="gmail.com">gmail.com</option>
	      			</select>
				</div>
			</div>
			<div class="mb-3 row d-flex justify-content-center">
				<label class="col-sm-2 p-2">휴대폰 번호</label>
				<div class="col-sm-5">
					<input type="text" class="form-control text-bg-light p-2" placeholder="휴대폰 번호를 입력하세요" name="phone">
				</div>
			</div>
			<div class="mb-3 row d-flex justify-content-center">
				<label class="col-sm-2 p-2">주 소</label>
				<div class="col-sm-5">
					<input type="text" class="form-control text-bg-light p-2" placeholder="주소를 입력하세요" name="address">
				</div>
			</div>
			<div class="d-grid gap-2 col-6 mx-auto">
				<button onclick="check()" type="submit" class="btn btn-join btn-fade" >가입하기</button>
			</div>
		</form>
	</div>
</div>
<script src="memberForm.js"></script>
</section>
<br>
<%@ include file="footer.jsp" %>
</body>
</html>