module E131
  class RootLayer
    ACN_PID = [0x41, 0x53, 0x43, 0x2d, 0x45, 0x31, 0x2e, 0x31, 0x37, 0x00, 0x00, 0x00]
    def initialize(root_data)
      @preamble_size = root_data[..1].unpack('S>')[0]
      @postamble_size = root_data[2..3].unpack('S>')[0]
      @acnPId = root_data[4..15]
      @flength = root_data[16..17].unpack('S>')[0]
      @vector =  root_data[18..19].unpack('S>')[0]
      @cid = root_data[22..38]

      @is_valid = ACN_PID == @acnPId
    end
  end
end
