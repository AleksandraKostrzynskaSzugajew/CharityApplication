document.addEventListener("DOMContentLoaded", function() {

  /**
   * Form Select
   */
  class FormSelect {
    constructor($el) {
      this.$el = $el;
      this.options = [...$el.children];
      this.init();
    }

    init() {
      this.createElements();
      this.addEvents();
      this.$el.parentElement.removeChild(this.$el);
    }

    createElements() {
      // Input for value
      this.valueInput = document.createElement("input");
      this.valueInput.type = "text";
      this.valueInput.name = this.$el.name;

      // Dropdown container
      this.dropdown = document.createElement("div");
      this.dropdown.classList.add("dropdown");

      // List container
      this.ul = document.createElement("ul");

      // All list options
      this.options.forEach((el, i) => {
        const li = document.createElement("li");
        li.dataset.value = el.value;
        li.innerText = el.innerText;

        if (i === 0) {
          // First clickable option
          this.current = document.createElement("div");
          this.current.innerText = el.innerText;
          this.dropdown.appendChild(this.current);
          this.valueInput.value = el.value;
          li.classList.add("selected");
        }

        this.ul.appendChild(li);
      });

      this.dropdown.appendChild(this.ul);
      this.dropdown.appendChild(this.valueInput);
      this.$el.parentElement.appendChild(this.dropdown);
    }

    addEvents() {
      this.dropdown.addEventListener("click", e => {
        const target = e.target;
        this.dropdown.classList.toggle("selecting");

        // Save new value only when clicked on li
        if (target.tagName === "LI") {
          this.valueInput.value = target.dataset.value;
          this.current.innerText = target.innerText;
        }
      });
    }
  }
  document.querySelectorAll(".form-group--dropdown select").forEach(el => {
    new FormSelect(el);
  });

  /**
   * Hide elements when clicked on document
   */
  document.addEventListener("click", function(e) {
    const target = e.target;
    const tagName = target.tagName;

    if (target.classList.contains("dropdown")) return false;

    if (tagName === "LI" && target.parentElement.parentElement.classList.contains("dropdown")) {
      return false;
    }

    if (tagName === "DIV" && target.parentElement.classList.contains("dropdown")) {
      return false;
    }

    document.querySelectorAll(".form-group--dropdown .dropdown").forEach(el => {
      el.classList.remove("selecting");
    });
  });

  /**
   * Switching between form steps
   */
  class FormSteps {
    constructor(form) {
      this.$form = form;
      this.$next = form.querySelectorAll(".next-step");
      this.$prev = form.querySelectorAll(".prev-step");
      this.$step = form.querySelector(".form--steps-counter span");
      this.currentStep = 1;

      this.$stepInstructions = form.querySelectorAll(".form--steps-instructions p");
      const $stepForms = form.querySelectorAll("form > div");
      this.slides = [...this.$stepInstructions, ...$stepForms];

      this.init();
    }

    /**
     * Init all methods
     */
    init() {
      this.events();
      this.updateForm();
    }

    /**
     * All events that are happening in form
     */
    events() {
      // Next step
      this.$next.forEach(btn => {
        btn.addEventListener("click", e => {
          e.preventDefault();
          this.currentStep++;
          this.updateForm();
        });
      });

      // Previous step
      this.$prev.forEach(btn => {
        btn.addEventListener("click", e => {
          e.preventDefault();
          this.currentStep--;
          this.updateForm();
        });
      });

      // Form submit
      this.$form.querySelector("form").addEventListener("submit", e => this.submit(e));
    }

    /**
     * Update form front-end
     * Show next or previous section etc.
     */
    updateForm() {
      this.$step.innerText = this.currentStep;

      // Get input values
      const quantityInput = document.getElementById('quantity');
      const selectedCategories = document.querySelectorAll('input[name="categories"]:checked');
      const selectedInstitutions = document.querySelectorAll('input[name="institutions"]:checked');
      const streetInput = document.getElementById('street');
      const cityInput = document.getElementById('city');
      const zipCodeInput = document.getElementById('zipCode');
      const phoneInput = document.getElementById('phone');
      const pickUpDateInput = document.getElementById('pickUpDate');
      const pickUpTimeInput = document.getElementById('pickUpTime');
      const pickUpCommentInput = document.getElementById('pickUpComment');

// Update summary values
      const summaryQuantity = document.getElementById('summary-quantity');
      summaryQuantity.value = quantityInput.value;

      const summaryCategories = document.getElementById('summary-categories');
      summaryCategories.innerHTML = '';
      selectedCategories.forEach(category => {
        const categoryName = category.nextElementSibling.nextElementSibling.textContent;
        const li = document.createElement('li');
        li.textContent = categoryName;
        summaryCategories.appendChild(li);
      });

      const summaryInstitutions = document.getElementById('summary-institutions');
      summaryInstitutions.innerHTML = '';
      selectedInstitutions.forEach(institution => {
        const institutionName = institution.nextElementSibling.nextElementSibling.textContent;
        const li = document.createElement('li');
        li.textContent = institutionName;
        summaryInstitutions.appendChild(li);
      });

      const summaryStreet = document.getElementById('summary-street');
      summaryStreet.textContent = streetInput.value;

      const summaryCity = document.getElementById('summary-city');
      summaryCity.textContent = cityInput.value;

      const summaryZipCode = document.getElementById('summary-zipCode');
      summaryZipCode.textContent = zipCodeInput.value;

      const summaryPhone = document.getElementById('summary-phone');
      summaryPhone.textContent = phoneInput.value;

      const summaryPickUpDate = document.getElementById('summary-pickUpDate');
      summaryPickUpDate.textContent = pickUpDateInput.value;

      const summaryPickUpTime = document.getElementById('summary-pickUpTime');
      summaryPickUpTime.textContent = pickUpTimeInput.value;

      const summaryPickUpComment = document.getElementById('summary-pickUpComment');
      summaryPickUpComment.textContent = pickUpCommentInput.value;



      // TODO: Validation

      this.slides.forEach(slide => {
        slide.classList.remove("active");

        if (slide.dataset.step == this.currentStep) {
          slide.classList.add("active");
        }
      });

      this.$stepInstructions[0].parentElement.parentElement.hidden = this.currentStep >= 5;
      this.$step.parentElement.hidden = this.currentStep >= 5;

      // TODO: get data from inputs and show them in summary
    }

  }
  const form = document.querySelector(".form--steps");
  if (form !== null) {
    new FormSteps(form);
  }
});
