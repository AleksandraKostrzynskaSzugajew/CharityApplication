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
  <link rel="stylesheet" href="<c:url value="/css/style.css"/>"/>
</head>
<body>
<%@ include file="../header.jsp" %>

<h2>Załóż konto dla nowego Administratora</h2>
<form:form action="/admin/admin/save" method="post" modelAttribute="user">
  <div class="form-group">
    <form:input path="email" placeholder="Email"/>
  </div>
  <div class="form-group">
    <form:input path="password" placeholder="Hasło"/>
  </div>
  <!-- <div class="form-group">
<%--  <form:input path="password2" placeholder="Powtórz hasło"/>--%>
  </div>-->

  <div class="form-group form-group--buttons">
    <a href="login.jsp" class="btn btn--without-border">Zaloguj się</a>
    <button class="btn" type="submit">Załóż konto</button>
  </div>
</form:form>

<%@ include file="../footer.jsp" %>
</body>
</html>