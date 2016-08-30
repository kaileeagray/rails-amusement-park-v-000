class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    message = "Sorry. "
    binding.pry
  end


end
