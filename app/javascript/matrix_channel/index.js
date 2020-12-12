import consumer from "../channels/consumer"
window.pixel_buffer = new Array(2500)
consumer.subscriptions.create({ channel: "MatrixChannel" }, {
  received(data) {
    var start_pixel = 170 * (data.universe - 1)
    var pixel_offset = 1
    var pixels = data.values
    var current_pixel = 0

    while (pixels.length > 0) {
      let red = pixels.shift()
      let green = pixels.shift()
      let blue = pixels.shift()
      current_pixel = pixel_offset + start_pixel
      // console.log(`setting ${pixel_offset + start_pixel} to rgb(${red},${green},${blue})`)
      try {
        window.pixel_buffer[pixel_offset + start_pixel] = {id: pixel_offset + start_pixel, color:`rgb(${red},${green},${blue})`}
      }catch(error){
        console.log(`Failed to set pixel ${pixel_offset + start_pixel} to rgb(${red},${green},${blue})`)
      }
      pixel_offset++
    }
    console.log(current_pixel)
    let empty_pixels = window.pixel_buffer.reduce(function(x, y){ return x-1; }, window.pixel_buffer.length);
    if (empty_pixels == 0){
      window.pixel_buffer.forEach(element => {
        document.getElementById(element.id).style.backgroundColor = element.color
      });
      window.pixel_buffer = new Array(2500)
    }
  }
})
