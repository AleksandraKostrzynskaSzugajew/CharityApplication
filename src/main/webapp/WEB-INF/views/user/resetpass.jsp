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
<%@ include file="../header.jsp" %>

<h2>Zresetuj swoje hasło</h2>


<p>Podaj adres email wykorzystany przy rejestracji </p>

<form:form method="post" action="/home/resetpass">
    <div class="form-group">
        Email: <input type="email" name="email" id="email">
    </div>
    <div class="form-group form-group--buttons">
        <button class="btn" type="submit">Wyślij email do resetowania hasła</button>
    </div>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form:form>

<script>
    function validatePassword() {
        const passwordInput = document.getElementById('password');
        const password = passwordInput.value;

        // Wyrażenie regularne do walidacji hasła
        const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

        if (!regex.test(password)) {
            alert("Hasło powinno mieć co najmniej 8 znaków, zawierać dużą literę, małą literę, cyfrę oraz znak specjalny: @$!%*?&");
            return false;
        }

        return true;
    }

    document.querySelector('form').addEventListener('submit', function(event) {
        if (!validatePassword()) {
            event.preventDefault();
        }
    });
</script>


<%@ include file="../footer.jsp" %>
</body>
</html>
