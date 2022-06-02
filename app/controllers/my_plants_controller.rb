class MyPlantsController < ApplicationController
  before_action :set_garden, only: [ :new, :create, :show]
  before_action :set_plant, only: [ :new, :create ]
  skip_before_action :authenticate_user!, only: [ :new, :create, :show ]

  def new
    @my_plant = MyPlant.new
  end

  def create
    @my_plant = MyPlant.new(my_plant_params)
    @garden = Garden.find(params[:garden_id])
    @my_plant.garden = @garden
    @my_plant.plant = Plant.find(params[:plant_id])
    # raise
    if @my_plant.save
      redirect_to garden_my_plant_path(@garden, @my_plant)
    else
      render :new
    end
  end

  def show
    @my_plant = MyPlant.find(params[:id])
  end

  private

  def set_garden
    @garden = Garden.find(params[:garden_id])
  end

  def set_plant
    @plant = Plant.find(params[:plant_id])
  end

  def my_plant_params
    params.require(:my_plant).permit(:nickname, :light_exposure, :photo, :last_watered, :plant_id)
  end
end
