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
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>"/>
</head>
<body>

<%@include file="../header.jsp" %>

<section class="login-page">

    <h2>Edytuj administratora</h2>
    <form:form method="post" action="/admin/admin/edit" modelAttribute="adminToEdit" class="custom-form">
        <div class="form-group">
            <form:input path="email" class="custom-input" placeholder="Email"/>
        </div>
        <div class="form-group">
            <form:input path="role" class="custom-input" placeholder="Role"/>
        </div>
        <div class="form-group">
            <form:input path="comment" class="custom-input" placeholder="Komentarz"/>
        </div>
        <form:hidden path="id"/>
        <br>
        <br>

        <input type="submit" value="Aktualizuj" class="btn btn--without-border">
    </form:form>
</section>

<%@include file="../footer.jsp" %>

</body>
</html>
