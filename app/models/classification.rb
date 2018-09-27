class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    Classification.all
  end

  def self.longest
    boats = Boat.arel_table
    joins(classification: :boats).project(boats:[:length].maximum)

  end

end
