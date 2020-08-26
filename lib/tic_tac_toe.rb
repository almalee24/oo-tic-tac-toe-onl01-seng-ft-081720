class TicTacToe 
  def initialize
    @board = Array.new(9, " ")
  end 
  
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  
  def display_board 
    puts "#{board[0]} | #{board[1]} | #{board[2]}"
    puts "#{board[3]} | #{board[4]} | #{board[5]}"
    puts "#{board[6]} | #{board[7]} | #{board[8]}"
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, current_player = 'X')
    @board[index] = current_player
  end
  
  def position_taken?(index)
    @board[index].nil? || @board[index] == " " ? false : true
  end
  
  def valid_move?(index)
    !position_taken?(index)
  end
  
  def turn  
    puts "Choose a position between 1-9."
    input = gets.chomp 
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else 
      turn
    end 
  end
  
  def turn_count 
    turn = 0 
    @board.each do |index|
      if index == "X" || index == "O"
        turn += 1
      end 
    end 
    turn
  end
  
  def current_player
    
end