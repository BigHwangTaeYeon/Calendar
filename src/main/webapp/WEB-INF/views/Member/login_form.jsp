<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%-- <link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet" type="text/css" /> --%>
<title>Insert title here</title>
	<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script>
		function send(f) {
			let url = "login.do";
			let param = "id="+f.id.value+"&pwd="+f.pwd.value;
			sendRequest( url, param, resultFn, "POST" );
		}
		
		function resultFn() {
			
			if ( xhr.readyState == 4 && xhr.status == 200 ) {
				//no_id, no_pwd, clear 중 하나를 받는다
				let data = xhr.responseText;
				
				if( data == 'no_id' ) {
					alert("아이디가 없습니다");
				} else if ( data == 'no_pwd' ) {
					alert("비밀번호 불일치");
				} else {
					location.href = "calendar.do?m_id=${user.id}";
				}
			}
		}
	</script>
	<style>
		.login {margin-top:17%;}
	</style>
</head>
<body>

        <div class="login" align="center">
            <h3>LOGIN PAGE</h3>
            <form>
                <table border="1">
                    <tr>
                        <td><input class="login_input" type="text" name="id" placeholder="아이디" /></td>
                    </tr>
                    <tr>
                        <td><input class="login_input"  type="password" name="pwd" placeholder="비밀번호" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                        	
                            <input type="button" value="로그인" onclick="send(this.form);"/>
                            <input id="login_input2" type="button" value="회원가입" onclick="location.href='insert_form.do'"/>
                        </td>
                    </tr>
                </table>
           </form>
        </div>
</body>
</html>