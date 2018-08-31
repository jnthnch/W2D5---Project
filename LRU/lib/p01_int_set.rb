class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max, nil)
  end

  def insert(num)
    raise "Out of bounds" if num > @max || num < 0
    if num < @max
      @store[num] = num
      return true
    end
    false
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store.include?(num)
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    remainder = num % num_buckets
    @store[remainder] << num 
  end

  def remove(num)
    remainder = num % num_buckets
    @store[remainder].delete(num)
  end

  def include?(num)
    remainder = num % num_buckets
    @store[remainder].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if include?(num)
    
    if count == num_buckets - 1
      @count += 1
      resize!  #self.resize! question
      remainder = num % num_buckets
      self[remainder] << num
  
    else
      remainder = num % num_buckets
      self[remainder] << num
      @count += 1
    end
    true
    
  end

  def remove(num)
     if self.include?(num)
       remainder = num % num_buckets
       self[remainder].delete(num)
       @count -= 1
     end
    
    
  end

  def include?(num)
    remainder = num % num_buckets
    self[remainder].include?(num)
  end

  private

  def [](num)
    @store[num]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(num_buckets * 2) { Array.new }
    old_store.each do |bucket|
      until bucket.empty?
        value = bucket.shift
        idx = value % num_buckets
        @store[idx] << value
      end
    end 
  end
end
