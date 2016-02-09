require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
require_relative './lib/calc'

get '/' do
	erb(:home)
end

post '/calculate' do
	operation = params[:operation]
	case operation
	when 'add'
		first = params[:first_add].to_f
		second = params[:second_add].to_f
		result = Calculator.add(first,second)
		"#{first} + #{second} = #{result}"
	when 'sub'
		first = params[:first_sub].to_f
		second = params[:second_sub].to_f
		result = Calculator.sub(first,second)
		"#{first} - #{second} = #{result}"
	when 'mult'
		first = params[:first_mult].to_f
		second = params[:second_mult].to_f
		result = Calculator.mult(first,second)
		"#{first} * #{second} = #{result}"
	when 'div'
		first = params[:first_div].to_f
		second = params[:second_div].to_f
		result = Calculator.div(first,second)
		"#{first} / #{second} = #{result}"
	end
end


