class Registered < ActiveRecord::Base

  attr_accessible :email, :location

  validates :email,       :presence => true,  :length => {:maximum => 50}

end