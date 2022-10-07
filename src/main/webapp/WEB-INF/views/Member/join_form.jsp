<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/css/join.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script type="text/javascript">
let is_id = false;
function id_check(f) {

	let url = "id_check.do";

	let param = "id="+f.id.value;

	sendRequest(url, param, resultFn, "POST");
	
}

function resultFn() {
	
	if ( xhr.readyState == 4 && xhr.status == 200 ) {
			
		let data = xhr.responseText;
		
		if( data == "no" ) {
			alert("중복된 아이디 입니다.");
		} else if( data == "yes")  {
			alert("사용가능한 아이디 입니다.");
			is_id = true;
		} else{
			alert("아이디를 입력하세요.");
		}
	}
}

function send(f){
	
	let id = f.id.value;
	let pwd = f.pwd.value;
	let name = f.name.value;
	let age = f.age.value;
	let gene = f.gene.value;
	let email = f.email.value;
	let phone = f.phone.value;
	//유효성 체크 
	let idcheck = /^[a-zA-Z0-9]{4,12}$/; //4~12자 영문소문자, 숫자, 언더라인(_) 사용가능
	let pwdcheck =  /^[A-Za-z0-9]{4,10}$/; //영문과 숫자로 이루어진 4자리에서 10자리의 비밀번호
	let emailcheck =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	let phonecheck = /^\d{3}-\d{3,4}-\d{4}$/; //3자리/ 3,4자리 / 4자리 숫자
	
	if(is_id == false){
		alert("아이디 중복체크를 해주세요.");
		return;
	}
	
	if(!idcheck.test(f.id.value)){
		alert("4~12자 영문소문자, 숫자, 언더라인(_)사용가능에 맞게 입력해주세요");
		return;
	}
	if( !pwdcheck.test(f.pwd.value) ) {
		alert("비밀번호 형식을 확인하세요");
		return;
	}

	if(!emailcheck.test(f.email.value)){
		alert("정확한 이메일을 입력해주세요");
		return;
	}
	if(!phonecheck.test(f.phone.value)){
		alert("알맞은 핸드폰 번호를 입력해주세요");
		return;
	}

	f.action="insert.do";
	f.method="post";
	f.submit();
}

	
</script>
</head>
<body>
<div align="center">
	<h2 id="title">회원가입</h2>
	<form>
		<table id="join_table" border="1" >
			<tr>
				<td><p id="p_tag">아이디</p><input id="input" class="input" type="text" name="id" required="required" placeholder="아이디를 입력하시오">
				<input margin-left = "100" align="center" type="button"  value="중복체크" onclick="id_check(this.form);" ></td>
			</tr>
			<tr>
				<td><p id="p_tag">비밀번호</p><input class="input" type="password" name="pwd" required="required" placeholder="비밀번호를 입력하시오"></td>
			</tr>
			<tr>
				<td><p id="p_tag">이름</p><input class="input" type="text" name="name" required="required" placeholder="이름을 입력하시오"></td>
			</tr>
			<tr>
				<td><p id="p_tag">나이</p><input class="input" type="number" name="age" required="required" min="0" placeholder="나이를 입력하시오"></td>
			</tr>
			<tr>
				<td>
				<input type="radio" class="btn-check" name="gene" id="option1" autocomplete="off" value="남" checked>
				<label class="btn btn-primary btn_gene" for="option1">남자</label>
				
				<input type="radio" class="btn-check" name="gene" id="option2" autocomplete="off" value="여">
				<label class="btn btn-danger btn_gene" for="option2">여자</label>
				</td>
			<tr>
				<td><p id="p_tag">이메일주소</p><input class="input" type="text" name="email" maxlength="30" placeholder="이메일의 형식은 ****@****.*** 입니다."/></td>
			</tr>
			<tr>
				<td><p id="p_tag">핸드폰번호</p><input class="input" type="text" name="phone" required="required" placeholder="핸드폰 번호를 입력하시오"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" class="btn-group" role="group" aria-label="Basic outlined example">
					<input type="submit" class="btn btn-outline-primary btn_login" value="회원가입" onclick="send(this.form);">
					<input type="reset" class="btn btn-outline-primary btn_login" value="다시 작성">
					<input type="button" class="btn btn-outline-primary btn_login" value="로그인" onclick="location.href='login_form.do'">
				</td>
			</tr>
		</table>
	</form>
</div>
				

</body>
</html>