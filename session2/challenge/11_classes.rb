# Write a program that outputs the lyrics for "Ninety-nine Bottles of Beer on the Wall"
# Your program should print the number of bottles in English, not as a number. For example:
#
# Ninety-nine bottles of beer on the wall,
# Ninety-nine bottles of beer,
# Take one down, pass it around,
# Ninety-eight bottles of beer on the wall.
# ...
# One bottle of beer on the wall,
# One bottle of beer,
# Take one down, pass it around,
# Zero bottles of beer on the wall.
#
# Your program should not use ninety-nine output statements!
# Design your program with a class named BeerSong whose initialize method
# receives a parameter indicating the number of bottles of beer initially on the wall.
# If the parameter is less than zero, set the number of bottles to zero. Similarly,
# if the parameter is greater than 99, set the number of beer bottles to 99
# Then make a public method called print_song that outputs all stanzas from the number of bottles of beer down to zero.
# Add any additional methods you find helpful.
class BeerSong

  def initialize(bottles)
    @bottles = bottles
  end

  def print_song
    units = {0 => "Zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine"}
    tens = {0 => "0", 1 => "Ten", 2 => "Twenty-", 3 => "Thirty-", 4 => "Forty-", 5 => "Fifty-", 6 => "Sixty-", 7 => "Seventy-", 8 => "Eighty-", 9 => "Ninety-"}
    teens = {0 => "0", 1 => "Eleven", 2 => "Twelve", 3 => "Thirteen", 4 => "Fourteen", 5 => "Fifteen", 6 => "Sixteen", 7 => "Seventeen", 8 => "Eighteen", 9 => "Nineteen"}

    bttls, bttls2, eng_num, eng_num_minus_1 = "bottles", "bottles", "", ""
    @bottles = 0 if @bottles < 0
    @bottles = 99  if @bottles > 99

    num = @bottles

    while num > 0
      2.times do |toggle|
        num -= 1 if toggle == 1
        nm = num.to_s.chars

        if nm.size == 1
          sum = units[nm[0].to_i].capitalize
        elsif nm[1] == "0"
          sum = tens[nm[0].to_i].slice(/\w+/)
        elsif nm[0] == "1"
          sum = teens.values_at(nm[1].to_i).join
        elsif nm.size == 2
          sum = (tens.values_at(nm[0].to_i) + units.values_at(nm[1].to_i)).join
        end

        toggle == 0 ? eng_num = sum : eng_num_minus_1 = sum

        if eng_num == "One"
          bttls = "bottle"
        elsif eng_num_minus_1 == "One"
          bttls2 = "bottle"
        end

        bttls2 = "bottles" if eng_num_minus_1 == "Zero"

      end

      puts "#{eng_num} #{bttls} of beer on the wall,\n#{eng_num} #{bttls} of beer,\nTake one down, pass it around,\n#{eng_num_minus_1} #{bttls2} of beer on the wall."
      puts

    end
  end
end
