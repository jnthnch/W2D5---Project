require 'p02_hashing'

class HashSet
  
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if include?(key)
    
    if count == num_buckets - 1
      @count += 1
      resize!  #self.resize! question
      remainder = key.hash % num_buckets
      self[remainder] << key
  
    else
      remainder = key.hash % num_buckets
      self[remainder] << key
      @count += 1
    end
    true
    
  end

  def remove(key)
     if self.include?(key)
       remainder = key.hash % num_buckets
       self[remainder].delete(key)
       @count -= 1
     end
    
    
  end

  def include?(key)
    remainder = key.hash % num_buckets
    self[remainder].include?(key)
  end

  private

  def [](key)
    @store[key]
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
