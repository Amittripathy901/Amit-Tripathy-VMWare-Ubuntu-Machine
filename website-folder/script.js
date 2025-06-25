document.getElementById('contact-form').addEventListener('submit', function(event) {
    event.preventDefault();
    alert('Your message has been sent!');
});

document.getElementById('contact-form').addEventListener('submit', function(event) {
    event.preventDefault();
    alert('Your message has been sent!');
});

// Open resume link in a new tab
document.querySelector('a[href="resume.pdf"]').addEventListener('click', function(event) {
    event.preventDefault();
    window.open('resume.pdf', '_blank');
});
