<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body marginheight="200px">
	<h1 align="center">${classInfo.title}</h1><br>
	<h2 align="center">과목이 수강신청이 되었습니다.</h2><br><br>
	
	<table align="center">
		<tr>
			<td align="center"><input type="button" value="추가 수강 신청"
				onclick="javascript:document.getElementById('goBack').submit()" /></td>
			<td align="center"><input type="button" value="신청 현황 조회"
				onclick="javascript:document.getElementById('checkEnrol').submit()"/></td>
		</tr>
		<tr></tr>
		<tr></tr>
		<tr>
			<td align="center" colspan="2"><input type="button" value="메뉴 보기"
				onclick="javascript:document.getElementById('goMenu').submit()" /></td>
		</tr>
	</table>
	<form id="goMenu" action="<c:url value="/"/>" method="GET">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
	<form id="goBack" action="<c:url value="/enrolment"/>" method="POST">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
	<form id="checkEnrol" action="<c:url value="/enrolments"/>" method="POST">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
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