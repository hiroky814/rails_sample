function clearActive() {
  $("#menuList li").removeClass("active");
}

function setActive(id) {
    $("#" + id).addClass("active");
}