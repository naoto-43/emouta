document.addEventListener("turbo:load", function() {
  var headerHeight = document.querySelector('header').offsetHeight;
  var headerText = document.querySelector('header').outerText;
  var headerLeft = document.querySelector('header').offsetLeft;
  var headerElement = document.querySelector('header');
  console.log(headerText);
  console.log(headerLeft);
  console.log(headerElement);
  console.log(headerHeight); // コンソールにヘッダーの高さを表示
  document.getElementById('main-content').style.paddingTop = headerHeight + 'px';
});
