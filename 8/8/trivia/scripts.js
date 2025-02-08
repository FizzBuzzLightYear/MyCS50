document.getElementById('submit-answer').addEventListener('click', function() {
    const selectedAnswer = document.querySelector('input[name="answer"]:checked');
    const feedback = document.getElementById('feedback');

    if (selectedAnswer) {
        if (selectedAnswer.value === 'Paris') {
            feedback.innerText = 'Correct!';
        } else {
            feedback.innerText = 'Incorrect. Try again.';
        }
    } else {
        feedback.innerText = 'Please select an answer.';
    }
});

document.getElementById('submit-answer1').addEventListener('click', function() {
    const selectedAnswer = document.querySelector('input[name="answer"]:checked');
    const feedback = document.getElementById('feedback');

    if (selectedAnswer) {
        if (selectedAnswer.value === 'Berlin') {
            feedback1.innerText = 'Correct!';
        } else {
            feedback1.innerText = 'Incorrect. Try again.';
        }
    } else {
        feedback1.innerText = 'Please select an answer.';
    }
});

// script.js
document.getElementById('myForm').addEventListener('submit', function(event) {
  event.preventDefault(); // Prevent the default form submission behavior

  const userInput = document.getElementById('myTextBox').value;
  const resultArea = document.getElementById('resultArea');

  // Add your form submission logic here
  if (userInput === '42') {
    resultArea.style.backgroundColor = 'green';
    resultArea.innerText = 'You found the answer to life!';
  } else {
    resultArea.style.backgroundColor = 'red';
    resultArea.innerText = 'Try again!';
  }
});
