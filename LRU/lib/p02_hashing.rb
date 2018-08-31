class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 0.hash if self.empty?
    sum = 0
    self.each_with_index do |el, i|
      sum += (el + i).hash
    end
    sum / self.length
  end
end

class String
  def hash
    arr = []
    self.chars.each {|char| arr << char.ord}
    arr.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    array = self.to_a.sort 
    new_arr = []
    array.each do |subarray|
      new_arr << subarray[0].hash
      new_arr << subarray[1].hash
    end
    new_arr.hash
    
  end
end
