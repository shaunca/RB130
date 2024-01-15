=begin
Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name. The first time you boot them up,
a random name is generated, such as RX837 or BC811.

Every once in a while, we need to reset a robot to its factory settings,
which means that their name gets wiped. The next time you ask,
it will respond with a new random name.

The names must be random; they should not follow a predictable sequence.
Random names means there is a risk of collisions.
Your solution should not allow the use of the same name twice.

E
Robot class
name instance method that will give the name
name has 2 capital letters and 3 numbers
a reset method that will wipe out the object's name and replacese it with a new one
solution should not allow the use of the same name twice meaning that once the name

D
a class variable that has an array, we will use this variable to check whether the name has been used or not
arrays, for letters and numbers, we can just sample the information to generate a name

A
create class robot
instantiate class var

create a name method
will generate a random name using a range letter and range numbers
we will sample 2 times from letter and 3 times from numbers and concatenate it to a string
check wether the string is included in the class var, if it is, redo the method
the return value of this method will be the name of the robot

the reset method will call the initialize method to redo the name generation.
=end

class Robot
  @@existing_names = []
  LETTERS = ('A'..'Z').to_a
  NUMBERS = ('0'..'9').to_a

  attr_reader :name

  def initialize
    @name = generate_name
  end

  def reset
    initialize
  end

  private

  def generate_name
    unique_name = ""
    2.times { unique_name << LETTERS.sample }
    3.times { unique_name << NUMBERS.sample }
    if @@existing_names.include?(unique_name)
      generate_name
    else
      @@existing_names << unique_name
      unique_name
    end
  end
end
