
class Investment
  attr_accessor :initial_amount, :interest, :period, :mounthly_application
  
  def initialize initial_amount = 0, interest = 0, period = 0 , mounthly_application = 0
    self.initial_amount= initial_amount
    self.interest= interest
    self.period= period
    self.mounthly_application= mounthly_application
  end
  
  def calculate
    initial_amount_= self.initial_amount
    gain = 0
    partial_amount = 0
    (1..self.period).each do |p|
      initial_amount_ += self.mounthly_application
      partial_amount = (initial_amount_*(1+self.interest)**p)
      gain = partial_amount - initial_amount
    end
    ['period_amount' => partial_amount.round(2), 'gain'  => 5.00.round(2)]
  end
  
  
end