//display current bgImg
var GLOBAL_IMG = "bgImg";
const GLOBAL_BLUR = "bgBlur";



var input = document.querySelector('.wallPicker');
var blur = document.querySelector('.slider');
var preview = document.querySelector('.preview');
var prevImg = document.querySelector('.previewImage');
input.addEventListener('change', display);
blur.addEventListener('change', saveBlur);

if (localStorage.getItem(GLOBAL_IMG) != null) {
  prevImg.src = (localStorage.getItem(GLOBAL_IMG));
}

if (localStorage.getItem(GLOBAL_BLUR) != null) {
  blur.value = localStorage.getItem(GLOBAL_BLUR);
  prevImg.setAttribute("style", "filter:blur(" + blur.value + "px)");
}

function display() {
  var f = input.files;
  var file = f[0];

  prevImg.src = window.URL.createObjectURL(file);
  console.log(file);

  var fileReader = new FileReader();
  var data = "";

  /**
  * File resizing doesn't seem to work
  * See https://codepen.io/tuanitpro/pen/wJZJbp for a working manifest_version
  */
  
  // if (!file) console.log("You got screwed");

  // Set the image once loaded into file reader
  // fileReader.onload = function(e) {
  //
  //     var img = document.createElement("img");
  //     img.src = e.target.result;
  //
  //     var canvas = document.createElement("canvas");
  //     var ctx = canvas.getContext("2d");
  //     ctx.drawImage(img, 0, 0);
  //
  //     var MAX_WIDTH = 400;
  //     var MAX_HEIGHT = 400;
  //     var width = img.width;
  //     var height = img.height;
  //
  //     if (width > height) {
  //         if (width > MAX_WIDTH) {
  //             height *= MAX_WIDTH / width;
  //             width = MAX_WIDTH;
  //         }
  //     } else {
  //         if (height > MAX_HEIGHT) {
  //             width *= MAX_HEIGHT / height;
  //             height = MAX_HEIGHT;
  //         }
  //     }
  //     canvas.width = width;
  //     canvas.height = height;
  //     var ctx = canvas.getContext("2d");
  //     ctx.drawImage(img, 0, 0, width, height);
  //
  //     dataurl = canvas.toDataURL(file.type);
  //
  //     localStorage.setItem(GLOBAL_IMG, dataurl);
  //
  //     document.getElementById('output').src = dataurl;
  // }


  fileReader.onload = function (e) {
    localStorage.setItem(GLOBAL_IMG, e.target.result);
//     console.log("RES",e.target.result);
  }
  
  fileReader.readAsDataURL(file); //supposedly triggers onloadend?
  
  fileReader.onloadend = function() {
    data = fileReader.result;
//     console.log("RES",fileReader.result);
    localStorage.setItem(GLOBAL_IMG, fileReader.result);
  }

  //console.log(localStorage.getItem(GLOBAL_IMG));
}

function saveBlur() {
  var blVal = blur.value;
  localStorage.setItem(GLOBAL_BLUR, blVal);
  prevImg.setAttribute("style", "filter:blur(" + blur.value + "px)");
}
