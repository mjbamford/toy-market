class ToysController < ApplicationController
  def index
    @toys = Toy.all
  end

  def new
    @toy = Toy.new
  end

  def create
    respond_to do |format|
      if toy = (Toy.create params[:toy])
        format.html { redirect_to toys_path, notice: 'Your toy was successful created' }
      else
        format.html { render 'new' }
      end
    end
  end
end
