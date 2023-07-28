<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="pl">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>"/>
    <script src="<c:url value="/js/app.js"/>"></script>

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
          <input type="password" name="password" placeholder="Hasło" />
        </div>
        <div class="form-group">
          <input type="name" name="name" placeholder="Imie" />
        </div>
<%--        <div class="form-group">--%>
<%--          <input type="password" name="password2" placeholder="Powtórz hasło" />--%>
<%--        </div>--%>

        <div class="form-group form-group--buttons">
          <a href="login.jsp" class="btn btn--without-border">Zaloguj się</a>
          <button class="btn" type="submit">Załóż konto</button>
        </div>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

      </form:form>
    </section>

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
  <%@ include file="footer.jsp" %>

  </body>
</html>
