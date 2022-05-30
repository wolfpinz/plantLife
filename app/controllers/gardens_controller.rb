class GardensController < ApplicationController
  before_action :set_garden, only: [:show, :destroy]

  def show
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

  def garden_params
    params.require(:garden).permit(:name)
  end

  def set_garden
    @garden = Garden.find(params[:id])
  end
end
