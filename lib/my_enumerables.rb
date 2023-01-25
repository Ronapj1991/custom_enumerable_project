module Enumerable
  # Your code goes here
  def my_each_with_index(&block)
    idx = 0
    my_each do |item|
      block.call(item, idx)
      idx += 1
    end
    self
  end

  def my_select(&block)
    selected = []
    my_each do |item|
      if block.call(item)
        selected.push(item)
      end
    end
    selected
  end

  def my_all?(&block)
    my_bool = true

    my_each do |item|
      if !block.call(item)
        my_bool = false
      end
    end

    my_bool
  end

  def my_none?(&block)
    my_each do |item|
      if block.call(item)
        return false
      end
    end

    return true
  end

  def my_count(&block)
    count = 0

    if !block_given?
      return self.length
    elsif block_given?
      my_each do |item|
        block.call(item) ? count += 1 : count
      end
    end

    count
  end

  def my_map(&block)
    map = []

    if block_given?
      my_each do |item|
        map.push(block.call(item))
      end
    end

    map
  end

  def my_inject(initial, &block)
    my_each do |item|
      initial = block.call(initial, item)
    end

    initial
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    for item in self
      block.call(item)
    end

    self
  end
end