<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Persons Manage Page</title>
<style>
table,th,td {
	border: 1px solid black;
}
</style>
</head>
<body>
	<%-- Person Add/Edit logic --%>
	<c:if test="${requestScope.error ne null}">
		<strong style="color: red;"><c:out value="${requestScope.error}"></c:out></strong>
	</c:if>
	<c:if test="${requestScope.success ne null}">
		<strong style="color: green;"><c:out value="${requestScope.success}"></c:out></strong>
	</c:if>
	<c:url value="/showPerson" var="showURL"></c:url>
	<c:url value="/addPerson" var="addURL"></c:url>
	<c:url value="/editPerson" var="editURL"></c:url>
	<%-- Show Request --%>
	<c:if test="${requestScope.person eq null}">
		<form action='<c:out value="${showURL}"></c:out>' method="post">
			<input type="submit" value="Kayıt Getir">	 
		</form>
	</c:if>
	<%-- Add Request --%>
	<c:if test="${requestScope.person eq null}">
		<form  method="post">
			<input type="submit" value="Kayıt Ekle" onclick="window.open('/MongoDBWebapp/addpersons.jsp', null, 'location=yes,status=yes,scrollbars=yes,toolbar=yes')">	 
		</form>
	</c:if>
	<%-- Edit Request --%>
	<c:if test="${requestScope.person ne null}">
		<form action='<c:out value="${editURL}"></c:out>' method="post">
			ID: <input type="text" value="${requestScope.person.id}" readonly="readonly" name="id"><br> 
			Name: <input type="text" value="${requestScope.person.name}" name="name"><br>
			Surname: <input type="text" value="${requestScope.person.surname}"name="surname"><br>
			Phone: <input type="text" value="${requestScope.person.phone}"name="phone"><br> 
			<input type="submit"value="Güncelle" >
		</form>
	</c:if>
	

	<%-- Persons List Logic --%>
	<c:if test="${not empty requestScope.persons}">
		<table>
			<tbody>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Surname</th>
					<th>Phone</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
				<c:forEach items="${requestScope.persons}" var="person">
					<c:url value="/editPerson" var="editURL">
						<c:param name="id" value="${person.id}"></c:param>
					</c:url>
					<c:url value="/deletePerson" var="deleteURL">
						<c:param name="id" value="${person.id}"></c:param>
					</c:url>
					<tr>
						<td><c:out value="${person.id}"></c:out></td>
						<td><c:out value="${person.name}"></c:out></td>
						<td><c:out value="${person.surname}"></c:out></td>
						<td><c:out value="${person.phone}"></c:out></td>
						<td><a
							href='<c:out value="${editURL}" escapeXml="true" ></c:out>'>Güncelle</a></td>
						<td><a
							href='<c:out value="${editURL}" escapeXml="true" ></c:out>'>Sil</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
</body>
</html>