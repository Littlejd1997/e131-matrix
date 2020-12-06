class MatrixChannel < ApplicationCable::Channel
  def subscribed
    stream_from "matrix"
  end
end
