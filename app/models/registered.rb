class Registered < ActiveRecord::Base

  attr_accessible :email

  validates :email,       :presence => true,  :length => {:maximum => 50}

end