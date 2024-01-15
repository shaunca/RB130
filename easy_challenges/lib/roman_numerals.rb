=begin

create a program that would convert numbers to roman numerals
no roman numeral above 5000

when we initialize roman numeral, we give it a number
we have a method, to roman, that will convert number to roman numeral


to roman method will split the numbers to their places
using their places, determine the letters, and then concatenate the strings together and return that

for the letters, we will have a constant that will be assigned to a hash, where key is number and
value is the letter

=end

class RomanNumeral
  ROMAN_NUMERALS = {1 => 'I', 2 => 'II', 3 => 'III', 4 => 'IV', 5 => 'V',
  6 => 'VI', 7 => 'VII', 8 => 'VIII', 9 => 'IX', 10 => 'X', 20 => 'XX', 30 => 'XXX',
  40 => 'XL', 50 => 'L', 60 => 'LX', 70 => 'LXX', 80 => 'LXXX', 90 => 'XC',
  100 => 'C', 200 => 'CC', 300 => 'CCC', 400 => 'CD', 500 => 'D', 600 => 'DC',
  700 => 'DCC', 800 => 'DCCC', 900 => 'CM', 1000 => 'M', 2000 => 'MM', 3000 => 'MMM'}

  def initialize(num)
    @number = num
  end

  def to_roman
    str_arr = @number.to_s.chars.reverse

    str_arr.map.with_index do |str_num, index|
      next '' if str_num == '0'
      zero_added = '0' * index
      numeral = (str_num + zero_added).to_i
      ROMAN_NUMERALS[numeral]
    end.reverse.join
  end

end
