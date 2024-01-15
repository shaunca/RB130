=begin

P write a program that will determine whether a number is perfect, deficient, or abundant
based on their aliquot sum

E
cannot take a negative number or 0
integers only
we need a perfect number class
and a classify class method that determines the number's grouping

Data
arrays, create an array from 1 to the given number and divide each number with the original number
to see whether the number is a divisor or not
then sum the divisors and compare to the dividend and determine if the number is perfect, deficient, or abundant

Algorithm
def class perfect number
def classify method take one argument which is the number to be classified
create an array from 1 to the given number and divide each number with the original number
to see whether the number is a divisor or not
then sum the divisors and compare to the dividend and determine if the number is perfect, deficient, or abundant

=end

class PerfectNumber
  def self.classify(dividend)
    raise StandardError if dividend <= 0
    divisors = (1...dividend).to_a.select {|divisor| dividend % divisor == 0}
    sum = divisors.inject(&:+)
    return "abundant" if sum > dividend
    return "deficient" if sum < dividend
    "perfect"
  end
end

