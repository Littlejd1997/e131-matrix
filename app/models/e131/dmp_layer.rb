module E131
  class DmpLayer
    VECTOR = 0x02;
    TYPE = 0xa1;
    FIRST_ADDRESS = 0x0000;
    ADDRESS_INCREMENT = 0x0001;
    attr_reader :property_values
    def initialize(dmp_layer)
      @flength, @vector, @type, @firstAddress, @addressIncrement, @propertyValueCount = dmp_layer.unpack('S>CCS>S>S>')
      @property_values = dmp_layer[10..]
    end
  end
end
