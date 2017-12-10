<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이수 구분별 학점 내역</title>
</head>
<body marginheight="200px">
	<h2 align="center">이수 구분별 학점 내역</h2><br><br>
	<table border=1 align="center">
		<tr bgcolor="lightgreen" style="font-weight:bold">
			<c:forEach var="divisionName" items="${divInfo}">
				<td align="center" width="45px" height="35px"><c:out value="${divisionName.division}"/></td>
			</c:forEach>
			<td width="50px" height="35px">총학점</td>
		</tr>
		<tr>
			<c:forEach var="divisionCredit" items="${divInfo}">
				<td align="center"><c:out value="${divisionCredit.credit}"/></td>
			</c:forEach>
			<td align="center">
				<c:set var="CreditSum" value="0"/>
				<c:forEach var="credits" items="${divInfo}">
					<c:set var="CreditSum" value="${CreditSum+credits.credit}"/>
				</c:forEach>
				<strong><c:out value="${CreditSum}"/></strong>
			</td>
		</tr>
		<tr>
			<td colspan="9" align="center" style="padding: 10px">
				<input type="button" value="뒤로 가기" onclick="javascript:history.back()"/>
			</td>
		</tr>
	</table>
	<br><br><br><table align="center">
		<tr><td>
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<input type="button" value="로그아웃" onclick="javascript:document.getElementById('logout').submit()"/>
			</c:if>
		</td></tr>
	</table>
	<form id="logout" action="<c:url value="/logout"/>" method="POST">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
</body>
</html>