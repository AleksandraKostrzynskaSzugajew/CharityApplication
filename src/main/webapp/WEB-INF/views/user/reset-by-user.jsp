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
    <link rel="stylesheet" href="<c:url value="/css/styleAdmin.css"/>"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
<%@ include file="../header.jsp" %>

<form:form method="post" id="passwordForm" action="/resetpassbu">
    Haslo: <input type="password" name="password1" id="password1">
    Powtorz haslo: <input type="password" name="password2" id="password2">
    <input type="submit" value="Zmien hasło">
    <input type="hidden" name="userId" value="${user.id}"/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form:form>

<%@ include file="../footer.jsp" %>



<script>
    function validatePassword() {
        const password1Input = document.getElementById('password1');
        const password2Input = document.getElementById('password2');
        const password1 = password1Input.value;
        const password2 = password2Input.value;

        // Sprawdź, czy hasła są takie same
        if (password1 !== password2) {
            alert("Hasła nie są identyczne. Proszę wprowadzić hasła ponownie.");
            password1Input.value = '';
            password2Input.value = '';
            return false;
        }

        // Sprawdź inne wymagane kryteria hasła za pomocą wyrażenia regularnego
        const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

        if (!regex.test(password1)) {
            alert("Hasło powinno mieć co najmniej 8 znaków, zawierać dużą literę, małą literę, cyfrę oraz znak specjalny: @$!%*?&");
            return false;
        }

        return true;
    }

    document.getElementById('passwordForm').addEventListener('submit', function(event) {
        if (!validatePassword()) {
            event.preventDefault();
        }
    });
</script>

</body>


</html>
