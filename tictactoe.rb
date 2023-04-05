# frozen_string_literal: true

# TicTacToe class
class TicTacToe
  def initialize
    @@counter = 0
    @exes_and_os = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @move_counter = 0
    @active_game = true
    @total_moves = []
  end

  # game mostly references other methods to play the game
  def game
    over = false
    begin?
    while over == false
      display_rules
      puts 'OK, here we go!'
      while @active_game
        display_board
        get_move
        break if @move_counter == 9
      end
      display_board
      which_player_wins?
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      puts ''
      validate_boolean(answer)
      over = true if answer == 'n'
      initialize
    end
    puts 'Thank you for playing!'
    puts ''
  end

  # The game mostly alternates between displaying the current condition of the board, and getting a move from a player.

  protected

  def display_board
    puts ''
    puts '     |     |     '
    puts "  #{@exes_and_os[0]}  |  #{@exes_and_os[1]}  |  #{@exes_and_os[2]}  "
    puts '_____|_____|_____'
    puts '     |     |     '
    puts "  #{@exes_and_os[3]}  |  #{@exes_and_os[4]}  |  #{@exes_and_os[5]}  "
    puts '_____|_____|_____'
    puts '     |     |     '
    puts "  #{@exes_and_os[6]}  |  #{@exes_and_os[7]}  |  #{@exes_and_os[8]}  "
    puts '     |     |     '
    puts ''
  end

  def get_move
    @move_counter += 1
    puts 'For \"x\":' if @move_counter.odd?
    puts 'For \"o\":' if @move_counter.even?
    input = validate_num
    index = @exes_and_os.index(input)
    @exes_and_os[index] = 'x' if @move_counter.odd? 
    @exes_and_os[index] = 'o' if @move_counter.even?
    game_over?
  end

  # code to find out who wins, or it it's a tie.
  def which_player_wins?
    if @move_counter == 9 && @active_game == true
      puts 'The game is tied!'
      puts ''
      return
    end
    puts 'Player One wins!' if @move_counter.odd? 
    puts 'Player Two wins!' if @move_counter.even?
    puts ''
  end

  # list of conditions where someone wins
  def game_over?
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

  # get input to begin the game
  def begin?
    start_game = false
    answer = nil
    unless start_game
      puts 'Do you want to play Tic-Tac-Toe? (y/n)'
      answer = gets.chomp.downcase
      puts ''
      validate_boolean(answer)
      if answer == 'n'
        puts 'Until next time!'
        puts ''
        exit
      end
      puts "OK! Let's begin."
      puts ''
      start_game = true
    end
  end

  # display the rules to tic-tac-toe
  def display_rules
    understand = nil
    puts 'Do you need to see the rules? (y/n)'
    answer = gets.chomp.downcase
    puts ''
    validate_boolean(answer)
    return if answer == 'n'
    while understand != 'y'
      puts 'Here are the rules:'
      sleep(1)
      puts 'This is Tic-Tac-Toe, designed to be played by two humans.'
      sleep(1)
      puts 'There are nine valid moves.'
      sleep(1)
      puts 'You make a move by typing in the number corresponding to the number on the board.'
      sleep (1)
      puts 'Player One will go first, and will input their choice.'
      sleep(1)
      puts 'Player Two will go second, and will input their choice.'
      sleep(1)
      puts 'Play continues back-and-forth until one player has three of their marks in a row,'
      puts 'or until no more moves can be made.'
      sleep(1)
      puts 'You cannot enter a number that has already been played.'
      sleep(1)
      puts 'Do you understand?(y/n)'
      understand = gets.chomp.downcase
      puts ''
      validate_boolean(understand)
      return if understand == 'y'

      puts 'OK, here are the rules again.'
    end
  end

  # make it so only 'y' or 'n' can be input
  def validate_boolean(answer)
    while answer
      if answer == 'y'
        return
      elsif answer == 'n'
        return
      else
        puts 'Please enter a valid response. (y/n)'
        answer = gets.chomp.downcase
        puts ''
      end
    end
  end

  # make it so only valid moves can be chosen by the player
  def validate_num
    answer = 'invalid'
    while answer == 'invalid'
      puts 'In which space would you like to make your move?(1-9)'
      input = gets.chomp.to_i
      puts ''
      any = @total_moves.any? { |el| el == input }
      if input.between?(1, 9) && any == false
        @total_moves << input
        return input
        answer = 'valid'
      end
    end
  end
end

game = TicTacToe.new
game.game
