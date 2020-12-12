import consumer from "../channels/consumer"
window.pixel_buffer = []
consumer.subscriptions.create({ channel: "MatrixChannel" }, {
  received(data) {
    data.values.forEach((pixel, index)=>{
      document.getElementById((index +1).toString()).style.backgroundColor = pixel
    })
  //   })
  //   var start_pixel = 170 * (data.universe - 1)
  //   var pixel_offset = 1
  //   var pixels = data.values
  //   var current_pixel = 0
  //   if (start_pixel == 0){
  //     window.pixel_buffer = []
  //   }

  //   while (pixels.length > 0) {
  //     let red = pixels.shift()
  //     let green = pixels.shift()
  //     let blue = pixels.shift()
  //     current_pixel = pixel_offset + start_pixel
  //     // console.log(`setting ${pixel_offset + start_pixel} to rgb(${red},${green},${blue})`)
  //     try {
  //       window.pixel_buffer.push({id: pixel_offset + start_pixel, color:`rgb(${red},${green},${blue})`})
  //     }catch(error){
  //       console.log(`Failed to set pixel ${pixel_offset + start_pixel} to rgb(${red},${green},${blue})`)
  //     }
  //     pixel_offset++
  //   }
  //   console.log(current_pixel)
  //   if (current_pixel == 2500){
  //     window.pixel_buffer.forEach(element => {
  //       document.getElementById(element.id).style.backgroundColor = element.color
  //     });
  //   }
  }
})
