require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car'

class CarTest < Minitest::Test
  def test_wheels
    car = Car.new
    assert_equal(car.wheels, 4)
  end
end