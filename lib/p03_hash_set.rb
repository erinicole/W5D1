# class HashSet
#   attr_reader :count

#   def initialize(num_buckets = 8)
#     @store = Array.new(num_buckets) { Array.new }
#     @count = 0
#   end

#   def insert(key)

#   end

#   def include?(key)
#   end

#   def remove(key)
#   end

#   private

#   def [](num)
#     # optional but useful; return the bucket corresponding to `num`

#   end

#   def num_buckets
#     @store.length
#   end

#   def resize!
#   end
# end

class HashSet
  attr_reader :count, :num_buckets

  def initialize(num_buckets = 20)
    @num_buckets = num_buckets
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless self.include?(key)
      self[key] << key
      @count += 1
      resize! if @count == num_buckets
    end
  end

  def remove(key)
    if self.include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  private
  
  def [](key)
    # optional but useful; return the bucket corresponding to `num`
    @store[key.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!

      temp = @store
      @num_buckets *= 2
      @store = Array.new(@num_buckets) {Array.new}
      temp.each do |bucket|
        bucket.each do |num|
          @store[num % num_buckets] << num
        end
      end

  end
end
