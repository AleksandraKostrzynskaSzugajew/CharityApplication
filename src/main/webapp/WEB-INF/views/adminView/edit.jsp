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

<div class="image-container">
    <img src="<c:url value="/images/adminlogo.jpg"/>" alt="logo for admin" class="custom-image"/>
</div>

<form:form method="post" action="/admin/admin/edit" modelAttribute="adminToEdit" class="custom-form">
    <div>Email  : <form:input path="email" class="custom-input"/></div>
    <div>Rola : <form:input path="role" class="custom-input"/></div>
    <div>Komentarz : <form:input path="comment" class="custom-input"/></div>
    <form:hidden path="id"/>
    <input type="submit" value="Aktualizuj" class="custom-button">
</form:form>

</body>
</html>
