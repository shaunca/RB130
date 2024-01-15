=begin
Meetups are a great way to meet people who share a common interest.
Typically, meetups happen monthly on the same day of the week.
For example, a meetup's meeting may be set as:

The first Monday of January 2021
The third Tuesday of December 2020
The teenth Wednesday of December 2020
The last Thursday of January 2021

In this program, we'll construct objects that represent a meetup date.
Each object takes a month number (1-12) and a year (e.g., 2021).
Your object should be able to determine the exact date of the meeting in the specified month and year.
For instance, if you ask for the 2nd Wednesday of May 2021,
the object should be able to determine that the meetup for that month will occur on the 12th of May, 2021.

The descriptors that may be given are strings:
'first', 'second', 'third', 'fourth', 'fifth', 'last', and 'teenth'.
The case of the strings is not important; that is, 'first' and 'fIrSt' are equivalent.
Note that "teenth" is a made up word.
There was a meetup whose members realised that there are exactly 7 days that end
in '-teenth'. Therefore, it's guaranteed that each day of the week (Monday, Tuesday, ...)
will have exactly one date that is the "teenth" of that day in every month.
That is, every month has exactly one "teenth" Monday, one "teenth" Tuesday, etc.
The fifth day of the month may not happen every month, but some meetup groups like that irregularity.

The days of the week are given by the strings 'Monday', 'Tuesday', 'Wednesday', 'Thursday',
'Friday', 'Saturday', and 'Sunday'. Again, the case of the strings is not important.

P
our objects should take a month number and a year
object should be able to determine the exact meeting in the specified month and year
decriptors are strings
'first', 'second', 'third', 'fourth', 'fifth', 'last', and 'teenth'
the case should be insensitive
"teenth" is a made up word, and all the days of a month has exactly a day in the week that is a teenth
fifth day of the month may not happen every month
days of the week are from Monday to Sunday, case insensitive

E
We need a Meetup class which takes 2 arguments, date and month
Date class is used to test for equality.

We need to create a day method as well, which specifies what day of the month(mon to sun), and another
argument that asks for which day(first monday, second monday, etc.)
the return value of the day method should incorporate the year, month, and day format equivalent to
Date.civil's return value.

we need to get a hold of how calendars work T_T, I wonder if we can just utilize the date class and its
methods

on top of my head
-we have leap years to consider for february
-some months have 31 days and some have 30
- 30 days (April, June, September, November)
- 31 days January, March, May, July, August, October, and December
- 28/29, February

looking at the calendar
- 1-7 will always be the first of the days, seven being the last day of that week to be a first day of the month
- 8-14 being the second
- 15-21 is the third
- 22-28 is the fourth, some days will have this as the last day for their month
- 29-31 is the fifth / last
- 13th to 19th is the teenth days..., which means it can be the second or third day of that day in the month...

if the day does not exist, return nil
the last day of that particular day in a month changes, we need to be able to find a logic that can
somehow track and reassign the last day where needed. The same goes with teenth as well.

I think what's going on is that we are adding a functionality of the date class, where we can filter out
what day and which one in a month people are meeting up.

I think that we have to return a Date object to pass the assertions, that's the return value of the
day method, the idea is to determine the day that we need based on what day(mon to sun) and which particular
day it is in the month(first to last, and teenth)

D
we will be working with Date objects
Hashes or Arrays will work to store data about what ruby should find when the strings (first to last, teenth)
strings, argument values are strings
instantiation of the meetup class will take an integer as an argument.

E
require date

create meetup class
define a constructor method that will take the year and month in integers as an argument

create a constant that will be assigned with a hash
- keys are the strings first to fifth, and values is an array with integers containing the possible dates
  of each category.
- teenth will have its own category as well from 13 to 19.
- the last will be determined later, these will be treated as special cases
- February will also be treated as a special case as well.

create a helper method that will check if the date matches the day, this will be used throughout
the entire class and its methods.
- usee the functionality of date class to determine the days.

define instance method day, which takes a string day, and which day is it in the month
- case insensitive, so all the arguments must be downcased.
- invoke helper method if the argument is 'last'
- invoke helper method if the argument is 'last' or 'fifth' AND month is february.
- using the day of the month(first to last, teenth), we will iterate through the constant with the hash
  use Date method to pull out what day of the month (based on year) the dates are,
  if there is a match to the argued day,
  (i.e if first monday, iterate through the first array and run through numbers 1-7 with Date, and say 3 is
  a Monday), then return Date object with that date together with the year and month.
- through the iteration, skip the date if the date does not exist in the month
- if there're no matches, return nil

these functions may need a helper method...
- in the event of 'last' as an argued string to the method, iterate through the fifth value first and check
  for matches, return if there is a match, otherwise, check if there's a match on the fourth value
- in the event of 'teenth', use the teenth value and return the match.
- in the event of February, check if argument is looking for fifth or last.
  -check for leap years
    - if it is a leap year
      - check the fifth value for the 29th. otherwise, return false.
      - if the argument is 'last', check the fourth value, return nil if not.
    - if not a leap year
      - if argument is 'last', check fourth value, return nil if 'fifth'
=end

require 'date'

class Meetup
  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(day, which_week)
    day, which_week = day.downcase, which_week.downcase
    return february_last_day(day, which_week) if month == 2 && ['fifth', 'last'].include?(which_week)
    return find_last_day(day, which_week) if which_week == 'last'

    WEEK[which_week].each do |date|
      next if THIRTY_DAY_MOS.include?(month) && date == 31
      return Date.civil(year, month, date) if determine_what_day(day, date)
    end
    nil
  end

  private

  THIRTY_DAY_MOS = [4, 6, 9, 11]
  WEEK = {
    'first' => [1, 2, 3, 4, 5, 6, 7],
    'second' => [8, 9, 10, 11, 12, 13, 14],
    'third' => [15, 16, 17, 18, 19, 20, 21],
    'fourth' => [22, 23, 24, 25, 26, 27, 28],
    'fifth' => [29, 30, 31],
    'teenth' => [13, 14, 15, 16, 17, 18, 19]
  }

  attr_reader :year, :month

  def determine_what_day(day, date)
    Date::DAYNAMES[Date.new(year, month, date).wday].downcase == day
  end

  def find_last_day(day, which_week)
    return day(day, 'fifth') unless day(day, 'fifth').nil?
    day(day, 'fourth')
  end

  def february_last_day(day, which_week)
    if Date.new(year).leap?
      determine_what_day(day, 29) ? (return Date.civil(year, month, 29)) : false
      which_week == 'last' ? day(day, 'fourth') : nil
    else
      which_week == 'last' ? day(day, 'fourth') : nil
    end
  end
end
