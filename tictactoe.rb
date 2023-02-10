class TicTacToe
  def initialize
    @@counter = 0
    @exes_and_os = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @move_counter = 0
    @active_game = true
    @move = false
    @total_moves = []
  end

  def game
    over = false
    self.begin?
    while over == false
      self.display_rules
      while @active_game
        self.display_board
        self.get_move
      end
      self.display_board
      which_player_wins?
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      validate_boolean(answer)
      over = true if answer == "n"
      initialize
    end
  end

  def display_board
    puts "     |     |     "
    puts "  #{@exes_and_os[0]}  |  #{@exes_and_os[1]}  |  #{@exes_and_os[2]}  "
    puts "_____|_____|_____"
    puts "     |     |     "
    puts "  #{@exes_and_os[3]}  |  #{@exes_and_os[4]}  |  #{@exes_and_os[5]}  "
    puts "_____|_____|_____"
    puts "     |     |     "
    puts "  #{@exes_and_os[6]}  |  #{@exes_and_os[7]}  |  #{@exes_and_os[8]}  "
    puts "     |     |     "
  end

  def get_move
    @move_counter += 1
    puts "For \"x\":" if @move_counter.odd?
    puts "For \"o\":" if @move_counter.even?
    puts "In which space would you like to make your move?(1-9)"
    num = gets.chomp.to_i
    p num
    validate_num(num)
    @total_moves << num
    @move = true
    index = @exes_and_os.index(num)
    @exes_and_os[index] = "x" if @move_counter.odd? 
    @exes_and_os[index] = "o" if @move_counter.even?
    game_over?    
  end

  def validate_num(num)
    invalid = true
    while invalid
      invalid = @total_moves.any? { |el| el == num }
      return if invalid == false
      p invalid
      puts "That is not a valid move."
      puts "Please enter a valid move. (1-9)"
      num = gets.chomp.to_i 
    end
  end

  def which_player_wins?
    puts "Player One wins!" if @move_counter.odd?
    puts "Player Two wins!" if @move_counter.even?
  end
    

  def game_over?
    # return @active_game = false if @exes_and_os at indexes 0, 3, and 6 are equal
    if @exes_and_os[0] == @exes_and_os[3] && @exes_and_os[3] == @exes_and_os[6]
      @active_game = false
    elsif @exes_and_os[1] == @exes_and_os[4] && @exes_and_os[4] == @exes_and_os[7]
      @active_game = false
    elsif @exes_and_os[2] == @exes_and_os[5] && @exes_and_os[5] == @exes_and_os[8]
      @active_game = false
    elsif @exes_and_os[0] == @exes_and_os[1] && @exes_and_os[1] == @exes_and_os[2]
      @active_game = false
    elsif @exes_and_os[3] == @exes_and_os[4] && @exes_and_os[4] == @exes_and_os[5]
      @active_game = false
    elsif @exes_and_os[6] == @exes_and_os[7] && @exes_and_os[7] == @exes_and_os[8]
      @active_game = false
    elsif @exes_and_os[0] == @exes_and_os[4] && @exes_and_os[4] == @exes_and_os[8]
      @active_game = false
    elsif @exes_and_os[2] == @exes_and_os[4] && @exes_and_os[4] == @exes_and_os[6]
      @active_game = false
    end
  end
    
  protected
  def begin?
    start_game = false
    answer = nil
    unless start_game
      puts "Do you want to play Tic-Tac-Toe? (y/n)"
      answer = gets.chomp.downcase
      validate_boolean(answer)
      if answer == "n"
        puts "Until next time!" 
        exit
      end
      puts "OK! Let's begin."
      start_game = true
    end
  end

  def display_rules
    understand = nil
    puts "Do you need to see the rules? (y/n)"
    answer = gets.chomp.downcase
    validate_boolean(answer)
    return if answer == "n"
    unless understand == "y"
      puts "Here are the rules:"
      sleep(1)
      puts "This is Tic-Tac-Toe, designed to be played by two humans."
      sleep(1)
      puts "Player One will go first, and will input \"x\""
      sleep(1)
      puts "Player Two will go second, and will input \"o\""
      sleep(1)
      puts "Play continues back-and-forth until one player has three of their marks in a row,"
      puts "or until no more moves can be made."
      sleep(1)
      puts "Do you understand?(y/n)"
      understand = gets.chomp.downcase
      validate_boolean(understand)
      return if understand == "y"
      puts "OK, here are the rules again."
    end
  end

  def validate_boolean(answer)
    while answer
      if answer == "y"  
        return
      elsif answer == "n"
        return
      else 
        puts "Please enter a valid response. (y/n)"
        answer = gets.chomp.downcase
      end
    end
  end


end

game = TicTacToe.new
game.game