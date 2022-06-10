require 'pry'

class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  attr_accessor :board

  def initialize
    @board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index input
    input.to_i - 1
  end

  def move input, token='X'
    @board[input] = token
  end

  def position_taken? cell_choice
    @board[cell_choice] != ' '
  end

  def valid_move? cell_choice
    !position_taken?(cell_choice) && cell_choice.between?(0,8)
  end

  def turn_count
    @board.select {|item| item != ' '}.length
  end

  def current_player
    if self.turn_count % 2 == 0
      'X'
    else
      'O'  
    end
  end

  def turn 
    self.display_board
    puts 'Make your choice! Type a number from 1 to 9.'
    choice = gets.chomp
    cell_choice = input_to_index(choice)
    valid_move?(cell_choice) ? move(cell_choice, current_player) : self.turn
  end

end

# binding.pry