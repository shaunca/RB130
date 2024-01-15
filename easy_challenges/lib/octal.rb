=begin
P
given an octal string, return a decimal output
invalid input will always return 0

do not use library methods to help with the conversion
we must create the conversion ourselves

decimal is a base 10 system
ocatl system is bas 8

two main points
every decimal place is an additional power

so consider 110
0 * 10^0
1 * 10^1
1 * 10^2

any input that has 8 or 9, or string chars other than numbers is invalid and 0 will be returned

E
inputs are strings
we need an Octal class and a to_decimal method

D
I can see the use of arrays here, where elements are numbers in each digit place
we can use the indices to determine the power of 8 and then multiply it to the element to get the value
in order for the indices to work, we must reverse the array order from the rightmost number first and left last
add the values together and return that number

A
create class octal take string argument

create instance method to_decimal
check if the string is all numbers, if not, return 0
check if string does not contain 8 or 9, if so, return 0
use the string and convert it into an array of numbers, reverse the order
iterate through the array, use the indices to determine the power of 8 and multiply it to the element
return the sum of the transformed array

=end

class Octal
  INVALID_INPUT = ('a'..'z').to_a + ('A'..'Z').to_a + %w(8 9)

  attr_reader :string

  def initialize(string)
    @string = string
  end

  def to_decimal
    num_arr = string.chars.reverse
    return 0 if num_arr.any? {|element| INVALID_INPUT.include?(element)}

    result = num_arr.map.with_index do |element, index|
      power = 8 ** index
      element.to_i * power
    end
    result.inject(&:+)
  end
end
