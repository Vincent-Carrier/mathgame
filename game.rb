require_relative 'player'
require_relative 'question'

class Game
  def initialize
    @over = false
    @questioning = Player.new(1)
    @answering = Player.new(2)
    @player1 = @questioning
    @player2 = @answering
  end

  def round
    question = Question.new
    puts "Player #{@questioning.num}: #{question}"
    answer = @answering.prompt_answer
    correct = answer.to_i == question.answer
    response = correct ? "YES! You are correct." : "Seriously? No!"
    puts "Player #{@answering.num}: #{response}"
    @answering.take_damage unless correct
    @over = true if @answering.health <= 0

    unless @over
      puts "#{@player1} vs #{@player2}"
      @questioning, @answering = @answering, @questioning
      puts "----- NEW TURN -----"
    end
  end

  def start
    until @over do
      round
    end

    puts "@questioning wins with a score of #{@questioning.score}"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end
end

Game.new.start
