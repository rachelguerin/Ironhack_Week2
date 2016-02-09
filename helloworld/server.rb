require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
require 'artii'

enable(:sessions)

get '/ascii/:word/?:font?/?:secret?' do
	@word = params[:word]
	@font = params[:font]
	@secret = params[:secret]

	if @word == "redback" && @font == "special" && @secret == "secret"
		erb(:fav_animal)
	else
		if @font 
			@asciiword = Artii::Base.new :font => @font
		else
			@asciiword = Artii::Base.new
		end

		erb(:artii)
	end
end

get '/session_test/:text' do
	text = params[:text]
	session[:saved_value] = text
end

get '/session_show' do
	"Now in the session " + session[:saved_value].to_s
end

get '/' do
	"<html>
	<body><h1>My first Sinatra app.</h1></body>
	</html>
	"
end

get "/hi" do
	@greeting = "Hello world!"
	erb(:hipage)
end

get "/about" do
	erb(:about)
end

get "/author" do
	erb(:author)
end

get "/pizza" do
	@ingredients = ["cheese","pepperoni","mushrooms"]
	erb(:pizza)
end

get "/times/:hrs" do
	@hrs = params[:hrs]
	erb(:times)
end

get "/sum/:n1/:n2" do
	@n1 = params[:n1]
	@n2 = params[:n2]
	@answer = @n1.to_i + @n2.to_i
	erb(:sum)
end

get "/sum2" do
	binding.pry
	@n1 = params[:n1]
	@n2 = params[:n2]
	@answer = @n1.to_i + @n2.to_i
	erb(:sum)
end

# get "sum", "/sum/:n1/:n2" do
# 	@n1 = params[:n1]
# 	@n2 = params[:n2]
# 	@answer = @n1.to_i + @n2.to_i
# 	erb(:sum)
# end

get "/foo" do
	status(418)
	"I'm a teapot!"
end


