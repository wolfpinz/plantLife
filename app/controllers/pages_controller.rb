class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @garden_first = Garden.first
    @gardens = Garden.all
    @garden = Garden.new
    @my_plants = MyPlant.all.order(:last_watered)
  end
end
