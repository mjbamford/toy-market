class ToysController < ApplicationController
  def index
    @toys = Toy.all
  end
end
