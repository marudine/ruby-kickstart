# Given a nonnegative integer, return a hash whose keys are all the odd nonnegative integers up to it
# and each key's value is an array containing all the even non negative integers up to it.
#
# Examples:
# staircase 1  # => {1 => []}
# staircase 2  # => {1 => []}
# staircase 3  # => {1 => [], 3 => [2]}
# staircase 4  # => {1 => [], 3 => [2]}
# staircase 5  # => {1 => [], 3 => [2], 5 =>[2, 4]}


def staircase(val)

  h, arr = {}, []
  (1..val).each do |i|
    h[i]=[] if i.odd?
  end

  h.keys.each do |n|
    arr, e = [], n - 1
    until e <= 0
      arr << e
      e -= 2
    end
    h[n] = arr.sort
  end
  h
end
