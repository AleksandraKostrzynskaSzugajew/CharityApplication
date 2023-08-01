<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/css/styleOla.css"/>"/>
</head>
<body>
<%@ include file="../header.jsp" %>
<br>
<br>
<br>
<h3> Wszyscy użytkownicy </h3>
<br>
<br>
<table>
    <tr>
        <th>Id</th>
        <th>Email</th>
        <th>Rola</th>
        <th>Imie</th>
        <th>Komentarz</th>
        <th>Status</th>
    </tr>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.email}</td>
            <td>${user.role.getName()}</td>
            <td>${user.name}</td>
            <td>${user.comment}</td>
            <td>
                <c:choose>
                    <c:when test="${!user.enabled}">
                        <a href="<c:url value='/admin/user/block?id=${user.id}'/>" class="edit-link" onclick="return confirm('Czy jesteś pewien?')">Zablokuj</a>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/admin/user/unblock?id=${user.id}'/>" class="edit-link" onclick="return confirm('Czy jesteś pewien?')">Odblokuj</a>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
</table>
<br>
<br>
<br>
<br>
<br>
<br>

<%@ include file="../footer.jsp" %>
</body>
</html>
