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
	<h2 align="center">로그인 결과</h2>
	<div align="center" class="btns2" id="HTHTHT">
	<h3 id="HTHT"></h3>
	
	다시 로그인 하러가기 : <input type="button" value="클릭" onClick="toLogin()"/><br/>
	회원등록 하러가기 : <input type="button" value="회원등록" onClick="toMemRegi()"/>
	</div>
<%
String res=request.getParameter("R");

System.out.println("넘겨받은 값: "+res);
if (res.equals("OK")){
	String id=(String)session.getAttribute("LOGID");
	System.out.println(id);

%>
<script type="text/javascript">
	document.getElementById("HTHTHT").innerHTML="로그인에 성공했습니다. 환영합니다." + <%= id %> +"님";
	
</script>
<%
}else if(res.equals("NOID")){
	
%>
<script type="text/javascript">
	document.getElementById("HTHT").innerHTML="일치하는 계정이 없습니다. 먼저 회원등록을 해주세요.";
</script>
<% 
}else if(res.equals("NOPWD")){
%>
<script type="text/javascript">
	document.getElementById("HTHT").innerHTML="비밀번호가 올바르지 않습니다. 비밀번호를 확인 후 다시 로그인해주세요.";
</script>
<%	
}
%>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>
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
</body>
</html>