
$(function () {
    const x = $("#billboard > div");
    setInterval(function () {
      if (x.position().left == -1950) {
        x.animate({ left: "-=650px" }, function () {
          x.css("left", 0);
        });
      } else {
        x.animate({ left: "-=650px" });
      }
    }, 4000);
});