class ToysController < ApplicationController
  TOY_PERMITTED_PARAMS = %i[ name description price image ]

  rescue_from ActionController::ParameterMissing do
    @toy = new_toy
    render :new
  end

  def index
    @toys = Toy.all
  end

  def show
    @toy = Toy.find params[:id]
  end

  def new
    @toy = new_toy
  end

  def create
    respond_to do |format|
      if (@toy = new_toy toy_params).save
        format.html { redirect_to toys_path, notice: 'Toy was successfully created.' }
        format.json { render :show, status: :created, location: @toy }
      else
        format.html { render :new }
        format.json { render json: @toy.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def toy_params
    params.require(:toy).permit TOY_PERMITTED_PARAMS
  end

  def new_toy attrs = {}
    Toy.new attrs
  end
end
