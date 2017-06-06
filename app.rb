require_relative 'config/environment'

class App < Sinatra::Base
  get '/reversename/:name' do
    "#{params[:name].reverse}"
  end

  get '/square/:number' do
    "#{params[:number].to_i * params[:number].to_i}"
  end

  get '/say/:number/:phrase' do
    n = params[:number].to_i
    "#{params[:phrase]}\n" * n
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    "#{params[:word1]} #{params[:word2]} #{params[:word3]} #{params[:word4]} #{params[:word5]}."
  end

  get '/:operation/:number1/:number2' do
    @num1, @num2 = params[:number1].to_i, params[:number2].to_i
    case params[:operation]
    when add
      "#{@num1 + @num2}"
    when subtract
      "#{@num1 - @num2}"
    when multiply
      "#{@num1 * @num2}"
    when divide
      "#{@num1 / @num2}"
    end
  end
end


# Create a dynamic route at get '/say/:word1/:word2/:word3/:word4/:word5' that
# accepts five words and returns a string with them formatted as a sentence.
# Create a dynamic route at get '/:operation/:number1/:number2' that accepts an
# operation (add, subtract, multiply or divide) and performs the operation on
# the two numbers provided. For example, going to /add/1/2 should render 3.
