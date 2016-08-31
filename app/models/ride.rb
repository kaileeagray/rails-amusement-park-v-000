class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    check_nil
    if can_ride?
      user.tickets -= attraction.tickets
      user.happiness +=attraction.happiness_rating
      user.nausea += attraction.nausea_rating
      user.save
      "Thanks for riding the #{attraction.name}!"
    else
      message = "Sorry."
      message += " You do not have enough tickets the #{attraction.name}." if !enough_tickets?
      message += " You are not tall enough to ride the #{attraction.name}." if !tall_enough?
      message
    end
  end

  def can_ride?
    enough_tickets? && tall_enough?
  end

  def enough_tickets?
    user.tickets >= attraction.tickets
  end

  def tall_enough?
    user.height >= attraction.min_height
  end

  def check_nil
    user.tickets = 0 unless  user.tickets
    attraction.tickets = 0 unless  attraction.tickets
  end

end
