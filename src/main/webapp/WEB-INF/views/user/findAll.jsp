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
    <link rel="stylesheet" href="<c:url value="/css/styleAdmin.css"/>"/>
</head>
<body>
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
        <th>Zablokowany</th>

    </tr>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.email}</td>
            <td>${user.role.getName()}</td>
            <td>${user.name}</td>
            <td>${user.comment}</td>

                <%--w jezyku el--%>
            <td>
                <c:choose>
                    <c:when test="${!user.enabled}">
                        Zablokowany
                    </c:when>
                    <c:otherwise>
                        Niezablokowany
                    </c:otherwise>
                </c:choose>
            </td>

            <td><a href="<c:url value='/admin/user/edit?id=${user.id}'/>" class="edit-link">Edytuj</a></td>
            <td><a href="<c:url value='/admin/user/remove?id=${user.id}'/>" class="delete-link"
                   onclick="return confirm('Czy jesteś pewien?')">Usuń</a></td>
            <td><a href="<c:url value='/admin/user/block?id=${user.id}'/>" class="edit-link"
                   onclick="return confirm('Czy jesteś pewien?')">Zablokuj</a></td>
            <td><a href="<c:url value='/admin/user/unblock?id=${user.id}'/>" class="edit-link"
                   onclick="return confirm('Czy jesteś pewien?')">Odblokuj</a></td>
        </tr>
    </c:forEach>
</table>
<br>
<br>
<br>
<td><a href="<c:url value='/admin/user/save' />" class="add-link">Dodaj nowego użytkownika</a></td>
<br>
<br>
<td><a href="<c:url value='/home/admin' />" class="home-link">Powrót na stronę główną</a></td>
<div class="image-container"><img src="<c:url value="/images/adminlogo.jpg"/>" alt="logo for admin"/></div>


</body>
</html>
