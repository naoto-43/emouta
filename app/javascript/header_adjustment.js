document.addEventListener('turbo:load', function() {
  function adjustLayout() {
      const mainContent = document.getElementById('main-content');
      if (window.innerWidth < 768) { // スマートフォン
          mainContent.style.paddingTop = '70px'; 
      } else if (window.innerWidth >= 768 && window.innerWidth < 1024) { // タブレット
          mainContent.style.paddingTop = '90px';
      } else { // デスクトップ
          mainContent.style.paddingTop = '85px'; 
      }
  }

  window.addEventListener('resize', adjustLayout);

  adjustLayout();
});
