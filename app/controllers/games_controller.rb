require 'json'
require 'open-uri'
class GamesController < ApplicationController
  URL = "https://wagon-dictionary.herokuapp.com/"

  # def create
  #   if user = User.authenticate(params[:username], params[:password])
  #     # Save the user ID in the session so it can be used in
  #     # subsequent requests
  #     session[:current_user_id] = user.id
  #     redirect_to root_url
  #   end
  # end

  def new
    vowels = %w[a u e o i].sample(2)
    array_letters = ('a'..'z').to_a
    @letters = array_letters.sample(8)
    @letters << vowels
    @letters = @letters.flatten
  end

  def score
    @letters = params[:letters]
    @word = params[:word]
    @result = @word.length
    @boolean_english = open(URL + @word).read
    @boolean_english = JSON.parse(@boolean_english)
    number_letters_grid = Hash.new(0)
    number_letters_word = Hash.new(0)
    @letters.split(" ").each { |letter| number_letters_grid[letter] += 1 }
    @word.split('').each { |letter| number_letters_word[letter] += 1 }
    @check = number_letters_word.select do |k, _|
      number_letters_word[k] > number_letters_grid[k] || number_letters_grid[k].zero?
    end
  end

  def reset
    session[:score] = 0
    redirect_to new_path
  end
end
