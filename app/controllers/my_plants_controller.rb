class MyPlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]

  def new
    @my_plant = MyPlant.new
  end

end
