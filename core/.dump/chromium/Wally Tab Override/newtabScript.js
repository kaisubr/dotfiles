//display current bgImg
var GLOBAL_IMG = "bgImg";
const GLOBAL_BLUR = "bgBlur";


var bod = document.querySelector('.bodImg');

if (localStorage.getItem(GLOBAL_IMG) != null) {
  bod.src = (localStorage.getItem(GLOBAL_IMG));
}

if (localStorage.getItem(GLOBAL_BLUR) != null) {
  var b =  localStorage.getItem(GLOBAL_BLUR);
  bod.setAttribute("style", "filter:blur(" + b + "px)");
}
