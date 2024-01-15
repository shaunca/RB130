=begin
Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of any two sides must be greater than the length of the third side.

PE
create a triangle class
make sure that all of the tests in triangle tests returns true

triangle class
initializing 3 attributes, which means 3 sides
sides must be checked for a length > 0, and side1 + side2 > side3
we don't take negatives
account for float lengths as well

methods
kind = which determines what kind of triangle is the object

Data
do something with arrays, and iterate through the array to check for validity of the triangle
we will also use arrays to determine what kind of triangle is the object

Algorithm

create triangle class
define initialize which wil take 3 arguments, the length of each side of the triangle
within initialize, check whether the lengths are valid for a triangle or not
we will create a method, check, where the 2 lengths will be compared to the last length.
if the 2 lengths are always greater than the last length, validity check passes and object is instantiated.
otherwise, raise an argument error

define kind method, which will use the 3 length attributes of the object
if 2 lengths are equal, return isosceles
if 3 sides are equal return equilateral
if no sides are equal, return scalene.
=end

class Triangle
  def initialize(side1, side2, side3)
    raise ArgumentError unless check(side1, side2, side3)
    @sides = [side1, side2, side3]
  end

  def check(*sides)
    return false if sides.include?(0) || sides.any? {|num| num.negative?}
    possible_pairs = sides.combination(2).to_a.map do |arr|
      arr.inject(&:+)
    end

    possible_pairs.each do |sum|
      sides.each do |num|
        return false if sum <= num
      end
    end
    true
  end

  def kind
    result = @sides.uniq.size
    case result
    when 2 then "isosceles"
    when 1 then "equilateral"
    when 3 then "scalene"
    end
  end
end
