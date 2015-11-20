# Helper Method
require 'pry'
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #diagnol1
  [6,4,2], #diagnol2
]

def won?(board)
    winner = []
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3]
    # binding.pry
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      winner = win_combination # return the win_combination indexes that won.
    else
      false
    end
  end
  if winner.empty?
    false
  else
    winner
  end
end

def full?(board)
 if board.map {|p| !(p.nil? || p == " ") }.include?(false) == false
  true
  else
    false
  end
end

def draw?(board)
  full?(board) && !won?(board)
end
def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end