module E131
  class Packet
    attr_reader :dmp_layer
    attr_reader :frame_layer
    def initialize(msg)
      bytes = msg[0]
      @root_data = RootLayer.new(bytes[..38])
      @frame_layer = FrameLayer.new(bytes[38..115])
      @dmp_layer = DmpLayer.new(bytes[115..])
    end

  end
end
