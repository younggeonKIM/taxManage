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
	<h2 align="center">회원 등록 결과</h2>
	<div align="center" class="btns3" id="HTHTHT">
	<h3 id="HTHT"></h3>
	로그인 하러가기 : <input type="button" value="클릭" onClick="toLogin()"/><br/>
	회원등록 하러가기 : <input type="button" value="회원등록" onClick="toMemRegi()"/>
	</div>
<%
String mes=request.getParameter("M");
String res=(String)request.getAttribute("RES");
if ("OK".equals(res)){
%>
<script type="text/javascript">
		document.getElementById("HTHT").innerHTML=
			"회원등록이 완료됐습니다. 로그인해 주세요.";
	
</script>
<%	
} else if ("NOK".equals(res)){
%>
<script type="text/javascript">
		document.getElementById("HTHT").innerHTML=
			"회원등록에 실패했습니다. 다시 회원 등록을 해 주세요.";
</script>
<%	
} else if ("DOUBL".equals(res)){
%>	
<script type="text/javascript">
	document.getElementById("HTHT").innerHTML=
		"이미 가입이 완료된 회원입니다. 로그인해 주세요.";
</script>
<%
} else if ("N".equals(mes)){
%>	
<script type="text/javascript">
	document.getElementById("HTHTHT").innerHTML=
		"계정이 없는 본인만이 회원으로 등록가능합니다. 로그아웃해 주세요.";
</script>
<%} %>
<script type="text/javascript">
function toLogin() {
	if(confirm("로그인 화면으로 이동하시겠습니까?")) {
		location.href="tax_login.jsp";
	}
}
function toMemRegi(){
	if(confirm("회원등록 화면으로 이동하시겠습니까?")){
		location.href="memRegi.do";
	}
}
</script>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>
</body>
</html>