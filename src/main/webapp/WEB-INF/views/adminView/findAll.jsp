<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
  <title>Document</title>
  <link rel="stylesheet" href="<c:url value="/css/styleAdmin.css"/>"/>
</head>
<body>
<h3> Wszyscy administratorzy </h3>
<br>
<br>
<table>
  <tr>
    <th>Id</th>
    <th>Email</th>
    <th>Rola</th>
    <th>Komentarz</th>
  </tr>
  <c:forEach items="${admins}" var="admin">
    <c:if test="${admin.id != loggedInAdminId}">
      <tr>
        <td>${admin.id}</td>
        <td>${admin.email}</td>
        <td>${admin.role.getName()}</td>
        <td>${admin.comment}</td>
        <td><a href="<c:url value='/admin/admin/edit?id=${admin.id}'/>" class="edit-link">Edytuj</a></td>
        <td><a href="<c:url value='/admin/admin/remove?id=${admin.id}'/>" class="delete-link" onclick="return confirm('Czy jesteś pewien?')">Usuń</a></td>
      </tr>
    </c:if>
  </c:forEach>
</table>
<br>
<br>
<br>
<td><a href="<c:url value='/admin/admin/save' />" class="add-link">Dodaj nowego administratora</a></td>
<br>
<br>
<td><a href="<c:url value='/admin/home' />" class="home-link">Powrót na stronę główną</a></td>

<div class="image-container"><img src="<c:url value="/images/adminlogo.jpg"/>" alt="logo for admin"/></div>

</body>
</html>
