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
String payerno=request.getParameter("PYRN");
%>
	<h2 align="center">납세자 등록하기</h2>
	<form action="taxInsert.do" method="post" onSubmit="return check(this)">
	<table>
	<tr><th>납세자번호</th><td><input type="text" name="NUM" value="<%=payerno %>" readonly/></td></tr>
	<tr><th>납세자명</th><td><input type="text" name="NAME"/></td></tr>
	<tr><th>납세자전화(-까지입력)</th><td><input type="text" name="TEL"/></td></tr>
	<tr><th>납세자주소</th><td><input type="text" name="ADDR"/></td></tr>
	<tr><th>납부일</th><td><input type="date" name="PADATE"/></td></tr>
	<tr><th>납부기한</th><td><input type="date" name="DUDATE"/></td></tr>
	<tr><th>납세지</th><td><input type="text" name="PLACE"/></td></tr>
	
	</table><br/>
	<div align="right"><input type="submit" name="subm" value="등록하기"/></div>
	</form>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>
<script type="text/javascript">
function check(f){
	if(! f.PADATE.includes("2021."){
		alert("2021년 납부정보만 등록이 가능합니다.");
		return false;
	}
	if(! f.DUDATE.includes("2021."){
		alert("2021년 납부정보만 등록이 가능합니다.");
		return false;
	}
	if(confirm("정말로 2021년 납세자 정보를 등록하시겠습니까?")){
		return true;
	} else{
		return false;
	}
}
</script>
</body>
</html>