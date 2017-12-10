<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body onload='document.f.username.focus()' marginheight="200px">
	<h1 align="center">ID와 비밀번호를 입력하세요</h1><br><br>
	
	<c:if test="${not empty logoutMsg }">
			<div style="color:#0000ff"><h3 align="center">${logoutMsg}</h3></div>
	</c:if>
	
	<form name='f' action='<c:url value="/login"/>' method='POST'>
		
		<c:if test="${not empty errorMsg }">
			<div style="color:#ff0000"><h3 align="center">${errorMsg }</h3></div>
		</c:if>
		
		<br><br><table align="center" bordercolor="pink">
			<tr>
				<td>User:</td>
				<td><input type='text' name='username' value=''></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type='password' name='password' value=''></td>
			</tr>
			<tr>
				<td colspan="2" align="center" height="100px"><input name='submit' type='submit'
					value='Login' /></td>
			</tr>
			
			<tr><td><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /></td></tr>
		</table>
	</form>
</body>
</html>