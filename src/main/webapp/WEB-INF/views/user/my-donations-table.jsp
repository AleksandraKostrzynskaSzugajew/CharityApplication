<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>

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
