//addMember스크립트

function check(){
		
		if(document.form.id.value==""){
			alert("아이디를 입력하세요.");
			document.form.id.focus();
			return false;
		}
		if(document.form.password.value==""){
			alert("비밀번호를 입력하세요.");
			document.form.password.focus();
			return false;
		}
		if(document.form.psCheck.value==""){
			alert("확인 비밀번호를 입력하세요.");
			document.form.psCheck.focus();
			return false;
		}
		if(document.form.password.value != document.form.psCheck.value){
			alert("비밀번호를 동일하게 입력하세요.")
		}
		
		if(document.form.name.value==""){
			alert("이름을 입력하세요.");
			document.form.name.focus();
			return false;
		}
		
		if(document.form.year.value==""){
			alert("생일을 입력하세요");
			document.form.year.focus();
			return false;
		}
		if(document.form.emailId.value==""){
		alert("이메일을 입력하세요");
		document.form.emailId.focus();
		return false;
	}	
	if(document.form.phone.value==""||document.form.phone.value.length !=13){
		alert("전화번호를 입력하세요");
		document.form.ph1.focus();
		return false;
	}
	
	if(document.form.address.value==""){
		alert("주소를 입력하세요");
		document.form.address.focus();
		return false;
	}
}