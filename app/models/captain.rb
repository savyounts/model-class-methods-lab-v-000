class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    includes(boats: :classifications).where(classifications: {name: "Catamaran"})
  end

  def self.sailors
    includes(boats: :classifications).where(classifications: {name: "Sailboat"}).uniq
  end

  def self.talented_seafarers
    mb = self.includes(boats: :classifications).where(classifications:{name: "Motorboat"}).uniq &
    sailors =self.sailors
    sailors.select do |sailor|
      mbid = mb.collect {|m| m.id}
      if mbid.include?(sailor.id)
      end
    end
  end

  def self.non_sailors
    includes(boats: :classifications).where.not(classifications:{name: "Sailboat"}).uniq
  end
end
