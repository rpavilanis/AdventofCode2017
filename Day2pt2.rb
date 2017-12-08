# "Based on what we're seeing, it looks like all the User wanted is some information about the evenly divisible values in the spreadsheet.
# Unfortunately, none of us are equipped for that kind of calculation - most of us specialize in bitwise operations."
#
# It sounds like the goal is to find the only two numbers in each row where one evenly divides the other - that is, where the result of
# the division operation is a whole number. They would like you to find those numbers on each line, divide them, and add up each line's result.
#
# For example, given the following spreadsheet:
#
# 5 9 2 8
# 9 4 7 3
# 3 8 6 5
# In the first row, the only two numbers that evenly divide are 8 and 2; the result of this division is 4.
# In the second row, the two numbers are 9 and 3; the result is 3.
# In the third row, the result is 2.
# In this example, the sum of the results would be 4 + 3 + 2 = 9.
#
# What is the sum of each row's result in your puzzle input?

class Puzzle
  def xcall(puzzle_input)
    rows = puzzle_input.split("\n").map{ |line| line.split.map(&:to_i)}

    checksum = 0
    rows.each do |row|
      row.each do |num|
        row.each do |other|
          if num != other && num % other == 0
            checksum += num/other
            break
          end
        end
      end
    end
    checksum
  end
  
  def call(puzzle_input)
    rows = puzzle_input.split("\n").map{ |line| line.split.map(&:to_i)}

    checksum = 0
    rows.each do |row|
      row.sort.combination(2).each do |(lo, hi)|
        if hi % lo == 0
          checksum += hi / lo
          break
        end
      end
    end
    checksum
  end
end

require 'minitest/autorun'

class PuzzleTest < Minitest::Test
  def test_case_1
    input = <<~HERE
      5 9 2 8 
      9 4 7 3 
      3 8 6 5
    HERE

    assert_equal 9, Puzzle.new.call(input)
  end
end

puzzle_input = File.read("input.txt")

puts Puzzle.new.call(puzzle_input)


