<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="amount.*" %>
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
	<h2 align="center">납부액 수정 및 삭제</h2>
	<div align="center">
<%
	Amount amt=(Amount)request.getAttribute("AMT");
%>
<form action="amountUpDel.do" method="post" 
		name="frm" onSubmit="return check(this)">
<table >
	<tr><th>납세자번호</th>
		<td><input type="text" name="PAYRNO" readonly
						value="<%= amt.getPayrnum() %>"/></td></tr>
	<tr><th>납부번호</th>
		<td><input type="text" name="PAYNUM" readonly
				value="<%= amt.getPayno() %>"/></td></tr>
	<tr><th>과세표준</th>
		<td><input type="text" name="STDD" id="STDD"
				value="<%= amt.getStdd() %>"/></td></tr>
	<tr><th>세율</th>
		<td><input type="text" name="RATE" readonly id="RATE"
				value="<%= 0 %>"/></td></tr>
	<tr><th>계산세액</th>
		<td><input type="text" name="ESTM" readonly id="ESTM"
				value="<%= 0 %>"/></td></tr>
	<tr><th>공제액</th>
		<td><input type="text" name="DEDUC" 
				value="<%= amt.getDeduc() %>"/></td></tr>
	<tr><th>납부액</th>
		<td><input type="text" name="PAYED" readonly id="PAYED"
				value="<%= 0 %>"/></td></tr>
	<tr><th>귀속연도</th>
		<td><input type="text" name="YEAR" readonly
				value="<%= amt.getYear() %>"/></td></tr>
</table>
</div>
	<div align="left" class="btns3">
	과세표준 계산하기 : <input type="button" value="클릭" 
							onClick="getSTANDRD()"/><br/><br/>
	나에게 적용되는 세율과<br/>
	산출되는 세액 계산하기 : <input type="button" value="클릭" 
							onClick="getRate()"/>
	</div>
	<div align="right" class="btns4">
	2020년 귀속분
	수정신고및경정청구 : <input type="submit" name="BTN" value="클릭"/><br/><br/>
	법정기일로부터 3년이 지난<br/>
	데이터 삭제 요청 : <input type="button" name="BTN" value="삭제"
							onClick="return deleteAmount()"/>
	</div>
</form>
<form method="post" name="dlt" >
	<input type="hidden" name="PAYRNO"/>
	<input type="hidden" name="PAYNUM"/>
	<input type="hidden" name="YEAR"/>
	<input type="hidden" name="BTN" value="삭제"/>
</form>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>
<script type="text/javascript">

function check(f){
	if(f.STDD.value==0){
		alert("과세표준을 입력해 주세요.");
		return false;
	}
	if(f.RATE.value==0){
		alert("세율 계산하기 버튼을 눌러 주세요.");
		return false;
	}
	if(f.YEAR.value!='2020년'){
		alert("2020년 귀속분 납부액만 수정신고 및 경정청구 가능합니다.");
		return false;
	}
	if(confirm("정말로 수정신고 및 경정청구를 하시겠습니까?")){
		return true;
	}else {
		return false;
	}
}
function deleteAmount() {
	var f = document.dlt;
	f.action="amountUpDel.do";
	f.PAYRNO.value = document.frm.PAYRNO.value;
	f.PAYNUM.value = document.frm.PAYNUM.value;
	f.YEAR.value = document.frm.YEAR.value;
	if(f.YEAR.value=='2018년'||f.YEAR.value=='2020년'||f.YEAR.value=='2019년'){
		alert("최근 3년 이내 납부한 세액의 귀속연도에 해당되어 삭제 불가합니다.");
		return false;
	}
	if(confirm("정말로 납부액 정보를 삭제하시겠습니까?")){
		f.submit();
	} else {
		return false;
	}
	
}
function getSTANDRD() {
	var iza=parseInt(prompt("이자소득을 입력하세요."));
	var bae=parseInt(prompt("배당소득을 입력하세요."));
	var geun=parseInt(prompt("근로소득을 입력하세요."));
	var sa=parseInt(prompt("사업소득을 입력하세요."));
	var yun=parseInt(prompt("연금소득을 입력하세요."));
	var gi=parseInt(prompt("기타소득을 입력하세요."));
	var jong=iza+bae+geun+sa+yun+gi;
	document.getElementById("STDD").value=jong;
	if (isNaN(frm.STDD.value)==true) {
		alert("과세표준에 합산할 소득은 숫자만 입력해주세요.");
		document.getElementById("STDD").value=0;
	}
}
function getRate() {
	if(frm.YEAR.value != "2020년") {
		if (frm.STDD.value<=12000000) {
			document.getElementById("RATE").value=0.06;
			document.getElementById("ESTM").value=frm.STDD.value*frm.RATE.value;
			document.getElementById("PAYED").value=frm.ESTM.value-frm.DEDUC.value;
			if (frm.PAYED.value<=0) {
				document.getElementById("PAYED").value=0;
			}
		} if (12000000<frm.STDD.value) {
			document.getElementById("RATE").value=0.15;
			document.getElementById("ESTM").value=frm.STDD.value*frm.RATE.value-1080000;
			document.getElementById("PAYED").value=frm.ESTM.value-frm.DEDUC.value;
			if (frm.PAYED.value<=0) {
				document.getElementById("PAYED").value=0;
			}
		} if (46000000<frm.STDD.value) {
			document.getElementById("RATE").value=0.24;
			document.getElementById("ESTM").value=frm.STDD.value*frm.RATE.value-5220000;
			document.getElementById("PAYED").value=frm.ESTM.value-frm.DEDUC.value;
			if (frm.PAYED.value<=0) {
				document.getElementById("PAYED").value=0;
			}
		} if (88000000<frm.STDD.value) {
			document.getElementById("RATE").value=0.35;
			document.getElementById("ESTM").value=frm.STDD.value*frm.RATE.value-14900000;
			document.getElementById("PAYED").value=frm.ESTM.value-frm.DEDUC.value;
			if (frm.PAYED.value<=0) {
				document.getElementById("PAYED").value=0;
			}
		} if (150000000<frm.STDD.value) {
			document.getElementById("RATE").value=0.38;
			document.getElementById("ESTM").value=frm.STDD.value*frm.RATE.value-19400000;
			document.getElementById("PAYED").value=frm.ESTM.value-frm.DEDUC.value;
			if (frm.PAYED.value<=0) {
				document.getElementById("PAYED").value=0;
			}
		} if (300000000<frm.STDD.value) {
			document.getElementById("RATE").value=0.40;
			document.getElementById("ESTM").value=frm.STDD.value*frm.RATE.value-25400000;
			document.getElementById("PAYED").value=frm.ESTM.value-frm.DEDUC.value;
			if (frm.PAYED.value<=0) {
				document.getElementById("PAYED").value=0;
			}
		} if (500000000<frm.STDD.value) {
			document.getElementById("RATE").value=0.42;
			document.getElementById("ESTM").value=frm.STDD.value*frm.RATE.value-35400000;
			document.getElementById("PAYED").value=frm.ESTM.value-frm.DEDUC.value;
			if (frm.PAYED.value<=0) {
				document.getElementById("PAYED").value=0;
			}
		} 	
	} else {
		if (frm.STDD.value<=12000000) {
			document.getElementById("RATE").value=0.06;
			document.getElementById("ESTM").value=frm.STDD.value*frm.RATE.value;
			document.getElementById("PAYED").value=frm.ESTM.value-frm.DEDUC.value;
			if (frm.PAYED.value<=0) {
				document.getElementById("PAYED").value=0;
			}
		} if (12000000<frm.STDD.value) {
			document.getElementById("RATE").value=0.15;
			document.getElementById("ESTM").value=frm.STDD.value*frm.RATE.value-1080000;
			document.getElementById("PAYED").value=frm.ESTM.value-frm.DEDUC.value;
			if (frm.PAYED.value<=0) {
				document.getElementById("PAYED").value=0;
			}
		} if (46000000<frm.STDD.value) {
			document.getElementById("RATE").value=0.24;
			document.getElementById("ESTM").value=frm.STDD.value*frm.RATE.value-5220000;
			document.getElementById("PAYED").value=frm.ESTM.value-frm.DEDUC.value;
			if (frm.PAYED.value<=0) {
				document.getElementById("PAYED").value=0;
			}
		} if (88000000<frm.STDD.value) {
			document.getElementById("RATE").value=0.35;
			document.getElementById("ESTM").value=frm.STDD.value*frm.RATE.value-14900000;
			document.getElementById("PAYED").value=frm.ESTM.value-frm.DEDUC.value;
			if (frm.PAYED.value<=0) {
				document.getElementById("PAYED").value=0;
			}
		} if (150000000<frm.STDD.value) {
			document.getElementById("RATE").value=0.38;
			document.getElementById("ESTM").value=frm.STDD.value*frm.RATE.value-19400000;
			document.getElementById("PAYED").value=frm.ESTM.value-frm.DEDUC.value;
			if (frm.PAYED.value<=0) {
				document.getElementById("PAYED").value=0;
			}
		} if (300000000<frm.STDD.value) {
			document.getElementById("RATE").value=0.40;
			document.getElementById("ESTM").value=frm.STDD.value*frm.RATE.value-25400000;
			document.getElementById("PAYED").value=frm.ESTM.value-frm.DEDUC.value;
			if (frm.PAYED.value<=0) {
				document.getElementById("PAYED").value=0;
			}
		} if (500000000<frm.STDD.value) {
			document.getElementById("RATE").value=0.42;
			document.getElementById("ESTM").value=frm.STDD.value*frm.RATE.value-35400000;
			document.getElementById("PAYED").value=frm.ESTM.value-frm.DEDUC.value;
			if (frm.PAYED.value<=0) {
				document.getElementById("PAYED").value=0;
			}
		} if (1000000000<frm.STDD.value) {
			document.getElementById("RATE").value=0.45;
			document.getElementById("ESTM").value=frm.STDD.value*frm.RATE.value-65400000;
			document.getElementById("PAYED").value=frm.ESTM.value-frm.DEDUC.value;
			if (frm.PAYED.value<=0) {
				document.getElementById("PAYED").value=0;
			}
		}
	}
	
}
</script>
</body>
</html>