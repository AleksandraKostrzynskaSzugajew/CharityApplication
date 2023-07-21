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
  <%@ include file="../header.jsp" %>


  <table>
    <tr>
      <th>Id</th>
      <th>Email</th>
      <th>Rola</th>
    </tr>
    <c:forEach items="${admins}" var="admin">
      <tr>
        <td>${admin.id}</td>
        <td>${admin.name}</td>
        <td>${admin.role}</td>

        <td><a href="<c:url value='/user/edit?id=${user.id}'/>">Edytuj</a></td>
        <td><a href="<c:url value='/user/remove?id=${user.id}'/>" onclick="return confirm('Czy jestes pewien?')">Usun</a></td>
      </tr>
    </c:forEach>
  </table>
  <br>
  <br>
  <br>
  <br>
  <br>
  <td><a href="<c:url value='/admin/home' />">Powrot na strone glowna</a></td>

  <%@ include file="../footer.jsp" %>
  </body>
</html>
