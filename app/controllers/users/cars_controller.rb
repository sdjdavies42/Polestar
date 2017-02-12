class Users::CarsController < ApplicationController
  # GET /users/:user_id/cars
  def index
    @user = User.includes(:cars).find(params[:user_id])
    @cars = @user.cars
  end
end