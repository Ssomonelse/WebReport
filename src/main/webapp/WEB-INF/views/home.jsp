<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>*R*E*P*O*R*T*</title>
</head>
<body marginheight="200px">
	<h1 align="center">웹 프레임워크 두번째 과제</h1><br><br>
	<h3 align="center">메뉴를 선택하세요</h3>
	<table border=1 align="center">
		<tr bgcolor="lightgreen" style="font-weight:bold">
			<td align="center"> 번 호 </td>
			<td align="center"> 메 뉴 </td>
		</tr>
		<tr>
			<td align="center">①</td>
			<td align="center"><a href="${pageContext.request.contextPath}/totalcredits">학기별 이수 학점 조회</a></td>
		</tr>
		<tr>
			<td align="center">②</td>
			<td align="center"><a href="${pageContext.request.contextPath}/aboutDivision">이수 구분별 학점 조회</a></td>
		</tr>
		<tr>
			<td align="center">③</td>
			<td align="center"><a href="${pageContext.request.contextPath}/enrolment">수강 신청하기</a></td>
		</tr>
		<tr>
			<td align="center">④</td>
			<td align="center"><a href="${pageContext.request.contextPath}/enrolments">수강 신청 조회</a></td>
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
