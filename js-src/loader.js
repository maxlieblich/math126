$(function (){
  location.hash = "#welcome.html";
  loader("welcome.html");
});

var loader = function (s) {
    // load content from server
    $.get(s, function (data){
      var result = $(data);
      $("#content").html(result);
      // send event to Google Analytics
      // ga('send', 'event', 'content', 'load', s);
      // process math
      MathJax.Hub.Queue(["Typeset", MathJax.Hub, "content"]);
  });
}

window.onhashchange = function () {
  console.log(location.hash);
  loader(location.hash.substring(1));
}
