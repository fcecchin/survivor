class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable,
         :validatable, :omniauthable, omniauth_providers: [:facebook]

  validates :name, presence: true
  validates_uniqueness_of :email
  validates :email, :uniqueness => true, 
                    :length => { :within => 5..50 }, 
                    :format => { :with => /\A[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}\z/i }

  has_many :participants
  has_many :guesses, 	through: :participants 
  has_many :contests,	through: :participants
  has_many :managed_contests, :class_name => 'Contest'

  # guesses for matches finished or started
  #has_many :public_guesses, -> { joins(:match).where("matches.datetime <= ?", Time.now).order("matches.datetime DESC") }, 
  #         class_name: 'Guess', primary_key: :id, foreign_key: :user_id

  # put the users with no points (null = new user) to the end of the list
  scope :rank, -> { order('position IS NULL, position ASC') }

  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.id = auth.id
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end

  def to_s
    name
  end
end