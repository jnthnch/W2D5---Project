include Enumerable

class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  def initialize
    @head = Node.new(:head)
    @tail = Node.new(:tail)
    
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next unless empty?
  end

  def last
    @tail.prev unless empty?
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    if self.include?(key)
      current_node = @head
      until current_node.key == key
        current_node = current_node.next
      end    
      current_node.val
    end
    
  end

  def include?(key)
    current_node = @head
    until current_node.next.nil?
      return true if current_node.key == key
      current_node = current_node.next
    end
    false
  end

  def append(key, val)
    tail_prev = @tail.prev
    new_node = Node.new(key, val)
    
    @tail.prev = new_node
    tail_prev.next = new_node
    
    new_node.prev = tail_prev
    new_node.next = @tail
  end

  def update(key, val)
    if self.include?(key)
      current_node = @head
      until current_node.key == key
        current_node = current_node.next
      end    
      current_node.val = val
    end
  end

  def remove(key)
    if self.include?(key)
      current_node = @head
      until current_node.key == key
        current_node = current_node.next
      end    
      current_node.prev.next = current_node.next
      current_node.next.prev = current_node.prev
      
    end
  end

  def each
    current_node = @head.next
    until current_node.next.nil?
      yield current_node
      current_node = current_node.next
    end 
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
