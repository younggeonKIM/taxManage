<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, payer.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="taxStyle.css">
</head>
<body>
<header>
	<h1 align="center">세금 관리 시스템 ver1.0</h1>
</header>
<menu>
	<jsp:include page="tax_menu.jsp"/>
</menu>
<section>
	<h2 align="center">회원 등록하러 오셨군요!</h2>
<%
Members mems=(Members)request.getAttribute("MEM");
%>
<div class="btns4">
<form action="memInsert.do" method="post" name="frm" onSubmit="return checkck(this)">
<input type="hidden" name="NAMECFM" value="<%= mems.getName() %>"/>
<table>
	<tr><th>계정 : </th><td><input type="text" name="ID" value="<%= mems.getId() %>" readonly/></td></tr>
	<tr><th>비밀번호 : </th><td><input type="password" name="PWD" id="PWD"/></td></tr>
	<tr><th>비밀번호 확인 : </th><td><input type="password" name="PWDCHK" id="PWDCHK"/></td></tr>
	<tr><th>성명 : </th><td><input type="text" name="NAME" id="NAME" value="<%= mems.getName() %>" /></td></tr>
	<tr><td colspan="2"><input type="submit" value="회원등록"/></td></tr>
</table>
</form>
</div>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>
<script type="text/javascript">
function checkck(f) {
	if(f.PWD.value=='') {
		alert("사용하실 비밀번호를 입력해주세요.");
		return false;
	}
	if(isNaN(f.PWD.value)==true){
		alert("비밀번호는 숫자만 입력 가능합니다.");
		return false;
	}
	if(f.PWD.value!=f.PWDCHK.value) {
		alert("비밀번호를 확인해주세요.");
		return false;
	}
	if(f.NAME.value==''){
		alert("성명을 입력해주세요.");
		return false;
	}
	if(f.NAME.value!=f.NAMECFM.value){
		alert("납부한 사실이 있는 분만 회원으로 등록할 수 있습니다.");
		return false;
	}
	if(confirm("정말로 등록하시겠습니까?")){
		return true;
	}else{
		return false;
	}
}
</script>
</body>
</html>