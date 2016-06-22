class Team < ActiveRecord::Base
  before_save :define_slug

  validates :name, presence: true
  
  def  to_s
  	self.name
  end

  private
    def define_slug
      self.slug = self.name.parameterize
    end
end
