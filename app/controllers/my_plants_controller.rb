class MyPlantsController < ApplicationController
  before_action :set_garden, only: [ :new, :create]
  before_action :set_plant, only: [ :new, :create]
  skip_before_action :authenticate_user!, only: [ :new, :create ]

  def new
    @my_plant = MyPlant.new
    raise
  end

  def create
    my_plant = MyPlant.new(my_plant_params)
    my_plant.plant = @plant
    raise
    if my_plant.save
      redirect_to gardens_path(@garden)
    else
      render :new
    end
  end

  private

  def set_garden
    @garden = Garden.find(params[:garden_id])
  end

  def set_plant
    @plant = Plant.find(params[:plant_id])
  end

  def my_plant_params
    params.require(:my_plant).permit(:nickname, :light_exposure, :photo)
  end
end
