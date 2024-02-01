jQuery(document).ready(function() {
  jQuery('.design-option').change(function() {
    jQuery('.design-label').removeClass('selected-design');
    jQuery(this).next('.design-label').addClass('selected-design');
  });

  // マウスオーバー時のイベント（修正）
  jQuery('.design-label').mouseover(function() {
    jQuery(this).addClass('mouseover-style');
  });

  // マウスアウト時のイベント（修正）
  jQuery('.design-label').mouseout(function() {
    jQuery(this).removeClass('mouseover-style');
  });
});
