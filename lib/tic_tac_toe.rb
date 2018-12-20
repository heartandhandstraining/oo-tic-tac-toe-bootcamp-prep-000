class TicTacToe

    def initialize(board = Array.new(9, " "))
        @board = board
    end
    
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
    
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def input_to_index(input)
        input.to_i-1 #convert user input to integer and subtract 1 to represent index
    end 
    
    def move(index, token)
        @board[index] = token 
    end
    
    def position_taken?(index)
        @board[index] == "X" || @board[index] == "O"
    end
    
    def valid_move?(index)
        !position_taken?(index) && index.between?(0, 8)
    end
    
    def turn_count
        @board.count {|x| x == "X" || x == "O" }
    end
    
    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end
    
    def turn
        puts "Please enter the space number for your move."
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end
    end
    def won?
        WIN_COMBINATIONS.detect {|combo|
        @board[combo[0]] ==  @board[combo[1]] && @board[combo[2]] == @board[combo[0]] &&
        @board[combo[0]] == "O" || @board[combo[0] == "X"]
        }
    end
end
