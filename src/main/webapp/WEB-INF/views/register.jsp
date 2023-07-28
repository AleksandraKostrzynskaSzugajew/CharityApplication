<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Załóż konto</title>
  <link rel="stylesheet" href="<c:url value="/css/style.css" />" />
  <script src="<c:url value="/js/app.js" />"></script>

  <style>
    /* Stylizacja podpowiedzi */
    .form-hint {
      color: red;
      font-size: 12px;
      margin-top: 5px;
      display: block;
    }
  </style>
</head>
<body>
<%@ include file="header.jsp" %>

<section class="login-page">
  <h2>Załóż konto</h2>
  <form:form action="/home/register" method="post">
    <div class="form-group">
      <input type="email" name="email" placeholder="Email" />
    </div>
    <div class="form-group">
      <input type="password" name="password" id="password" placeholder="Hasło" />
      <span id="passwordHint" class="form-hint"></span>
    </div>
    <div class="form-group">
      <input type="text" name="name" placeholder="Imię" />
    </div>

    <div class="form-group form-group--buttons">
      <a href="login.jsp" class="btn btn--without-border">Zaloguj się</a>
      <button class="btn" type="submit">Załóż konto</button>
    </div>

    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

  </form:form>
</section>

<script>
  const passwordInput = document.getElementById('password');
  const passwordHint = document.getElementById('passwordHint');

  function validatePassword() {
    const password = passwordInput.value;
    // Wyrażenie regularne do walidacji hasła
    const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

    if (!regex.test(password)) {
      passwordHint.textContent =
              'Hasło powinno mieć co najmniej 8 znaków, zawierać dużą literę, małą literę, cyfrę oraz znak specjalny: @$!%*?&';
      return false;
    }

    passwordHint.textContent = '';
    return true;
  }

  document.querySelector('form').addEventListener('submit', function (event) {
    if (!validatePassword()) {
      event.preventDefault();
    }
  });

  passwordInput.addEventListener('input', validatePassword);
</script>

<%@ include file="footer.jsp" %>
</body>
</html>
