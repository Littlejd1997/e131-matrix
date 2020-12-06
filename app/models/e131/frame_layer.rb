module E131
  class FrameLayer
    attr_reader :universe
    VECTOR = 0x00000002;

    def initialize(frame_layer)
      @flength = frame_layer[0..1].unpack('S>')[0]
      @vector = frame_layer[2..5].unpack('L>')[0]
      @sourceName = frame_layer[6..69].strip
      @priority, @reserved, @sequenceNumber, @options, @universe = frame_layer[70..76].unpack('CS>CCS>')

      @is_valid = @vector == VECTOR
    end
  end
end
