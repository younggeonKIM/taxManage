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
	<h1 align="center">���� ���� �ý��� ver1.0</h1>
</header>
<menu>
	<jsp:include page="tax_menu.jsp"/>
</menu>
<section>
	<h2 align="center">���ξ� ���� �� ����</h2>
	<div align="center">
<%
	Amount amt=(Amount)request.getAttribute("AMT");
%>
<form action="amountUpDel.do" method="post" 
		name="frm" onSubmit="return check(this)">
<table >
	<tr><th>�����ڹ�ȣ</th>
		<td><input type="text" name="PAYRNO" readonly
						value="<%= amt.getPayrnum() %>"/></td></tr>
	<tr><th>���ι�ȣ</th>
		<td><input type="text" name="PAYNUM" readonly
				value="<%= amt.getPayno() %>"/></td></tr>
	<tr><th>����ǥ��</th>
		<td><input type="text" name="STDD" id="STDD"
				value="<%= amt.getStdd() %>"/></td></tr>
	<tr><th>����</th>
		<td><input type="text" name="RATE" readonly id="RATE"
				value="<%= 0 %>"/></td></tr>
	<tr><th>��꼼��</th>
		<td><input type="text" name="ESTM" readonly id="ESTM"
				value="<%= 0 %>"/></td></tr>
	<tr><th>������</th>
		<td><input type="text" name="DEDUC" 
				value="<%= amt.getDeduc() %>"/></td></tr>
	<tr><th>���ξ�</th>
		<td><input type="text" name="PAYED" readonly id="PAYED"
				value="<%= 0 %>"/></td></tr>
	<tr><th>�ͼӿ���</th>
		<td><input type="text" name="YEAR" readonly
				value="<%= amt.getYear() %>"/></td></tr>
</table>
</div>
	<div align="left" class="btns3">
	����ǥ�� ����ϱ� : <input type="button" value="Ŭ��" 
							onClick="getSTANDRD()"/><br/><br/>
	������ ����Ǵ� ������<br/>
	����Ǵ� ���� ����ϱ� : <input type="button" value="Ŭ��" 
							onClick="getRate()"/>
	</div>
	<div align="right" class="btns4">
	2020�� �ͼӺ�
	�����Ű�װ���û�� : <input type="submit" name="BTN" value="Ŭ��"/><br/><br/>
	�������Ϸκ��� 3���� ����<br/>
	������ ���� ��û : <input type="button" name="BTN" value="����"
							onClick="return deleteAmount()"/>
	</div>
</form>
<form method="post" name="dlt" >
	<input type="hidden" name="PAYRNO"/>
	<input type="hidden" name="PAYNUM"/>
	<input type="hidden" name="YEAR"/>
	<input type="hidden" name="BTN" value="����"/>
</form>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>
<script type="text/javascript">

function check(f){
	if(f.STDD.value==0){
		alert("����ǥ���� �Է��� �ּ���.");
		return false;
	}
	if(f.RATE.value==0){
		alert("���� ����ϱ� ��ư�� ���� �ּ���.");
		return false;
	}
	if(f.YEAR.value!='2020��'){
		alert("2020�� �ͼӺ� ���ξ׸� �����Ű� �� ����û�� �����մϴ�.");
		return false;
	}
	if(confirm("������ �����Ű� �� ����û���� �Ͻðڽ��ϱ�?")){
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
	if(f.YEAR.value=='2018��'||f.YEAR.value=='2020��'||f.YEAR.value=='2019��'){
		alert("�ֱ� 3�� �̳� ������ ������ �ͼӿ����� �ش�Ǿ� ���� �Ұ��մϴ�.");
		return false;
	}
	if(confirm("������ ���ξ� ������ �����Ͻðڽ��ϱ�?")){
		f.submit();
	} else {
		return false;
	}
	
}
function getSTANDRD() {
	var iza=parseInt(prompt("���ڼҵ��� �Է��ϼ���."));
	var bae=parseInt(prompt("���ҵ��� �Է��ϼ���."));
	var geun=parseInt(prompt("�ٷμҵ��� �Է��ϼ���."));
	var sa=parseInt(prompt("����ҵ��� �Է��ϼ���."));
	var yun=parseInt(prompt("���ݼҵ��� �Է��ϼ���."));
	var gi=parseInt(prompt("��Ÿ�ҵ��� �Է��ϼ���."));
	var jong=iza+bae+geun+sa+yun+gi;
	document.getElementById("STDD").value=jong;
	if (isNaN(frm.STDD.value)==true) {
		alert("����ǥ�ؿ� �ջ��� �ҵ��� ���ڸ� �Է����ּ���.");
		document.getElementById("STDD").value=0;
	}
}
function getRate() {
	if(frm.YEAR.value != "2020��") {
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