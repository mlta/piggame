
class Player
  attr_reader :score, :name, :wins, :losses

  def initialize(name)
    @name = name
    @score = 0
    @wins = 0
    @losses = 0
  end



  def start_game
    @score = 0
  end




  def start_turn
    @turn_score = 0
    @turn_over = false
  end



  def record_roll(roll)
    if roll == 1
      @turn_score = 0
      @turn_over = true
    else
      @turn_score += roll
    end
  end




  def end_turn
    @score += @turn_score
  end



  def end_game
    if score >= 100
      @wins += 1
    else
      @losses += 1
    end
  end



  def roll_again?
    !@turn_over
  end
end




class CautiousPlayer < Player
  def roll_again?
    super && @turn_score < 2
  end
end

class StopsEven < Player
  def stops_even
    num = rand(1..100)
    if num % 2 == 0
      @turn_over = true
    end
  end
end

class StopsOdd < Player
  def StopsOdd
    num = rand(1..100)
    if num % 2 != 0
      @turn_over = false
    end
  end
end

class StopsScore < Player
  def stops_score
    if @turn_score == 3
      @turn_over
    else
      super roll_again
    end
  end
end

class StopsRolls < Player
  def stops_rolls
    if roll == 11
      @turn_over
    else
      super roll_again
    end
  end
end

class GreedyPlayer < Player
  def roll_again?
    super && @turn_score < 50
  end
end
## TODO add your own Player subclasses here
