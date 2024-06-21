const sliderInputs = document.querySelectorAll('input[data-type="slider"]');

sliderInputs.forEach(function (slider) {
  const points = slider.dataset.points;
  slider.value = points;
  slider.dataset.value = points;
});

const textarea = document.querySelector(
  'textarea.form-control[name="correction_manual_review_attributes[overall_comment]"]'
);
textarea.textContent = "Good job";

const submitBtn = document.getElementById("submit-manual-review-btn");
submitBtn.disabled = false;
submitBtn.click()
