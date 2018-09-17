class NodeCountError < StandardError
  def initialize(msg="Maximum node search count exceeded")
    super
  end
end
