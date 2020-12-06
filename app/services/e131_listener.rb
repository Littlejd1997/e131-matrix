class E131Listener

  def initialize
    @socket = UDPSocket.new
    @socket.bind('0.0.0.0', 5568)
    call_block_when_data_recieved do |msg|
      e=E131::Packet.new(msg)
      ActionCable.server.broadcast("matrix",
        {universe: e.frame_layer.universe, values: e.dmp_layer.property_values.bytes[1..]})
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
