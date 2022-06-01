class PlantsController < ApplicationController
  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)

    if @plant.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def plant_params
    params.require(:plant).permit(:species, :common_name, :scientific_name, :water, :soil, :sun, :temperature)
  end
end
