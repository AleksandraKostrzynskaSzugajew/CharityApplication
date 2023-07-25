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
    <link rel="stylesheet" href="<c:url value="/css/styleAdmin.css"/>"/> <%-- Importowanie pliku CSS --%>
</head>
<body>

<div class="image-container">
    <img src="<c:url value="/images/adminlogo.jpg"/>" alt="logo for admin" class="custom-image"/>
</div>

<div>
    <%-- Sprawdzenie, czy użytkownik ma rolę "ROLE_ADMIN" --%>
    <c:if test="${pageContext.request.userPrincipal != null && pageContext.request.isUserInRole('ROLE_ADMIN')}">
        <%-- Wyświetlenie powitania dla admina --%>
        <h2>Witaj, Adminie!</h2>
    </c:if>
</div>


<td><a href="<c:url value='/admin/user/findall' />" class="add-link">Zobacz wszystkich użytkownikow</a></td>
<td><a href="<c:url value='/admin/inst/findall' />" class="add-link">Zobacz wszystkie fundacje</a></td>
<td><a href="<c:url value='/admin/admin/findall' />" class="add-link">Zobacz wszystkich administratorow</a></td>
<td><a href="<c:url value='/logout' />" class="add-link">Wyloguj</a></td>


</body>
</html>
