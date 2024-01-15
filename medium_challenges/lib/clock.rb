=begin

Create a clock that is independent of date.

You should be able to add minutes to and subtract minutes from the time represented by a given Clock object.
Note that you should not mutate Clock objects when adding and subtracting minutes -- create a new Clock object.

Two clock objects that represent the same time should be equal to each other.

You may not use any built-in date or time functionality; just use arithmetic operations.

P
we're mostly concerned about the hours and minutes
we are concerned of class methods
and a to_s method as well

E
create Clock class
we have to have a to_s method to display the hours and minutes
an at method that takes 2 arguments, the hours and the minutes
the return of at method can be used to call the + method that adds minutes, and will not
mutate the object
so does subtracting

if we add over an hour, the clock should append 1 hour + remaining minutes i.e. 61 = 1 hr + 1 minute

if we add over an hour to midnight, the clock should be able to change back to 00 + minutes

there is a 24 hour military format

if we add more than a day, the clock should be able to see it and follow suit i.e 48 hours added = 00:00

we need to implement a == method to check similarity

how do we retrieve the information from the calling object, which is the class itself?
the at method will initialize a Clock object which will then have hours and minutes so that the
at method will be a new object instead of the class

D
we'll be dealing with strings and integers strictly
we need to find a way to loop the hours and the minutes so that whatever subtraction or
addition we make, ruby knows how to handle it in the context of time

probably an array too for the hours and minutes

there's 1440 minutes in a day
and 24 hours in a day
60 minutes per hour


A
create Clock class
the at method will initialize a new clock object with hours and minutes

create == method that will check the similarity of Clock.at(arguments) whether they are the same or not
create + method that will increment the hours/time based on minutes
create - method that will decrement the hours/time based on minutes

both +/- methods will take one argument, and that argument will be divided by 60 to convert
for hours and minutes
deduct/ increment those hours/minutes to the current hours and minutes
if the hours exceed 24, reduce the number until it is less than 24 hours

deduction is a little complicated
to prevent negative values with deduction, add 60 minutes or 24 hours to the negative number
to revert it back to the format

initialize a new clock object with the new values

create the constants for hours in a day, minutes in a day, and minutes to hour for conversion

create a to_s method that will output the hours and minutes in "00:00" format
- if the hour/minute is a single digit integer, append 0 to it
- the output format is "00:00"

create at method that will return an 2 element array with hours and minutes


=end

class Clock
  attr_accessor :hours, :minutes

  def initialize(hours, minutes=0)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes=0)
    self.new(hours, minutes)
  end

  def to_s
    result = [@hours, @minutes].map do |number|
      if number.to_s.length == 1
        "0" + number.to_s
      else
        number.to_s
      end
    end
    result.join(":")
  end

  def ==(other)
    [hours, minutes] == [other.hours, other.minutes]
  end

  def +(min)
    added_hours, added_minutes = min.divmod(60)
    added_hours = reduce(added_hours) if added_hours >= 24
    self.hours += added_hours
    self.hours = reduce(self.hours) if self.hours >= 24
    self.minutes += added_minutes
    Clock.new(self.hours, self.minutes)
  end

  def -(min)
    subtracted_hours, subtracted_minutes = min.divmod(60)
    subtracted_hours = reduce(subtracted_hours) if subtracted_hours >= 24
    self.hours -= subtracted_hours
    self.hours = positive_hour(self.hours) if self.hours < 0
    self.minutes -= subtracted_minutes
    if self.minutes < 0
      self.minutes = positive_minutes(self.minutes)
      self.hours -= 1
      self.hours = positive_hour(self.hours) if self.hours < 0
    end
    Clock.new(self.hours, self.minutes)
  end

  def reduce(num)
    loop do
      num -= 24
      break num if num < 24
    end
  end

  def positive_hour(num)
    loop do
      num += 24
      break num if num > 0
    end
  end

  def positive_minutes(minutes)
    minutes + 60
  end
end