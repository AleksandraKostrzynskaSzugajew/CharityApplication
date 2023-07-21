<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="pl">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>"/>
  </head>
  <body>
  <%@ include file="institution/header.jsp" %>


  <table>
    <tr>
      <th>Id</th>
      <th>Name</th>
      <th>Description</th>
    </tr>
    <c:forEach items="${institutions}" var="institution">
      <tr>
        <td>${institution.id}</td>
        <td>${institution.name}</td>
        <td>${institution.description}</td>

        <td><a href="<c:url value='/admin/inst/edit?id=${institution.id}'/>">Edit</a></td>
        <td><a href="<c:url value='/admin/inst/delete?id=${institution.id}'/>" onclick="return confirm('Are you sure?')">Remove</a></td>
      </tr>
    </c:forEach>
  </table>
  <br>
  <br>
  <br>
  <td><a href="<c:url value='/admin/inst/save' />">Add new category</a></td>

  <br>
  <br>
  <td><a href="<c:url value='/admin/home' />">Go back home</a></td>

  <%@ include file="institution/footer.jsp" %>
  </body>
</html>
