class PagesController < ApplicationController
  def home
    @restaurants = Restaurant.all
    @restaurant = Restaurant.new
  end
  def create
    @restaurant = Restaurant.find(params[:id])

    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to root_path, notice: "Restaurant was successfully created." }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :city, :user_id)
  end
end
