document.addEventListener('turbo:load', function() {
  function adjustLayout() {
      const mainContent = document.getElementById('main-content');
      if (window.innerWidth < 768) { // 例: スマートフォン
          mainContent.style.paddingTop = '50px'; // ヘッダーの高さに合わせて調整
      } else if (window.innerWidth >= 768 && window.innerWidth < 1024) { // 例: タブレット
          mainContent.style.paddingTop = '70px'; // ヘッダーの高さに合わせて調整
      } else { // 例: デスクトップ
          mainContent.style.paddingTop = '90px'; // ヘッダーの高さに合わせて調整
      }
  }

  // ウィンドウサイズが変更された時にも調整を適用
  window.addEventListener('resize', adjustLayout);

  // 初回読み込み時にレイアウト調整を実行
  adjustLayout();
});
