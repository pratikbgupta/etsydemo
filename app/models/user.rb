class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  # A user has many listings associated to it. Destroying a user, destroys all associated listings i.e. cascade deletion.
  has_many :listings, dependent: :destroy
end
