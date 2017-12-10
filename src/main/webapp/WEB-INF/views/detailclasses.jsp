<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${details[0].year}학년 ${details[0].semester}학기에 수강한 교과목 리스트</title>
</head>
<body marginheight="200px">
	<h2 align="center">${details[0].year}학년 ${details[0].semester}학기에 수강한 교과목 리스트</h2><br><br>
	<table border=1 align="center">
		<tr bgcolor="lightgreen" style="font-weight:bold">
			<td align="center"> 연 도 </td>
			<td align="center"> 학 기 </td>
			<td align="center"> 교과 코드 </td>
			<td align="center"> 교과목명 </td>
			<td align="center"> 구 분 </td>
			<td align="center"> 학 점 </td>
		</tr>
		<c:forEach var="course" items="${details}">
			<tr>
				<td align="center"><c:out value="${course.year}"/></td>
				<td align="center"><c:out value="${course.semester}"/></td>
				<td align="center"><c:out value="${course.course_id}"/></td>
				<td align="center"><c:out value="${course.title}"/></td>
				<td align="center"><c:out value="${course.division}"/></td>
				<td align="center"><c:out value="${course.credit}"/></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6" align="center" style="padding: 10px">
				<input style="margin-right: 20px" type="button" value="뒤로 가기" onclick="javascript:history.back()"/> 
				<input style="margin-left: 20px" type="button" value="메뉴 보기" onclick="javascript:history.go(-2)"/>
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