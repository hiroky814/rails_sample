function clearActive() {
  $("#menuList li").removeClass("active");
}

function setActive(id) {
  $("#" + id).addClass("active");
}

function setStartClickEvent() {
  $('#start').on('click', function () {
    // 3秒ごとに実行
    setInterval('getServerTime()', 3000);
  })
}

function getServerTime() {
  // ajax実行
  $.ajax({
    type: 'GET',
    url: '/api/v1/server_time',
    dataType: 'json',
    success: function (data) {
      // 通信が正常に行えた場合、画面更新
      $('#time').text(data['time']);
    },
    error: function () {
      // 異常の場合（今回はとりあえずコンソールログ）
      console.log('ajax失敗');
    }
  });
}