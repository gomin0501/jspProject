/**
 addboard폼* 
 */
function checkForm(){
	
	if(!document.newWrite.password.value){
		alert("비밀번호를 입력하시오.");
		return false;
	}
	if(!document.newWrite.subject.value){
		alert("제목을 입력하시오.");
		return false;
	}
	if(!document.newWrite.content.value){
		alert("내용을 입력하시오.");
		return false;
	}
}