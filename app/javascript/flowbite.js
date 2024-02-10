document.addEventListener('turbo:load', function() {
  // ドロップダウンをトリガーする要素をすべて選択
  const dropdownToggles = document.querySelectorAll('[data-dropdown-toggle]');

  // それぞれのトリガーに対してクリックイベントリスナーを設定
  dropdownToggles.forEach(function(toggle) {
    toggle.addEventListener('click', function() {
      // ドロップダウンメニューのIDをdata-dropdown-toggle属性から取得
      const menuId = toggle.getAttribute('data-dropdown-toggle');
      const menu = document.getElementById(menuId);

      // メニューが存在する場合、その表示状態を切り替える
      if (menu) {
        menu.classList.toggle('hidden');
      }
    });
  });
});
