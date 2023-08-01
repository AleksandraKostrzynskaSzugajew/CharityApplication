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

<div class="slogan container container--90">
    <br>
    <br>
    <br>
    <br>
    <p>Twoje dane zostały pomyślnie zaktualizowane! </p>
    <br>
    <br>
    <br>
    <br>
</div>
<%@include file="../footer.jsp" %>


</body>
</html>
