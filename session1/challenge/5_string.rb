# Given a string, replace every instance of sad to happy
#
# add_more_ruby("The clowns were sad.")         # => "The clowns were happy."
# add_more_ruby("The sad dad said sad stuff.")  # => "The happy dad said happy stuff."
# add_more_ruby("Sad times are ahead!")         # => "Happy times are ahead!"

def add_more_ruby(string)
  string = string.split("")
  string.each_with_index do |chr, i|

    if chr == "s" || chr == "S"
      if string[i + 1] == "a" && string[i + 2] == "d"
        string.slice!(i..(i + 2))
        chr == "s" ? string.insert(i, "happy") : string.insert(i, "Happy")
      end
    end

  end
  string.join
end
