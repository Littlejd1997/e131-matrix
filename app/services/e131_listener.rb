class E131Listener

  def initialize
    @framebuffer = []
    @socket = UDPSocket.new
    @socket.bind('0.0.0.0', 5568)
    call_block_when_data_recieved do |msg|
      e=E131::Packet.new(msg)
      
      start_pixel = 170 * (e.frame_layer.universe - 1)
      pixel_offset = 1
      e.dmp_layer.property_values.bytes[1..].each_slice(3).each_with_index do |(red,green,blue), index|
        @framebuffer[start_pixel + index] = "rgb(#{red},#{green},#{blue})"
      end
      if @framebuffer.size == 2500
        ActionCable.server.broadcast("matrix",
        {values: @framebuffer})
        @framebuffer = []
      end      

      # puts msg[0].bytes.reject {|a| a == 0}.inspect
    end

  end
  def close
    @socket.close
  end

  def reload_socket
    @socket.close
    @socket = UDPSocket.new
    @socket.bind('0.0.0.0', 5568)
  end

  def call_block_when_data_recieved(&block)
    @block = block
    Thread.new{
      while true
        payload = @socket.recvmsg
        block.call(payload)
      end
    }
  end

end
