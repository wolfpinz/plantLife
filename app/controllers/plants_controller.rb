class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    # display plants the user searched for
    @plants = Plant.all
  end
end
