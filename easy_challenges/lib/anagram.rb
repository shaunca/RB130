=begin

P
write a program that takes a word
and a list of possible anagrams and selects the correct sublist
that contains the anagrams of the word

what is an anagram
an anagram is a rearrangement of a word without adding any word
every letter of the word must always be used once in the rearrangement
the exact word is not an anagram

E
Anagram class that takes one argument, a string or the original word
the strings must be case insensitive
return value of the tests will always be an array be it empty

create a match method that will return an array with the anagrams
scans the argued array and looks for anagrams, puts in array and returns it
the return value must retain the original element, not modified

D
arrays, for the arguments
iterate through the array, and compare each word to the org word and see if they are the same.
hashes, where keys are letters and value is the count or number of times the letter occurs in the word
compare org hash with the element hash and check for similarity
if the same, it's an anagram, if not, ignore

A
def anagram class
def initialize which will take an argument string as our original word
initialize instance var to assign the arg string
create an attr reader for the instance var

def match, we are going to take an array as an argument
rearrange org string to alpha order
have a var assigned to an empty array for our return value

iterate through the arg array
for every element, rearrange the word in alpha order
check for similarity with the org string
if equal, push the element to the empty array
ignore if not
return the var with the array

to account for cases, convert string to downcase.
to account for words that is exactly the original word in the array, check whether it is the same word before
rearranging it. if it is, iterate to the next word.
=end

class Anagram
  attr_reader :word

  def initialize(str)
    @word = str
  end

  def match(arr)
    original_word = word.downcase.chars.sort.join

    arr.select do |element|
      possible_anagram = element.downcase.chars.sort.join
      next false if element.downcase == word.downcase
      possible_anagram == original_word
    end
  end
end