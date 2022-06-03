class MyPlantsController < ApplicationController
  before_action :set_garden, only: [ :new, :create, :show]
  before_action :set_my_plant, only: [ :show, :water ]
  before_action :set_plant, only: [ :new, :create ]
  skip_before_action :authenticate_user!, only: [ :new, :create, :show ]

  def new
    @my_plant = MyPlant.new
  end

  def edit
    @my_plant = MyPlant.find(params[:id])
    @garden = Garden.find(params[:garden_id])
  end

  def update
    @my_plant = MyPlant.find(params[:id])
    @my_plant.update(my_plant_params)
    @garden = Garden.find(params[:garden_id])
    redirect_to garden_path(@garden)
  end

  def create
    @my_plant = MyPlant.new(my_plant_params)
    @garden = Garden.find(params[:garden_id])
    @my_plant.garden = @garden
    @my_plant.plant = Plant.find(params[:plant_id])
    # raise
    if @my_plant.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def show
    # set_my_plant
  end

  def water
    # set_my_plant
    @my_plant.update(last_watered: Date.today)
    # redirect_to :root
  end

  private


  def set_garden
    @garden = Garden.find(params[:garden_id])
  end

  def set_plant
    @plant = Plant.find(params[:plant_id])
  end

  def set_my_plant
    @my_plant = MyPlant.find(params[:id])
  end

  def my_plant_params
    params.require(:my_plant).permit(:nickname, :light_exposure, :photo, :last_watered, :plant_id)
  end
end
