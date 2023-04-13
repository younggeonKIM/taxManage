<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<%
	String m=request.getParameter("M");
	if("Y".equals(m)) {
%>
<script type="text/javascript">
		alert("서비스를 이용하시려면, 로그인해야 합니다.");
</script>
<%
} else if("ADM".equals(m)){
%>
<script type="text/javascript">
		alert("관리자만이 등록 가능합니다.");
		location.href="tax_logout.do";
		location.href="tax_login.jsp";
</script>
<%
			
}
%>
	<h2 align="center">로그인 해주십시오.</h2>
	<div class="btns">
	<form action="loginMemSel.do" name="frm" method="post" onSubmit="return check(this)">
	계정 : <input type="text" name="ID" size="15"/><br/>
	비밀번호 : <input type="password" name="PWD" size="10"/><br/><input type="submit" name="btn" value="로그인"/>
	</form>
	</div>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>
<script type="text/javascript">
function check(f) {
		
	if(f.ID.value=="") {
		alert("계정을 입력해주세요.");
		return false;
	}
	if(f.PWD.value=="") {
		alert("비밀번호를 입력해주세요.");
		return false;
	}

	
	
}
</script>
</body>
</html>