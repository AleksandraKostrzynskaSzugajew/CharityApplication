<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="css/style.css"/>"/>
</head>


<body>
<%@ include file="header.jsp" %>

<div class="slogan container container--90">
    <h2>
        <br>
        <br>
        O Nas
        <br>
        <img src="<c:url value="images/about-us.jpg"/> "/>
        <br>


        <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse et mi id nisi rhoncus varius.
            In est justo, pellentesque eget dolor non, molestie sodales enim. Vestibulum id ultricies arcu,
            et imperdiet leo. Donec eleifend, lacus ultricies congue imperdiet, odio turpis suscipit libero,
            et hendrerit metus diam eu est. Duis mauris velit, congue eu tincidunt ac, ultricies eget orci.
            Cras vel porta ex, quis efficitur elit. Sed quam elit, consequat eget dolor id, condimentum fringilla sem.
            Integer dolor quam, varius non dapibus et, pretium ut mauris. Aenean diam velit, porta sit amet dignissim
            eu,
            lacinia nec turpis. Duis suscipit nibh ac arcu blandit, vitae lacinia felis posuere. Aenean nec massa
            ante.</p>

        <p>Aenean tristique ante orci, non volutpat lectus tempor sit amet.
            Phasellus a pharetra erat. Vivamus tristique leo non mi venenatis,
            sed gravida sapien pretium. Cras sit amet tincidunt metus.
            Phasellus ornare diam quis felis sollicitudin iaculis quis sed justo.
            Integer vitae tempor sapien, sed rhoncus risus. Ut aliquet et enim at condimentum.
            Quisque facilisis nibh et lorem pretium tincidunt. Etiam laoreet sapien in justo euismod faucibus.
            Nunc finibus nisl lorem, tincidunt consequat metus egestas id.</p>
        <br>
        <br>
        <br>
        <br>
        <br>
    </h2>
</div>

<%@ include file="footer.jsp" %>

<script src="<c:url value="js/app.js"/>"></script>
</body>
</html>
