# The spreadsheet consists of rows of apparently-random numbers. To make sure the recovery
# process is on the right track, they need you to calculate the spreadsheet's checksum.
# For each row, determine the difference between the largest value and the smallest value;
# the checksum is the sum of all of these differences.
#
# For example, given the following spreadsheet:
#
# 5 1 9 5
# 7 5 3
# 2 4 6 8
# The first row's largest and smallest values are 9 and 1, and their difference is 8.
# The second row's largest and smallest values are 7 and 3, and their difference is 4.
# The third row's difference is 6.
# In this example, the spreadsheet's checksum would be 8 + 4 + 6 = 18.
#
# What is the checksum for the spreadsheet in your puzzle input?

class Puzzle
  def call(puzzle_input)
    rows = puzzle_input.split("\n").map{ |line| line.split.map(&:to_i)}

    checksum = 0
    rows.each do |row|
      checksum += row.max - row.min
    end
    checksum
  end
end

require 'minitest/autorun'

class PuzzleTest < Minitest::Test
  def test_case_1
    input = <<-HERE
      5 1 9 5
      7 5 3 
      2 4 6 8
    HERE

    assert_equal 18, Puzzle.new.call(input)
  end
end

puzzle_input = File.read("input.txt")

puts Puzzle.new.call(puzzle_input)
