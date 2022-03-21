# frozen_string_literal: true

require 'pry-byebug'
# require_relative 'knight'

# Board for knight to move.
class Board
  attr_accessor :cell, :moves, :col, :row, :parent

  def initialize(position, moves, parent = nil)
    @cell = position
    @moves = moves
    @col = position[0]
    @row = position[1]
    @parent = parent
  end
end
