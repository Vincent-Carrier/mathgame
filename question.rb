class Question
  @@range = (1..20).to_a

  attr_reader :answer

  def initialize
    @a = @@range.sample
    @b = @@range.sample
    @answer = @a + @b
  end

  def to_s
    "What does #{@a} + #{@b} equal?"
  end
end
