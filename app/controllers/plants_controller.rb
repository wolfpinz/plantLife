class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    # display plants the user searched for
    @garden = Garden.find(params[:garden_id])
    @plants = Plant.where(common: params[:query])
  end
end
