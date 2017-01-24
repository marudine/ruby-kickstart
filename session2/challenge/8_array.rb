# Given an array of elements, return true if any element shows up three times in a row
#
# Examples:
# got_three? [1, 2, 2, 2, 3]  # => true
# got_three? ['a', 'a', 'b']  # => false
# got_three? ['a', 'a', 'a']  # => true
# got_three? [1, 2, 1, 1]     # => false

def got_three?(thrice)
  thrice.each_with_index do |elm, i|
    if elm == thrice[i + 1]
      return true if elm == thrice[i + 2]
    end
  end
  false
end
