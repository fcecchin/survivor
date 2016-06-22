class Tournament < ActiveRecord::Base
  has_many :matches
  has_many :contests
  
  validates :name, presence: true
  
  scope :actived, lambda { where("tournaments.active = ?", true) }
  
  def to_s
    "#{self.name} #{self.year}"
  end
end
