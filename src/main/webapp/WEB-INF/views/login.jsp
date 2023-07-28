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
</head>
<body>
<%@ include file="header.jsp" %>

<section class="login-page">
  <h2>Zaloguj się</h2>
  <form method="post" id="loginForm">
    <div class="form-group">
      <input type="email" name="email" placeholder="Email"/>
    </div>
    <div class="form-group">
      <input type="password" name="password" id="password" placeholder="Hasło"/>
      <a href="/home/resetpass" class="btn btn--small btn--without-border reset-password">Przypomnij hasło</a>
    </div>

    <div class="form-group form-group--buttons">
      <a href="#" class="btn btn--without-border">Załóż konto</a>
      <button class="btn" type="submit">Zaloguj się</button>
    </div>

    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

  </form>
</section>

<%@ include file="footer.jsp" %>

<script>
  function validatePassword() {
    const passwordInput = document.getElementById('password');
    const password = passwordInput.value;

    // Wyrażenie regularne do walidacji hasła
    const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

    if (!regex.test(password)) {
      passwordInput.setCustomValidity("Hasło powinno mieć co najmniej 8 znaków, zawierać dużą literę, małą literę, cyfrę oraz znak specjalny: @$!%*?&");
    } else {
      passwordInput.setCustomValidity("");
    }
  }

  document.getElementById('password').addEventListener('input', validatePassword);
  document.getElementById('loginForm').addEventListener('submit', function(event) {
    if (!this.checkValidity()) {
      event.preventDefault();
    }
  });
</script>
</body>
</html>
