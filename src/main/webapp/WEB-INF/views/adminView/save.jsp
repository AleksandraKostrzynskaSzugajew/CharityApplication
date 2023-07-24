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
    <%--  <link rel="stylesheet" href="<c:url value="/css/style.css"/>"/>--%>
    <link rel="stylesheet" href="<c:url value="/css/styleAdmin.css"/>"/>
</head>
<body>

<div class="image-container">
    <img src="<c:url value="/images/adminlogo.jpg"/>" alt="logo for admin" class="custom-image"/>
</div>
<div class="center-text"><h2>Załóż konto dla nowego Administratora</h2></div>
<form:form action="/admin/admin/save" method="post" modelAttribute="user" class="form-custom-form">
    <div class="form-group">
        <form:input path="email" placeholder="Email" class="form-custom-input"/>
    </div>
    <div class="form-group">
        <form:input path="password" placeholder="Hasło" class="form-custom-input"/>
    </div>

    <div class="form-group form-group--buttons">
        <button class="form-btn" type="submit">Załóż konto</button>
    </div>
</form:form>

</body>
</html>
