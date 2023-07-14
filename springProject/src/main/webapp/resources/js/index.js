$(function () {
    const x = $("#billboard > div");
    setInterval(function () {
      if (x.position().left == -4096) {
        x.animate({ left: "-=1024px" }, function () {
          x.css("left", 0);
        });
      } else {
        x.animate({ left: "-=1024px" });
      }
    }, 4000);
});
