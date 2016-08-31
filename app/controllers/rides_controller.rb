class RidesController < ApplicationController
  def create
    redirect_to user_path(@user)

    @ride = Ride.new(ride_params)
    if @ride.save
      if @ride.take_ride
        @user = User.find_by(id: params[:user_id])
      else
      end
    else

    end
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
