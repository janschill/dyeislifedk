document.addEventListener('DOMContentLoaded', () => {
  const $shopButtons = Array.prototype.slice.call(document.querySelectorAll('.button-shop'), 0);
  if ($shopButtons.length > 0) {
    $shopButtons.forEach(el => {
      el.addEventListener('click', () => {
        const target = el.dataset.target;
        const $target = document.getElementById(target);
        el.disabled = true;
        $target.classList.add('is-sold-out');
      });
    });
  }
});
