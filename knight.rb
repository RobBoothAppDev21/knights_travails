# frozen_string_literal: true

require 'pry-byebug'
require_relative 'board'

# knight piece
class Knight
  attr_accessor :col, :row, :moves, :knight, :queue

  def initialize(start)
    @col = start[0]
    @row = start[1]
    @moves = 0
    @knight = Board.new(start, moves)
    @queue = [knight]
  end

  def possible_moves(col, row, moves, parent)
    one = Board.new([col + 1, row + 2], moves, parent) unless col + 1 > 7 || row + 2 > 7
    two = Board.new([col + 1, row - 2], moves, parent) unless col + 1 > 7 || row - 2 < 0
    three = Board.new([col + 2, row + 1], moves, parent) unless col + 2 > 7 || row + 1 > 7
    four = Board.new([col + 2, row - 1], moves, parent) unless col + 2 > 7 || row - 1 < 0
    five = Board.new([col - 1, row + 2], moves, parent) unless col - 1 < 0 || row + 2 > 7
    six = Board.new([col - 1, row - 2], moves, parent) unless col - 1 < 0 || row - 2 < 0
    seven = Board.new([col - 2, row + 1], moves, parent) unless col - 2 < 0 || row + 1 > 7
    eight = Board.new([col - 2, row - 1], moves, parent) unless col - 2 < 0 || row - 1 < 0
    [one, two, three, four, five, six, seven, eight].each do |move|
      @queue << move unless move.nil?
    end
  end

  def print_parent(node, arr = [])
    return arr.reverse.each { |node| p node } if node.nil?

    arr << node.cell
    print_parent(node.parent, arr)
  end

  def knight_travails(destination)
    until @queue.empty?
      curr = @queue.shift
      if curr.cell == destination
        p "You made it in #{curr.moves} moves! Here's your path:"
        print_parent(curr)
        return
      else
        possible_moves(curr.col, curr.row, curr.moves + 1, curr)
      end
      binding.pry
    end
  end
end

knight = Knight.new([0, 0])
knight.knight_travails([7, 7])
