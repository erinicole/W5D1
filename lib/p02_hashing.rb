class Integer
  # Integer#hash already implemented for you
end

class Array
  # def hash
  
  # end
end

class String
  def hash
    alphabet = ("a".."z").to_a
    num = self.split("").map {|char| alphabet.index(char) }.join("").to_i
    num.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  # def hash
  #   0
  # end
end
