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
  <link rel="stylesheet" href="<c:url value="/css/styleOla.css"/>"/>

</head>
<body>
<br>
<%@ include file="../header.jsp" %>


<h2 class="center-text">Lista Instytucji</h2>
<table class="custom-table">
  <tr>
    <th>Id</th>
    <th>Nazwa</th>
    <th>Opis</th>
    <th>Edytuj</th>
    <th>Usuń</th>
  </tr>
  <c:forEach items="${institutions}" var="institution">
    <tr>
      <td>${institution.id}</td>
      <td>${institution.name}</td>
      <td>${institution.description}</td>
      <td><a href="<c:url value='/admin/inst/edit?id=${institution.id}'/>" class="btn edit-link">Edytuj</a></td>
      <td><a href="<c:url value='/admin/inst/remove?id=${institution.id}'/>" onclick="return confirm('Are you sure?')" class="btn delete-link">Usuń</a></td>
    </tr>
  </c:forEach>
</table>

<br>
<br>
<br>
<td><a href="<c:url value='/admin/inst/save' />" class="btn add-link">Dodaj nowa instytucje</a></td>

<br>
<br>
<td><a href="<c:url value='/admin/home' />" class="btn home-link">Powrot na strone glowna</a></td>
<br>
<br>
<br>
<%@ include file="../footer.jsp" %>

</body>
</html>
