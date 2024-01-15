=begin
Write a simple linked list implementation.
The linked list is a fundamental data structure in computer science,
often used in the implementation of other data structures.

The simplest kind of linked list is a singly linked list.
Each element in the list contains data and a "next" field pointing to the
next element in the list of elements. This variant of linked lists is often used to
represent sequences or push-down stacks (also called a LIFO stack; Last In, First Out).

Let's create a singly linked list whose elements may contain a range of data such as the numbers 1-10.
Provide methods to reverse the linked list and convert a linked list to and from an array.

P
so essentially creating a stack
concept is that LIFO, last in first out
each element has data and a next field pointing to the next element in the list
data may contain a range such as numbers 1 to 10
provide methods to reverse the linked list and convert a linked list to and from an array

E
We need an element class that takes 2 arguments
and a datum instance method which returns the value of the object
tail instance method that checks if the next value is there or not (that's the second argument)
next method that returns the next element, this method needs to know what the next element is
- the second argument will be the next value

We need a SimpleLinkedList class

empty method that checks if the list is empty

the first element is the HEAD

a push method to push elements into the list
- pushes an Element class object, where argument is datum and next value

a size method that returns the size of the list
- checks if the head has a value
- return 0 if there is no value
- iterate through the list and check the next values until next is nil
- increment 1 to the counter for every next
- return the count

a peek method that returns the datum of the head element
- returns the datum of the head element, return nil otherwise

a head method that returns the first or head element on the list

a pop method that will take out the last added element from the list, last in first out

a from_a method that takes an object as an argument
- instantiates a new SimpleLinkedList object
- if the object, array, has contents in it, convert those into Element objects.
  -iterate through them to convert them into element objects and push to the new array list.
- if nothing is passed in there, return an empty array

a to_a method that creates an empty array?
a reverse method that reverses the order of the pushed elements

so to_a converts a linked list to an array
from_a converts a linked list from an array

SimpleLinkedList will contain only Element objects,
Element is a collaborator of SimpleLinkedList

1 is an Element? could be an element object, but can be a number as well.

D
we have to deal with arrays, and integers
we are dealing with 2 classes, element and simplelinkedlist

A
=end

class Element
  attr_reader :datum, :next

  def initialize(datum, next_value=nil)
    @datum = datum
    @next = next_value
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_accessor :head

  def size
    size = 0
    current_element = head
    while current_element
      size += 1
      current_element = current_element.next
    end
    size
  end

  def empty?
    @head.nil?
  end

  def push(arg)
    new_element = Element.new(arg, head)
    @head = new_element
  end

  def peek
    @head.nil? ? nil : @head.datum
  end

  def pop
    popped = peek
    new_head = @head.next
    @head = new_head
    popped
  end

  def self.from_a(arr)
    arr = [] if arr.nil?

    new_list = SimpleLinkedList.new
    arr.reverse_each {|datum| new_list.push(datum)}
    new_list
  end

  def to_a
    new_array = []
    current_element = head
    until current_element.nil?
      new_array << current_element.datum
      current_element = current_element.next
    end
    new_array
  end

  def reverse
    new_list = SimpleLinkedList.new
    current_element = head
    until current_element.nil?
      new_list.push(current_element.datum)
      current_element = current_element.next
    end
    new_list
  end
end