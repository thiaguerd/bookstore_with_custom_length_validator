class Integer
  def included?(array)
    array.include? self
  end
end
