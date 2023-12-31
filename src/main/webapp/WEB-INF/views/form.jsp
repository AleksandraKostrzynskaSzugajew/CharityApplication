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

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>
        <form:form action="/donated" method="post" modelAttribute="donation">

        <!-- STEP 1: class .active is switching steps -->
        <div data-step="1" class="active">
            <h3>Zaznacz co chcesz oddać:</h3>

            <div class="form-group form-group--checkbox">
                <c:forEach var="category" items="${categories}">
                    <div class="form-group form-group--checkbox">
                        <label>
                            <input type="checkbox" name="categories" id="categories" value="${category.id}"/>
                            <span class="checkbox"></span>
                            <span class="description">${category.name}</span>
                        </label>
                    </div>
                </c:forEach>
            </div>

            <div class="form-group form-group--buttons">
                <button type="button" class="btn next-step">Dalej</button>
            </div>
        </div>

        <!-- STEP 2 -->
        <div data-step="2">
            <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

            <div class="form-group form-group--inline">
                <label>
                    Liczba 60l worków:
                    <input type="number" name="quantity" id="quantity" step="1" min="1"/>
                </label>
            </div>

            <div class="form-group form-group--buttons">
                <button type="button" class="btn prev-step">Wstecz</button>
                <button type="button" class="btn next-step">Dalej</button>
            </div>
        </div>

        <!-- STEP 3 -->
        <div data-step="3">
            <h3>Wybierz organizację, której chcesz pomóc:</h3>

            <c:forEach var="institution" items="${institutions}">
                <div class="form-group form-group--radio">
                    <label>
                        <input type="radio" name="institution" value="${institution.id}"/>
                        <span class="radio"></span>
                        <span class="description">${institution.name}</span>
                    </label>
                </div>
            </c:forEach>

            <div class="form-group form-group--buttons">
                <button type="button" class="btn prev-step">Wstecz</button>
                <button type="button" class="btn next-step">Dalej</button>
            </div>
        </div>


        <!-- STEP 4 -->
        <div data-step="4">
            <h3>Podaj adres oraz termin odbioru rzeczy przez kuriera:</h3>

            <div class="form-section form-section--columns">
                <div class="form-section--column">
                    <h4>Adres odbioru</h4>
                    <div class="form-group form-group--inline">
                        <label> Ulica <input type="text" name="street" id="street"/> </label>
                    </div>

                    <div class="form-group form-group--inline">
                        <label> Miasto <input type="text" name="city" id="city"/> </label>
                    </div>

                    <div class="form-group form-group--inline">
                        <label> Kod pocztowy <input type="text" name="zipCode" id="zipCode"/> </label>
                    </div>

                    <div class="form-group form-group--inline">
                        <label> Numer telefonu <input type="phone" name="phone" id="phone"/> </label>
                    </div>
                </div>

                <div class="form-section--column">
                    <h4>Termin odbioru</h4>
                    <div class="form-group form-group--inline">
                        <label> Data <input type="date" name="pickUpDate" id="pickUpDate"/> </label>
                    </div>

                    <div class="form-group form-group--inline">
                        <label> Godzina <input type="time" name="pickUpTime" id="pickUpTime"/> </label>
                    </div>

                    <div class="form-group form-group--inline">
                        <label> Uwagi dla kuriera <textarea name="pickUpComment" id="pickUpComment" rows="5"></textarea>
                        </label>--%>
                    </div>
                </div>
            </div>

            <div class="form-group form-group--buttons">
                <button type="button" class="btn prev-step">Wstecz</button>
                <button type="button" class="btn next-step" id="summary-button">Dalej</button>
            </div>
        </div>


        <!-- STEP 5 -->
        <div data-step="5">
            <h3>Podsumowanie Twojej darowizny</h3>

            <div class="summary">
                <div class="form-section">
                    <h4>Oddajesz:</h4>
                    <ul>
                        <li>
                            <span class="icon icon-bag"></span>
                            <span class="summary--text">
                                    <input type="text" id="summary-quantity" readonly/>

                                </span>
                        </li>

                    </ul>
                </div>


                <div class="form-section">
                    <h4>Wybrane kategorie:</h4>
                    <ul id="summary-categories"></ul>
                </div>

                <div class="form-section">
                    <h4>Wybrane instytucje:</h4>
                    <ul id="summary-institutions"></ul>
                </div>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru:</h4>
                        <ul>
                            <li>
                                <span id="summary-street"></span>
                            </li>
                            <li>
                                <span id="summary-city"></span>
                            </li>
                            <li>
                                <span id="summary-zipCode"></span>
                            </li>
                            <li>
                                <span id="summary-phone"></span>
                            </li>
                        </ul>
                    </div>

                    <div class="form-section--column">
                        <h4>Termin odbioru:</h4>
                        <ul>
                            <li>
                                <span id="summary-pickUpDate"></span>
                            </li>
                            <li>
                                <span id="summary-pickUpTime"></span>
                            </li>
                            <li>
                                <span id="summary-pickUpComment"></span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="form-group form-group--buttons">
                <button type="button" class="btn prev-step">Wstecz</button>
                <button type="submit" class="btn" id="summary-confirm-button">Potwierdzam</button>
            </div>
        </div>



    </div>

    <input type="hidden" name="userId" value="${userId}"/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form:form>
    </div>

    </div>

</section>

<%@ include file="footer.jsp" %>

<script>
    // Aktualizacja wartości w podsumowaniu
    const summaryConfirmBtn = document.getElementById('summary-btn');

    summaryConfirmBtn.addEventListener('click', () => {
        const quantityInput = document.getElementById('quantity');
        console.log(quantityInput);

        const streetInput = document.getElementById('street');
        console.log(streetInput);

        const cityInput = document.getElementById('city');
        const zipCodeInput = document.getElementById('zipCode');
        const phoneInput = document.getElementById('phone');
        const pickUpDateInput = document.getElementById('pickUpDate');
        const pickUpTimeInput = document.getElementById('pickUpTime');
        const pickUpCommentInput = document.getElementById('pickUpComment');


        const summaryQuantity = document.getElementById('summary-quantity');
        const summaryStreet = document.getElementById('summary-street');
        const summaryCity = document.getElementById('summary-city');
        const summaryZipCode = document.getElementById('summary-zipCode');
        const summaryPhone = document.getElementById('summary-phone');
        const summaryPickUpDate = document.getElementById('summary-pickUpDate');
        const summaryPickUpTime = document.getElementById('summary-pickUpTime');
        const summaryPickUpComment = document.getElementById('summary-pickUpComment');

        console.log(summaryQuantity);
        console.log(summaryStreet);


        summaryQuantity.value = quantityInput.value;
        summaryStreet.textContent = streetInput.value;
        summaryCity.textContent = cityInput.value;
        summaryZipCode.textContent = zipCodeInput.value;
        summaryPhone.textContent = phoneInput.value;
        summaryPickUpDate.textContent = pickUpDateInput.value;
        summaryPickUpTime.textContent = pickUpTimeInput.value;
        summaryPickUpComment.textContent = pickUpCommentInput.value;


        // Kategorie
        const selectedCategories = document.querySelectorAll('input[name="categories"]:checked');
        const summaryCategories = document.getElementById('summary-categories');
        summaryCategories.innerHTML = '';
        selectedCategories.forEach(category => {
            const categoryName = category.nextElementSibling.nextElementSibling.textContent;
            const li = document.createElement('li');
            li.textContent = categoryName;
            summaryCategories.appendChild(li);
        });

        // Instytucje
        const selectedInstitutions = document.querySelectorAll('input[name="institutions"]:checked');
        const summaryInstitutions = document.getElementById('summary-institutions');
        summaryInstitutions.innerHTML = '';
        selectedInstitutions.forEach(institution => {
            const institutionName = institution.nextElementSibling.nextElementSibling.textContent;
            const li = document.createElement('li');
            li.textContent = institutionName;
            summaryInstitutions.appendChild(li);
        });

        const summaryConfirmBtn = document.getElementById('summary-confirm-button');
        summaryConfirmBtn.addEventListener('click', () => {
            // Wywołanie metody POST
            submitForm();
        });

        function submitForm() {
            // Pobieranie danych z formularza
            const form = document.querySelector('form');
            const formData = new FormData(form);

            // Tworzenie żądania POST
            const xhr = new XMLHttpRequest();
            xhr.open('POST', '/donated', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

            // Obsługa zdarzenia po wysłaniu żądania
            xhr.onload = function () {
                if (xhr.status === 200) {
                    // Przekierowanie na stronę potwierdzenia
                    window.location.href = '/form-confirmation';
                } else {
                    // Obsługa błędu
                    console.error('Wystąpił błąd podczas wysyłania formularza.');
                }
            };

            // Wysłanie żądania POST
            xhr.send(new URLSearchParams(formData));
        }

    });
</script>

<script src="<c:url value="/js/app.js"/>"></script>
</body>
</html>



