import consumer from "../channels/consumer"
window.pixel_buffer = []
consumer.subscriptions.create({ channel: "MatrixChannel" }, {
  received(data) {
    data.values.forEach((pixel, index)=>{
      document.getElementById(index.toString()).style.backgroundColor = pixel
    })
  }
})
