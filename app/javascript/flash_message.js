function handleFlashMessages() {
  const flashMessages = document.querySelectorAll('.flash-message');
  flashMessages.forEach(flash => {
    flash.style.opacity = 1;
    setTimeout(() => {
      const fadeOutInterval = setInterval(() => {
        let opacity = parseFloat(flash.style.opacity);
        if (opacity <= 0.05) {
          clearInterval(fadeOutInterval);
          flash.remove();
        } else {
          flash.style.opacity = opacity - 0.05;
        }
      }, 50);
    }, 5000);
  });
}

document.addEventListener('DOMContentLoaded', handleFlashMessages);
document.addEventListener('turbo:load', handleFlashMessages);
