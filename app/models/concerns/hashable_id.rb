require 'assets/hashids'

module HashableId
  def to_param
    Hashids.new("salt and pepper", 5).encode(id)
  end

  def find(id)
    super(Hashids.new("salt and pepper", 5).decode(id))
  end
end