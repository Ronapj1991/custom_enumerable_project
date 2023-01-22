module Enumerable
  # Your code goes here
  def my_each_with_index
    idx = 0
    for item in self
      yield item, idx
      idx += 1
    end
  end

  def my_select(&block)
    values = []
    my_each do |item|
      if block.call(item)
        values << item
      end
    end
    values
  end

  def my_all?(&block)
    my_var = true
    my_each do |item|
      if block.call(item)
        my_var = true
      else
        return false
      end
    end
    my_var
  end

  def my_any?(&block)
    my_each do |x|
      if block.call(x)
        return true
      end
    end
    return false
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

    if block_given?
      my_each do |item|
        if block.call(item)
          count += 1
        end
      end
    else
      count = self.length
    end

    count
  end

  def my_map(&block)
    final = []

    if block_given?
      my_each do |item|
        final << block.call(item)
      end
    end
    
    final
  end

  def my_inject(initial, &block)
   accumulator = initial
   my_each do |item|
    accumulator = block.call(accumulator, item)
   end

   accumulator
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

   return self
  end
end