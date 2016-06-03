class Contest < ActiveRecord::Base
  has_many :matches
  belongs_to :user
  
  validates :name, presence: true
end
