class Card

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90

  attr_reader :balance

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(amount)
    raise "Top up failed: maximum balance of £#{MAXIMUM_BALANCE} reached" if @balance + amount > MAXIMUM_BALANCE 
    @balance += amount
    "Top up of £#{amount} successful. New balance: £#{@balance}"
  end

end
