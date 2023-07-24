<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

<h3 class="center-text">Dodaj nowa instytucje</h3>

<form:form method="post" action="admin/inst/save" modelAttribute="institution" class="custom-form">

  <div class="form-group">
    <label>Nazwa:</label>
    <form:input path="name" class="form-input" />
  </div>

  <div class="form-group">
    <label>Cel:</label>
    <form:input path="description" class="form-input" />
  </div>

  <input type="submit" value="Dodaj nowa instytucje" class="form-btn">
</form:form>

</body>
</html>
