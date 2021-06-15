function poyon(){
  const $amigoSpace = $('.amigo-space');
  const form = document.getElementById("form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    $amigoSpace.toggleClass("amigoicon");
  });

};
window.addEventListener('load', poyon);