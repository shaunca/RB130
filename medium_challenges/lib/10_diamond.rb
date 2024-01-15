=begin

P
The diamond exercise takes as its input a letter, and outputs it in a diamond shape.
Given a letter, it prints a diamond starting with 'A', with the supplied letter at the widest point.

The first row contains one 'A'.
The last row contains one 'A'.
All rows, except the first and last, have exactly two identical letters.
The diamond is horizontally symmetric.
The diamond is vertically symmetric.
The diamond has a square shape (width equals height).
The letters form a diamond shape.
The top half has the letters in ascending order.
The bottom half has the letters in descending order.
The four corners (containing the spaces) are triangles.

E
we need a class, Diamond
and a class method make_diamond, that takes a letter as an argument
the diamond is vertically symmetric, meaning that the empty spaces match each other
the spaces between the center letter is determined by the range of letters + the reversed version minus A
the longest row, middle, determines how many spaces each row has
the first and the last letters have their positions at the center
all capital letters

D
arrays work, we'll probably need it to ascertain how many spaces we need.
hashes are convenient as well, we can treat the keys as indices and the values as spaces,
then we can just replace the value with the letter on index x based on the row.

A
create diamond class
create make_diamond method
takes one letter as an argument

use the letter to create a range starting from A, convert to array.
use the letter to create another range from B to letter, convert to array and prepend to A to letter arr.
determine the center of that row using the length of the array. divide by two and add 1
the spaces outside the diamond can be determined by dividing the length by two.
the space inside the diamond can be incremented by 2 as the space outside decreases.
the length of each row must equal to each other.
to create the required letters count, initialize center increment by 1 and for each iteration increase by 2

once the array has been created, take out the last letter/element to prevent duplicates
append center row and then append the lower row, which is the array reversed
append the first row A and last row A
return the array by concatenating it with newlines.


3 helper method
we can fill in the letters first and then delete the excess to create the space
if the letter count is more than 2, convert it to an array and replace the letters that are not first and last
with empty spaces.

another helper method to create the center row
use the space outside to determine spaces sanwich it between letters

another helper method to create the first and last rows letter A
use the length of range and create spaces, sandwich the letter as a return value
=end

class Diamond
  def self.make_diamond(letter)
    return "A\n" if letter == 'A'
    range1 = ('B'..letter).to_a
    range2 = ('A'..letter).to_a
    range = range1 + range2
    space_outside = range.size / 2
    result = []
    increment = 1

    range1[0..-1].each do |char|
      increment += 2
      space_outside -= 1
      spaces = ' ' * space_outside
      filler = hollow(char * (increment))
      result << (spaces + filler + spaces)
    end

    result.pop
    lower_part = result.reverse
    result << create_center_row(range, letter)
    final = result + lower_part
    final.unshift(make_A_row(range.size / 2))
    final << make_A_row(range.size / 2)
    final.join("\n") + "\n"
  end

  def self.make_A_row(space_outside)
    spaces = ' ' * space_outside
    spaces + 'A' + spaces
  end

  def self.create_center_row(range, letter)
    spaces = ' ' * (range.size - 2)
    letter + spaces + letter
  end

  def self.hollow(str)
    str.chars.map.with_index do |el, index|
      next el if index == 0
      next el if index == (str.size - 1)
      ' '
    end.join
  end
end