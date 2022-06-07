class GardensController < ApplicationController
  before_action :set_garden, only: [ :show, :destroy ]
  skip_before_action :authenticate_user!, only: [ :show, :new, :create, :destroy ]

  def index
    @gardens = Garden.where(user: current_user)
    @garden_count = @gardens.count
    @my_plants_count = my_plants_count
  end

  def show
    @my_plants = @garden.my_plants
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(garden_params)
    @garden.user = current_user
    if @garden.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def destroy
    @garden.destroy
  end

  private

  def my_plants_count
    @gardens = Garden.where(user: current_user)
    plant_count = 0
    @gardens.each do |garden|
      plant_count += garden.my_plants.count
    end
    return plant_count
  end

  def garden_params
    params.require(:garden).permit(:name)
  end

  def set_garden
    @garden = Garden.find(params[:id])
  end
end
