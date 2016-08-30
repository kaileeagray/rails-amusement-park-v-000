class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :rides
  has_many :attractions, through: :rides


  def mood
    if self.nausea > self.happiness
      "sad"
    else
      "happy"
    end
  end




  def email_required?
    false
  end


end
