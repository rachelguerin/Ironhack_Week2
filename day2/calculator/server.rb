require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
require_relative './lib/calc'

enable(:sessions)

get '/:name' do
	session[:name] = params[:name]
	calc = Calculator.new(session[:name])
	@retrieved_val = calc.retrieve 
	erb(:home)
end

post '/calculate' do
	operation = params[:operation]
	calc = Calculator.new(session[:name])
	first = params[:first_num].to_f 
	second = params[:second_num].to_f
	case operation
	when 'add'	
		@result = calc.add(first,second)
		@resultString = "#{first} + #{second} = #{@result}"
		erb (:result)
	when 'sub'
		@result = calc.sub(first,second)
		@resultString = "#{first} - #{second} = #{@result}"
		erb (:result)
	when 'mult'
		@result = calc.mult(first,second)
		@resultString = "#{first} * #{second} = #{@result}"
		erb (:result)
	when 'div'
		@result = calc.div(first,second)
		@resultString = "#{first} / #{second} = #{@result}"
		erb (:result)
	when 'reset'
		calc.reset
		erb(:home)
	end
	
end

post '/memory' do
	calc = Calculator.new(session[:name])
	@result = params[:result]
	calc.save(@result)
	@retrieved_val = calc.retrieve 
	erb(:home)
end


