require 'rubygems'
require File.expand_path(File.dirname(__FILE__) + "/../aplicacao_financeira")
require File.expand_path(File.dirname(__FILE__) + "/../models/investment")
require 'spec'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

describe 'Aplicacao Financeira' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "deve responder ok para pagina inicial" do
    get '/'
    last_response.should be_ok
  end
  
  it "deve responder ok para a pagina de calculo" do
    post '/calculo'
    last_response.should be_ok
  end

end

describe Investment, "when simulated" do
  before(:all) do
    @investment = Investment.new 1000.00, 0.005, 1, 0
  end
  
  describe "and create without param" do
     it "should be ok" do
       Investment.new 
     end
  end
  
  it "initial amount should_not be_nil" do
    @investment.initial_amount.should_not be_nil
  end
  
  it "interest should be greater than 0" do
    @investment.interest.should > 0
  end
  
  it "period should be greater than 1" do
    @investment.period.should > 0
  end
  
  it "monthly application should_not be less than 0" do
    @investment.mounthly_application.should >= 0
  end
  
  it "should calculate " do
    @investment.calculate.should == ['period_amount' => 1005.00.round(2), 'gain'  => 5.00.round(2)] # initial_amount = 1000.00, interest = 0.005, period 1 mounth, mounthly_application = 100
  end
  
  
end
