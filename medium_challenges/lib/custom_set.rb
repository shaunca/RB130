=begin
P
create a custom set
data can be just numbers

E
Create a CustomSet class
- takes an array as an argument

an empty method that checks if the object is empty
- check array if it is empty

a contains? method which is like array#include
- returns a boolean if argument is not in the set

we have subsets?
a CustomSet object has a subset attribute?
subset? method that checks if the customset has a subset
understanding the subset? method
- if called by a customset with no arr and
  passed a new customset obj with 1 elem arr, return true
- if called by a customset with 1 elem arr and
  passed a new customset obj with empty arr, return false
- if the customsets have the same arr size, returns true
- if the caller arr has lesser elements than the arg, return true
- if the caller has different elements than the arg
  even tho arr size is the same, return false
- subset? method checks if the caller arr contains lesser or equal
  elements than the arg
  - it also checks whether the arg arr contains all the elements
    from the caller arr and returns true
  - so two checks before it can return the correct boolean

understanding disjoint?
- if the same arr return true
- if arg arr is more than the caller arr, return true
- if arg arr has less than the caller arr, return true
- if arg arr and caller arr has 1 or more similar element, return false
- if arg arr and caller arr has no similar elements, return true

eql_empty
- eql same val and class
- the values need not to be in order, they just have be there
- duplicates do not matter
- return a boolean

add method
- adds an element to a list
- the equality comparison for assert_equal is ==
  - so we need a method that will compare arrays
- added element will be last on the list so like a push

intersection
- only takes the shared elements and returns that array
- (i.e. [1, 2, 3] and [3, 2] will only return [2, 3])
- order will be based on the calling object's array
- if no shared elements or empty, return an empty array

difference
- takes the elements that are exclusive to the calling and arg arrays
- order is still based on the calling object's array

union
- adds the arg and caller obj arr
- but the arr contains only unique elements and no duplicates
- the arr is sorted

A
create CustomSet Class
create attr accessor for array

create constructor for customset obj with array as attribute, takes one argument

empty method
- checks if array is empty

contains method
- checks if argument is in the array of the object

subset method
- checks if size of calling and arg arrays are the same
- checks if all the elements in calling arr are in the arg array
- return true if both checks are true

disjoint method
- checks if all elements in arg and calling array are unique

eql method
- checks if the arr is the same for both calling and arg obj
- return false if calling array is [] and the other array has elements

add method
- return self if the element to be pushed already exists in the arr
- reassign array to object with the element pushed on it
- return self

== method
- checks if both obj array are the same

intersection method
- create a new object
- iterates through the calling obj array and create a new array where
elements that exist between the calling and arg array are pushed
- reassign this array to the new object
- return new object

difference method
- create a new object
- iterates through the calling obj array and create a new array where
elements that are unique between the calling and arg array are pushed
- reassign this array to the new object
- return new object

union method
- create a new object
- merge calling obj and arg obj arrays together, take out the duplicates
- reassign the arr to the new object and return new obj
=end
class CustomSet
  attr_accessor :array

  def initialize(arr=[])
    @array = arr.uniq
  end

  def empty?
    array.empty?
  end

  def contains?(arg)
    array.include?(arg)
  end

  def subset?(other)
    size_check = array.size <= other.array.size
    content_check = array.all? { |data| other.array.include?(data) }
    size_check && content_check
  end

  def disjoint?(other)
    array.all? { |data| other.array.include?(data) == false }
  end

  def eql?(other)
    return false if array == [] && other.array.size >= 1
    array.all? { |data| other.array.include?(data) }
  end

  def add(element)
    return self if contains?(element)
    self.array = array << element
    self
  end

  def ==(other)
    array == other.array
  end

  def intersection(other)
    new_obj = CustomSet.new
    new_obj.array = array.each_with_object([]) do |element, new_array|
      next if new_array.include?(element)
      new_array << element if other.contains?(element)
    end
    new_obj
  end

  def difference(other)
    new_obj = CustomSet.new
    new_obj.array = array.each_with_object([]) do |element, new_array|
      next if new_array.include?(element)
      new_array << element if other.contains?(element) == false
    end
    new_obj
  end

  def union(other)
    new_obj = CustomSet.new
    new_obj.array = (array + other.array).uniq.sort
    new_obj
  end
end
