function findEditForms() {
  var editIdeaForms = document.getElementsByClassName('edit-idea-form');

  if (editIdeaForms.length) {
    for (var i = 0; i < editIdeaForms.length; i++) {
      prepareIdeaEdits(editIdeaForms[i]);
    }
  }
}

function prepareIdeaEdits(formElement) {
  var goal = formElement.querySelector('#goal');
  var content = formElement.querySelector('#content');
  var submit = formElement.querySelector('[type=submit]');

  var goalValue = goal.value;
  var contentValue = content.value;

  var goalSame = true;
  var contentSame = true;
  var enableSubmit = false;

  goal.addEventListener('input', function() {
    goalSame = this.value === goalValue;
    checkToEnableEditIdeaFormSubmit()
  });

  content.addEventListener('input', function() {
    contentSame = this.value === contentValue;
    checkToEnableEditIdeaFormSubmit()
  });

  //////

  function checkToEnableEditIdeaFormSubmit() {
    if (!goalSame || !contentSame) {
      enableSubmit = true;
    } else {
      enableSubmit = false;
    }

    submit.disabled = !enableSubmit;
  }
}
