=begin
PE
create a program that will compute the hamming distance
which is essentially counting the number of differences of two different strands

a class called DNA, instantiation takes 1 argument, which is a strand with capital letters
method called hamming_distance, which takes one argument, another strand, and it compares the argued
strand to the DNA object/strand, and calculates the number of differences/hamming distance

rules say that if one strand is shorter than the other strand, compute hamming distance over the shorter length
shorter length will be measured, and ignores the rest of the longer string

strigns are capital letters, will not take any other arguments apart from an empty string.

Data
strings, DNA and the argued string for the hamming_distance method
arrays, convert these strings into arrays, and iterate through them for similarities.

Algorithm
create DNA class
def initialize method to take one argument, which is the DNA string

def hamming_distance method and take 1 string argument
use the DNA object string to compare with the string argument
convert the strings into arrays
and iterate through the shortest array, and use their indices to call the other array's element
compare each element with the same indices, and add a point or increment counter by 1 if the elements are not the same
return the counter at the end of the method.

=end

class DNA
  attr_reader :string

  def initialize(str)
    @string = str
  end

  def hamming_distance(str)
    shorter = string.length < str.length ? string : str
    differences = 0

    shorter.length.times do |index|
      differences += 1 if string[index] != str[index]
    end

    return differences

    # first_arr = @string.chars
    # second_arr = str.chars
    # counter = 0

    # if first_arr.size == second_arr.size
    #   first_arr.each_with_index do |element, index|
    #     counter += 1 if element != second_arr[index]
    #   end
    #   return counter
    # else
    #   iterated_arr = first_arr.size < second_arr.size ? first_arr : second_arr
    #   compared_arr = first_arr.size > second_arr.size ? first_arr : second_arr

    #   iterated_arr.each_with_index do |element, index|
    #     counter += 1 if element != compared_arr[index]
    #   end
    # end
    # counter
  end
end

