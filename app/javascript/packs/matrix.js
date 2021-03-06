// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("matrix_channel")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

let resize_dots = () => {
  x = $('.dot').width();
  elements = document.querySelectorAll(".dot")
  for (let i = 0; i < elements.length; i++) {
    elements[i].style.height = x+"px"
  }
}

$(window).on('resize', resize_dots)
$(resize_dots)


