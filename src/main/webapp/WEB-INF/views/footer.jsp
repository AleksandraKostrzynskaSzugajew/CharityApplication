<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<footer>
    <div class="contact">
        <h2>Skontaktuj się z nami</h2>
        <h3>Formularz kontaktowy</h3>
        <form class="form--contact" method="post" action="/contact">
            <div class="form-group form-group--50"><input type="text" name="name" placeholder="Imię"/></div>
            <div class="form-group form-group--50"><input type="text" name="surname" placeholder="Nazwisko"/></div>

            <div class="form-group"><textarea name="message" placeholder="Wiadomość" rows="1"></textarea></div>
            <div class="form-group form-group--50"><input type="email" name="email" placeholder="Adres email"/></div>

            <button class="btn" type="submit">Wyślij</button>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        </form>


    </div>
    <div class="bottom-line">
        <span class="bottom-line--copy">Copyright &copy; 2018</span>
        <div class="bottom-line--icons">
            <a href="#" class="btn btn--small"><img src="<c:url value="/images/icon-facebook.svg"/>"/></a>
            <a
                    href="#"
                    class="btn btn--small"><img
                    src="<c:url value="/images/icon-instagram.svg"/>"/></a>
        </div>
    </div>



<%--    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--%>
<%--    <script>--%>
<%--        function validateForm() {--%>
<%--            // Pobierz wszystkie pola formularza--%>
<%--            const nameInput = document.getElementsByName("name")[0];--%>
<%--            const surnameInput = document.getElementsByName("surname")[0];--%>
<%--            const messageInput = document.getElementsByName("message")[0];--%>
<%--            const emailInput = document.getElementsByName("email")[0];--%>

<%--            // Sprawdź, czy każde pole nie jest puste--%>
<%--            if (nameInput.value === "" || surnameInput.value === "" || messageInput.value === "" || emailInput.value === "") {--%>
<%--                alert("Wypełnij wszystkie pola formularza.");--%>
<%--                return false; // Zapobiega wysłaniu formularza--%>
<%--            }--%>

<%--            // Jeśli wszystkie pola są wypełnione, można wysłać żądanie AJAX--%>
<%--            $.ajax({--%>
<%--                type: "POST",--%>
<%--                url: "/contact", // Adres URL kontrolera obsługującego formularz--%>
<%--                data: $(".form--contact").serialize(), // Dane formularza przesyłane w postaci zserializowanej--%>
<%--                success: function() {--%>
<%--                    // Wyświetl dymek z potwierdzeniem, że formularz został wysłany--%>
<%--                    alert("Twoje zapytanie zostało wysłane.");--%>
<%--                    // Opcjonalnie: Można również wyczyścić formularz po pomyślnym wysłaniu--%>
<%--                    $(".form--contact")[0].reset();--%>
<%--                },--%>
<%--                error: function() {--%>
<%--                    alert("Wystąpił błąd podczas wysyłania formularza.");--%>
<%--                }--%>
<%--            });--%>

<%--            return false; // Zapobiega wysłaniu formularza za pomocą standardowego żądania--%>
<%--        }--%>
<%--    </script>--%>

</footer>
