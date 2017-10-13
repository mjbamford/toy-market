class HomesController < ApplicationController
  def show
    @home = Home.find_by! name: params[:name]
  end
end
