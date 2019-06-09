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
      if not yield i
        result = true
      end
    end
    result
  end

  def my_none
  end
end

# [2, 3, 4].my_each_with_index


# module Enumerable

#

# 	def my_any?
# 		index = 0
# 		length = self.length
# 		status = false

# 		if block_given?
# 			length.times do
# 				if yield self[index]
# 					status = true
# 					break
# 				else
# 					index += 1
# 				end
# 			end
# 			puts status
# 		else
# 			length.times do
# 				if  self[index]
# 					status = true
# 					break
# 				else
# 					index += 1
# 				end
# 			end	
# 			puts status	
# 		end	
# 	end

# 	def my_none?
# 		index = 0
# 		length = self.length
# 		status = true

# 		if block_given?
# 			length.times do
# 				if not yield self[index]
# 					index +=1
# 				else
# 					index += 1
# 					status = false
# 					break
# 				end
# 			end
# 			puts status
# 		else
# 			length.times do
# 				if not self[index]
# 					index += 1
# 				else
# 					status = false
# 					index += 1
# 					break
# 				end
# 			end	
# 			puts status	
# 		end	
# 	end

# 	def my_count (arg = nil)
# 		index = 0 
# 		length = self.length
# 		count = 0

# 		if block_given?
# 			length.times do
# 				if yield self[index]
# 					count += 1
# 				end
# 				index += 1
# 			end
# 		elsif not arg
# 			#no argument given
# 			count = length
# 		else
# 			#argument given
# 			length.times do
# 				if self[index] == arg
# 					count += 1
# 				end
# 				index += 1 
# 			end
# 		end
# 		puts count
# 	end

# 	def my_map (&my_proc)
# 		index = 0
# 		array = []
# 		enumArray = self.to_a
# 		length = enumArray.length

# 		if block_given?
# 			length.times do 
# 				array << (yield enumArray[index])
# 				index += 1
# 			end
# 		elsif my_proc
# 			length.times do
# 				array << my_proc.call(enumArray[index])
# 				index += 1
# 			end
# 		else 
# 			length.times do
# 				array << enumArray[index]
# 				index += 1 
# 			end
# 		end
# 		p array
# 	end

# 	def my_inject (start = 0)
# 		index = 0
# 		enumArray = self.to_a
# 		length = enumArray.length - 1
# 		total = enumArray[0]

# 		if start != 0 
# 			total = start
# 		end

# 		length.times do
# 			total = yield(total, enumArray[index + 1])
# 			index += 1
# 		end
# 		p total
# 	end

# end


# def multiply_els(array)
# 	array.my_inject {|sum, n| sum * n}
# end

# double_me = Proc.new {|x| x + x}

#TESTS#


# [1,4,234,2].my_each {|n| p n}
# ["hello","string"].my_each_with_index {|value, index| puts "#{index}: #{value}"}
# p [1,2,3,4,5,8,9].my_select {|num| num.even?}
# [3, 6, 2].my_all? {|obj| obj > 0}
p [3,6,-1].my_any? {|obj| obj < 0}
# [nil,false].my_none?
# [2,5,523].my_count() #{|n| n > 4}
# (1..3).my_inject(4) {|sum, n| sum * n}
# multiply_els([2,4,5])
# (1..4).my_map
# (1..4).my_map {|i| i * i}
# (1..4).my_map(&double_me)