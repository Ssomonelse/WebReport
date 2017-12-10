<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>2018학년도 1학기 수강신청</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main2.css">
</head>
<body marginheight="200px">
	<h2 align="center">2018학년도 1학기 수강신청</h2><br><br>
<sf:form method="post" action="${pageContext.request.contextPath}/enroll" modelAttribute="classInfo">
	<table align="center" width="260px" bordercolor="green">
		<tr>
			<td class="label"> 교과코드 : </td>
			<td>
				<sf:input class="control" type="text" path="course_id"/><br>
				<sf:errors path="course_id" class="error"/>
			</td>
		</tr>
		<tr>
			<td class="label"> 교과목명 : </td>
			<td>
				<sf:input class="control" type="text" path="title"/><br>
				<sf:errors path="title" class="error"/>
			</td>
		</tr>
		<tr>
			<td class="label"> 구 분 : </td>
			<td>
				<sf:input class="control" type="text" path="division"/><br>
				<sf:errors path="division" class="error"/>
			</td>
		</tr>
		<tr>
			<td class="label"> 학 점 : </td>
			<td>
				<sf:input class="control" type="text" path="credit"/><br>
				<sf:errors path="credit" class="error"/>
			</td>
		</tr>
		<tr>
			<td class="label"> </td>
			<td><input type="submit" value="수강 신청"/></td>
		</tr>
	</table><br>
	
</sf:form>
<table align="center">
		<tr><td align="center"><input type="button" value="뒤로 가기" onclick="javascript:history.back()"/></td></tr>
	</table>
	<br><br><table align="center">
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