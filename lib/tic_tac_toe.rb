class TicTacToe
    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    WIN_COMBINATIONS = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]
    ]

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

    def move(index, token)
        @board[index] = token
    end

    def position_taken?(index)
        if @board[index] == " "
            return false
        else
            return true
        end
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0, 8) #(0..8).include?(index)
            # return true
        
    end
    
    def turn_count
        @board.count {|token| token == "X" || token == "O" }
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Choose a position between 1-9: "
        user_input = gets.strip
        index_num = input_to_index(user_input)
        if valid_move?(index_num)
            move(index_num, current_player)
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.each do |win_combo|
            combo_0 = win_combo[0]
            combo_1 = win_combo[1]
            combo_2 = win_combo[2]

            pos_1 = @board[combo_0]
            pos_2 = @board[combo_1]
            pos_3 = @board[combo_2]

            if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
                return win_combo
            elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
                return win_combo
            end
            # if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
            #     return win_combo
            # elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
            #     return win_combo
            # @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]] && position 
            # end
        end
        return false

    end

    def full?
        # WIN_COMBINATIONS.detect do |win_combo|
            # if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
            #     return win_combo
            # elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
            #     return win_combo
            # @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]] && position_taken?(win_combo[0])
            @board.all? {|index| index == "X" || index == "O"}
        # end
    end

    def draw?
        if !won? && full?
            return true
        else
            return false
        end
    end

    def over?
        if won? || draw?
            return true
        else
            return false
        end
    end

    def winner
        index = []
        index = won?
        if index == false
            return nil
        elsif @board[index[0]] == "X"
            return "X"
        else
            return "O"
        end
    end

    def play
        until over? == true
            turn
        end

        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
    
end