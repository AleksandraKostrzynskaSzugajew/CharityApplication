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

<form:form method="post" action="user/edited" modelAttribute="user">

    <div>Email  : <form:input path="email"/></div>
    <div>Rola : <form:input path="role"/></div>
    <form:hidden path="id"/>
    <input type="submit" value="Aktualizuj">

</form:form>

<%@ include file="../footer.jsp" %>
</body>
</html>