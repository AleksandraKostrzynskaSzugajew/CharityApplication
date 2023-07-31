<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>"/>
</head>


<body>
<%@ include file="header.jsp" %>

<div class="slogan container container--90">
    <h2>
        <br>
        <br>
        <br>
        <br>
        Dziękujemy za dołączenie do naszej społeczności! Proszę, wejdź na podany maila i aktywuj swoje konto!
        <br>
        <br>
        <br>
        <br>
        <br>
    </h2>
</div>

<%@ include file="footer.jsp" %>

<script src="<c:url value="/js/app.js"/>"></script>
</body>
</html>
