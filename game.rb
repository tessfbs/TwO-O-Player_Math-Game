class Game
  def initialize
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @current_player = @player1
  end

  def start
    loop do
      puts "----- NEW TURN -----"
      question = generate_question
      puts "#{current_player.name}: #{question}"
      answer = gets.chomp.to_i
      if answer == question.sum
        puts "#{current_player.name}: Yes! You are correct."
      else
        puts "#{current_player.name}: Seriously? No!"
        current_player.lose_life
      end
      puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
      break if player1.dead? || player2.dead?
      switch_player
    end
    announce_winner
  end

  private

  attr_reader :player1, :player2, :current_player

  def generate_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    "Whats does #{num1} plus #{num2} equal?"
  end

  def switch_player
    @current_player = current_player == player1 ? player2 : player1
  end

  def announce_winner
    winner = player1.dead? ? player2 : player1
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "----- GAME OVER -----"
  end
end