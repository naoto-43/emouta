document.addEventListener('turbo:load', function() {
  // デザインオプションの変更時のイベントハンドラーを設定
  document.querySelectorAll('.design-option').forEach(function(element) {
    element.addEventListener('change', function() {
      // すべてのデザインラベルから 'selected-design' クラスを削除
      document.querySelectorAll('.design-label').forEach(function(label) {
        label.classList.remove('selected-design');
      });
      
      // 選択されたオプションの次のデザインラベルに 'selected-design' クラスを追加
      var nextLabel = this.nextElementSibling;
      if (nextLabel && nextLabel.classList.contains('design-label')) {
        nextLabel.classList.add('selected-design');
      }
    });
  });

  // 画面ロード時に選択されているデザインオプションに基づいてラベルをハイライト
  document.querySelectorAll('.design-option').forEach(function(option) {
    if(option.checked) {
      var nextLabel = option.nextElementSibling;
      if (nextLabel && nextLabel.classList.contains('design-label')) {
        nextLabel.classList.add('selected-design');
      }
    }
  });

  // マウスオーバー時のイベントハンドラーを設定
  document.querySelectorAll('.design-label').forEach(function(element) {
    element.addEventListener('mouseover', function() {
      this.classList.add('mouseover-style');
    });
  });

  // マウスアウト時のイベントハンドラーを設定
  document.querySelectorAll('.design-label').forEach(function(element) {
    element.addEventListener('mouseout', function() {
      this.classList.remove('mouseover-style');
    });
  });
});
