=begin
P
input is string
return an array of all the possible "consecutive" number series of a speicified
length in that input string

E
it only goes from left to right, and once it reaches the end, it doesn't go to back to the first digit
Series class is required
slices instance method which does the series finding
the return values are arrays with digits, so string to numeric conversion is needed
raise ArgumentError if series is more than length of the base string.

D
arrays
strings
numbers, the return value must be nested array with integers in it.

A
create class Series, takes a string argument containing numbers

def slices method which takes a number as an argument
that numebr will then be used to determine the array size of possible combination
the string will be split, converted to integers and array
create a var to be assigned with an empty array

iterate through the array and use the index of the elements to determine where the
slice starts, use the argument as the size of the slice
next if the array size from the element to the last element is smaller than the slice

return the array with the sliced arrays

=end

class Series
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def slices(slice_size)
    raise ArgumentError if slice_size > string.length
    original_array = string.chars.map(&:to_i)
    combinations = []

    original_array.each_with_index do |_, index|
      next if original_array[index..-1].length < slice_size
      combinations << original_array[index, slice_size]
    end
    combinations
  end
end