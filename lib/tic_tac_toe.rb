class TicTacToe 
  def initialize
    @board = Array.new(9, " ")
  end 
  
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  
  def display_board 
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
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
    index.between?(0, 8) && !position_taken?(index)
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
    num_turns = turn_count
    if num_turns % 2 == 0 
      player = "X"
    else 
      player = "O"
    end
    return player 
  end
  
  def won?
    WIN_COMBINATIONS.each{|winner_combo|
      position_1 = @board[winner_combo[0]] 
      position_2 = @board[winner_combo[1]] 
      position_3 = @board[winner_combo[2]] 
      
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return winner_combo
      elsif position_1 == "0" && position_2 == "0" && position_3 == "0"
        return winner_combo
      end
    }
    return false
  end
  
  def full?
    @board.all?{|index| index == "X" || index == "O"}
  end 
  
  def draw? 
    !won? && full? ? true : false 
  end
  
  def over? 
    won? || full? ? true : false
  end
  
  def winner 
    index = []
    index = won?
    if index == false 
      return nil
    else 
      if @board[index[0]] == "X"
        return "X"
      else 
        return "O"
      end 
    end
  end
  
  def play 
    until over? turn 
end