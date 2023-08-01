<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>

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
<h2>Moje donacje</h2>
<br>
<br>
<form:form method="get" action="/mydonations">
    <input type="submit" name="sort" value="Sortuj według statusu odebrania" class="btn--small">
    <input type="submit" name="sort" value="Sortuj według daty odebrania" class="btn--small">
    <input type="submit" name="sort" value="Sortuj według daty utworzenia wpisu" class="btn--small">
</form:form>
<br>
<br>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Ilość</th>
        <th>Kategorie</th>
        <th>Instytucja</th>
        <th>Adres</th>
        <th>Data odbioru</th>
        <th>Godzina odbioru</th>
        <th>Komentarz</th>
        <th>Telefon</th>
        <th>Data deklaracji</th>
        <th>Status odbioru</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${myDonations}" var="donation">
        <tr>
            <td>${donation.id}</td>
            <td>${donation.quantity}</td>
            <td>
                <c:forEach items="${donation.categories}" var="category">
                    ${category.name}<br>
                </c:forEach>
            </td>
            <td>${donation.institution.name}</td>
            <td>${donation.street}, ${donation.city}, ${donation.zipCode}</td>
            <td>${donation.pickUpDate}</td>
            <td>${donation.pickUpTime}</td>
            <td>${donation.pickUpComment}</td>
            <td>${donation.phone}</td>
            <td>${donation.donationDeclaredOn}</td>
            <td>${donation.pickedUp ? 'Odebrano' : 'Oczekuje na odbiór'}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<br>
<br>
<br>
<br>
<%@ include file="../footer.jsp" %>
</body>
</html>
