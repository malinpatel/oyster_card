class Card

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90

  attr_reader :balance, :in_use

  def initialize(balance = DEFAULT_BALANCE, in_use = false)
    @balance = balance
    @in_use = false
  end

  def top_up(amount)
    raise "Top up failed: maximum balance of £#{MAXIMUM_BALANCE} reached" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
    "Top up of £#{amount} successful. New balance: £#{@balance}"
  end

  def deduct(fare)
    raise "Insufficient funds: Please top up card." if @balance < fare
    @balance -= fare
    "New balance: £#{@balance}."
  end

  def touch_in
    raise "Error: Card already touched in" if in_journey?
    @in_use = true
  end

  def touch_out
    raise "Error: Card has not been touched in" if !in_journey?
    @in_use = false
  end

  def in_journey?
    @in_use == true
  end

end
