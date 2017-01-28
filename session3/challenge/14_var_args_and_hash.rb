# You have two different problems to solve, you must get which one it is from a hash
# The default value for the hash should be :count_clumps
# If no hash is provided, choose count_clumps
#
# PROBLEM: count_clumps
# Say that a "clump" in an array is a series of 2 or more adjacent elements of the same value.
# Return the number of clumps in the given arguments.
#
# problem_14 1, 2, 2, 3, 4, 4, :problem => :count_clumps    # => 2
# problem_14 1, 1, 2, 1, 1,    :problem => :count_clumps    # => 2
# problem_14 1, 1, 1, 1, 1,    :problem => :count_clumps    # => 1
#
#
# PROBLEM: same_ends
# Return true if the group of N numbers at the start and end of the array are the same.
# For example, with [5, 6, 45, 99, 13, 5, 6], the ends are the same for n=0 and n=2, and false for n=1 and n=3.
# You may assume that n is in the range 0..nums.length inclusive.
#
# The first parameter will be n, the rest will be the input to look for ends from
# problem_14 1,   5, 6, 45, 99, 13, 5, 6,  :problem => :same_ends    # => false
# problem_14 2,   5, 6, 45, 99, 13, 5, 6,  :problem => :same_ends    # => true
# problem_14 3,   5, 6, 45, 99, 13, 5, 6,  :problem => :same_ends    # => false

def problem_14(*arr)
  if arr!.include?(Hash)
    count_clumps(arr)
  else
    if arr[0].is_a?(Array)
      arr1 = arr[0]
      hsh = arr[1].values
    else
      arr1 = arr[1]
      hsh = arr[0].values
    end
    same_ends(arr1)
  end
end

def same_ends(n, arr1)
  arr1.take(n) == arr1[-n..-1]
end

def count_clumps(arr1)
  cnt = 0
  return 1 if arr1.all?{|x| x == arr1[0]}
  arr1.each_with_index do |i, ix|
    if i == arr1[ix + 1]
      if ix - 1 == -1
        cnt = 1
      elsif i != arr1[ix - 1]
        cnt += 1
      end
    end
  end
  cnt
end
