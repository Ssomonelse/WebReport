<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학년/학기별 학점 이수</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
</head>
<body marginheight="200px">
	<h2 align="center">학년/학기별 학점 이수</h2><br><br>
	<table border=1 align="center">
		<tr bgcolor="lightgreen" style="font-weight:bold">
			<td align="center"> 연 도 </td>
			<td align="center"> 학 기 </td>
			<td align="center"> 이수 학점 </td>
			<td align="center"> 상세 보기 </td>
		</tr>
		<c:forEach var="total" items="${totalcredits}">
			<tr>
				<td align="center"><c:out value="${total.year}"/></td>
				<td align="center"><c:out value="${total.semester}"/></td>
				<td align="center"><c:out value="${total.credit}"/></td>
				<td align="center"><a href='<c:url value="/detailClasses?year=${total.year}&semester=${total.semester}"></c:url>'>링크</a></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4" align="center" style="padding: 10px">
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