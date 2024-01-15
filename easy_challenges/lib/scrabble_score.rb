=begin
P
create a program that calculates the scrabble score of a given word

score is given, now converted to a hash for our use

E
account for empty strings and strings with newline and tab characters == 0
must be case insensitive and repeating letters count

We will need an instance method and a class method

D
hashes to match the string char with thei respective scores
an array to iterate over each character

A
def Scrabble class and take a string as an argument
initialize that string as an instance var and create attr reader or getter method

def score method that will calculate the score of the string
convert string to arr
iterate through that arr and for each character, get respective score
append the score to total
return total

how to sift whitespaces, check whether string has whitespaces and strip it,
return 0 if value is nil or empty string

use the score instance method to creaate the score class method
within that method, instantiate a new Scrabble object and call score method on it
return value of that method will be the return value of the class method as well.
=end

class Scrabble
  SCORE = {
    "A"=>1, "E"=>1, "I"=>1, "O"=>1, "U"=>1, "L"=>1, "N"=>1, "R"=>1, "S"=>1, "T"=>1,
    "D"=>2, "G"=>2,
    "B"=>3, "C"=>3, "M"=>3, "P"=>3,
    "F"=>4, "H"=>4, "V"=>4, "W"=>4, "Y"=>4,
    "K"=>5,
    "J"=>8, "X"=>8,
    "Q"=>10, "Z"=>10
  }
     #""=> 0, " "=>0, "\t"=>0, "\n"=>0}

  attr_reader :word

  def initialize(word)
    @word = word
  end

  def score
    return 0 if word == nil || word.lstrip == ""
    total = 0
    str_arr = word.chars

    str_arr.each do |char|
      total += SCORE[char.upcase]
    end
    total
  end

  def self.score(str)
    Scrabble.new(str).score
  end
end