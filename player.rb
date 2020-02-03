class Player
  @@max_health = 3

  attr_reader :health, :num

  def initialize n
    @num = n
    @health = @@max_health
  end

  def prompt_answer
    gets.chomp
  end

  def take_damage
    @health -= 1
  end

  def score
    "#{@health}/#{@@max_health}"
  end

  def to_s
    "P#{@num}: #{score}"
  end
end
