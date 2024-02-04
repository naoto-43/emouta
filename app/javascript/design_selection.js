document.addEventListener('turbo:load', function() {
  // デザインオプションの変更時のイベント
  document.querySelectorAll('.design-option').forEach(function(element) {
    element.addEventListener('change', function() {
      // すべてのデザインラベルから 'selected-design' クラスを削除
      document.querySelectorAll('.design-label').forEach(function(label) {
        label.classList.remove('selected-design');
      });
      
      // 選択されたオプションの次のデザインラベルに 'selected-design' クラスを追加
      var nextLabel = this.nextElementSibling;
      if (nextLabel.classList.contains('design-label')) {
        nextLabel.classList.add('selected-design');
      }
    });
  });

  // マウスオーバー時のイベント
  document.querySelectorAll('.design-label').forEach(function(element) {
    element.addEventListener('mouseover', function() {
      this.classList.add('mouseover-style');
    });
  });

  // マウスアウト時のイベント
  document.querySelectorAll('.design-label').forEach(function(element) {
    element.addEventListener('mouseout', function() {
      this.classList.remove('mouseover-style');
    });
  });
});
