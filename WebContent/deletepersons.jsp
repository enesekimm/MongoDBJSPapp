<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Person Delete</title>
</head>
<body>
<c:url value="/showPerson" var="showURL"></c:url>
	<c:url value="/addPerson" var="addURL"></c:url>
	<c:url value="/deletePerson" var="deleteURL"></c:url>
	<%-- Person Add/Edit logic --%>
	<c:if test="${requestScope.error ne null}">
		<strong style="color: red;"><c:out value="${requestScope.error}"></c:out></strong>
	</c:if>
	<c:if test="${requestScope.success ne null}">
		<strong style="color: green;"><c:out value="${requestScope.success}"></c:out></strong>
	</c:if>
<c:url value="/deletePerson" var="deleteURL">
						<c:param name="id" value="${person.id}"></c:param>
					</c:url>
	<%-- Edit Request --%>
	<c:if test="${requestScope.person eq null}">
		<form action='<c:out value="${deleteURL}"></c:out>' method="post">
			Kullanıcıyı silmek istiyormusunuz?<br> 

			<c:url value="/deletePerson" var="deleteURL">
						<c:param name="id" value="${person.id}"></c:param>
					</c:url>
			<input type="submit"value="Evet">
		</form>
		<form action='<c:out value="${showURL}"></c:out>' method="post">
			<input type="submit"value="Hayır">
		</form>
	</c:if>

</body>
</html>