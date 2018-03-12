require 'open-uri'
require 'json'


class GamesController < ApplicationController
  def new
    @letters = []
    letter = ("A".."Z").to_a
    10.times do
      @letters << letter.sample
    end
  end

  def score
    @word = params[:word].upcase
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    user_serialized = open(url).read
    stuff = JSON.parse(user_serialized)


    if stuff["found"] == true
     @result = @word
   else
    @result = "nope"
    end
  end
end
