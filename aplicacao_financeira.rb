require 'sinatra'
require File.expand_path(File.dirname(__FILE__) + "/models/investment.rb")

get '/' do
  erb :index
end

post '/calculo' do
  investment = Investment.new params[:capital_inicial],params[:juros], params[:tempo], params[:aplicacao_mensal]
  Investment.calculate
end