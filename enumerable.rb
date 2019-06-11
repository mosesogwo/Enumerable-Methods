module Enumerable
  def my_each
    for i in self
      yield i
    end
  end


  def my_each_with_index
    idx = 0
    for i in self
      yield i, idx
      idx += 1
    end
  end


  def my_select
    collection = []
    self.my_each do |i|
      if yield i
        collection << i
      end
    end
    collection
  end

  def my_all?
    result = true
    self.my_each do |i|
      if not yield i 
        result = false
      end
    end
    result
  end

  def my_any?
    result = false
    self.my_each do |i|
      if yield i
        result = true
      end
    end
    result
  end

  def my_none?
    result = true
    self.my_each do |i|
      if yield i
        result = false
      end
    end
  end

  def my_count(arg=nil)
    count = 0
    if block_given?
      self.my_each do |i| 
        count += 1 if yield i
      end
    elsif not arg
      count = self.length
    else
      self.my_each do |i|
        count += 1 if i.equal?(arg)
      end
    end
    count
  end

  def my_map
    result = []
    if block_given?
      self.my_each do |i|
        result << (yield i)
      end
    else
      self.my_each do |i|
        result << i
      end
    end
    result
  end

  def my_inject(arg = 0)
    memo = arg
    self.my_each do |i|
      memo = (yield memo, i)
    end
    memo
  end

end


# def multiply_els(array)
# 	array.my_inject {|sum, n| sum * n}
# end

# double_me = Proc.new {|x| x + x}

#TESTS#


# [1,4,234,2].my_each {|n| p n}
# ["hello","string"].my_each_with_index {|value, index| puts "#{index}: #{value}"}
# p [1,2,3,4,5,8,9].my_select {|num| num.even?}
# [3, 6, 2].my_all? {|obj| obj > 0}
# p [3, 6, -1].my_any? {|obj| obj > 0}
# [nil,false].my_none?
# puts [2, 5, 523].my_count {|a| a < 523}
# (1..3).my_inject(4) {|sum, n| sum * n}
# multiply_els([2,4,5])
# (1..4).my_map
# (1..4).my_map {|i| i * i}
# (1..4).my_map(&double_me)