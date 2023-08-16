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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>

<body>
<%@ include file="../header.jsp" %>
<br>
<br>
<h2>Moje darowizny</h2>
<br>
<br>
<button class="btn--small" onclick="updateTable('Sortuj według statusu odebrania')">Sortuj według statusu odebrania</button>
<button class="btn--small" onclick="updateTable('Sortuj według daty odebrania')">Sortuj według daty odebrania</button>
<button class="btn--small" onclick="updateTable('Sortuj według daty utworzenia wpisu')">Sortuj według daty utworzenia wpisu</button>
<br>
<br>
<br>
<br>
<div id="donationsTableContainer">
    <table id="donationsTable">
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
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<%@ include file="../footer.jsp" %>
<script>
    function updateTable(sortOption) {
        $.ajax({
            type: 'GET',
            url: '/user/mydonations',
            data: {sort: sortOption},
            success: function(response) {

                // Usuń obecny kontent z tabeli
                $('#donationsTableContainer').empty();

                // Aktualizuj zawartość tabeli po odebraniu odpowiedzi od serwera
                $('#donationsTableContainer').html(response);
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    }
</script>
</body>
</html>
