=begin
Write a program that, given a natural number and a set of one or more other numbers,
can find the sum of all the multiples of the numbers in the set that are less than the first number.
If the set of numbers is not given, use a default set of 3 and 5.

For instance, if we list all the natural numbers up to, but not including,
20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18.
The sum of these multiples is 78.

P
input: natural number, and a set of one or more numbers
intermediate: look for numbers that are multiples of the numbers in the set
if no numbers are given, 3 and 5 is the defualt number
output: sum of multiples

E
SumOfMultiples class, attribute contains the set of integers which we need to look multiples for
to method which has the cap as the argument
account for big numbers
need to create a class method as well

D
the set of numbers can be stored in arrays, we will need a range to sift the multiples from

Algorithm
create SumOfMultiples class
initialize the set, if no set is given, default to 3 and 5

create to instance method, where arg is the cap
create range from 1 to cap
iterate through that range and select numbers that have module 0 using the set of numbers
return the sum of the selected array

create class method of the same name
instantiate a new object in the method and call the instance method.
=end

class SumOfMultiples
  attr_reader :array

  def initialize(*args)
    args = [3, 5] if args.empty?
    @array = args
  end

  def to(cap)
    result = (1...cap).to_a.select do |dividend|
      array.any? {|divisor| dividend % divisor == 0}
    end

    result.sum
  end

  def self.to(cap)
    SumOfMultiples.new.to(cap)
  end
end