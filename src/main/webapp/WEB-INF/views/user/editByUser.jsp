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
    <link rel="stylesheet" href="<c:url value="/css/styleOla.css"/>"/>
</head>
<body>
<%@include file="../header.jsp" %>
<br>
<br>
<h2>Edytuj dane</h2>
<br>
<br>
<br>

<form:form method="post" modelAttribute="user">
    <div class="login-page">
        <form:input type="email" path="email" placeholder="Zmień email" value="${user.email}"/>
    </div>
    <div class="form-group">
        <form:input type="text" path="name" placeholder="Zmień imię" value="${user.name}"/>
    </div>
    <div class="form-group">
        <a href="/home/resetpassbu" class="btn btn--small btn--without-border">Zmień hasło</a>
    </div>
    <form:hidden path="id"/>
    <input type="submit" value="Aktualizuj" class="btn">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form:form>

<br>
<br>
<br>
<%@include file="../footer.jsp" %>


</body>
</html>
