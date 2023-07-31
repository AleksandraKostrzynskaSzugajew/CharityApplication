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
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>"/> <%-- Importowanie pliku CSS --%>
</head>
<body>

<header class="header--main-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <c:if test="${pageContext.request.userPrincipal != null}">
                <%-- Jeśli użytkownik jest zalogowany, wyświetl "Witaj [imię]" i przycisk "Wyloguj" --%>
                <li><span class="btn btn--small btn--without-border">Witaj ${pageContext.request.userPrincipal.name}</span></li>
                <li>
                    <form action="/logout" method="post">
                        <input type="submit" value="Wyloguj" class="btn btn--small btn--without-border" />
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </form>
                </li>
            </c:if>
            <c:if test="${pageContext.request.userPrincipal == null}">
                <%-- Jeśli użytkownik nie jest zalogowany, wyświetl przycisk "Zaloguj się" oraz "Załóż konto" --%>
                <li><a href="/home/login" class="btn btn--small btn--without-border">Zaloguj</a></li>
                <li><a href="/home/register" class="btn btn--small btn--highlighted">Załóż konto</a></li>
            </c:if>
            <c:if test="${pageContext.request.userPrincipal != null && pageContext.request.isUserInRole('ADMIN')}">
                <%-- Jeśli użytkownik jest zalogowany jako admin, wyświetl te przyciski --%>
                <li><a href="/admin/user/findall" class="btn btn--small btn--without-border">Zarządzaj użytkownikami</a></li>
                <li><a href="/admin/inst/findall" class="btn btn--small btn--without-border">Zarządzaj fundacjami</a></li>
                <li><a href="/admin/admin/findall" class="btn btn--small btn--without-border">Zarządzaj administratorami</a></li>
            </c:if>
        </ul>

        <ul>
            <li><a href="/home" class="btn btn--without-border active">Start</a></li>
            <li><a href="#" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="<c:url value="/home/about"/>" class="btn btn--without-border">O nas</a></li>
            <li><a href="#" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="#" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>

    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                Zacznij pomagać!<br/>
                Oddaj niechciane rzeczy w zaufane ręce
            </h1>
        </div>
    </div>
</header>

</body>
</html>
