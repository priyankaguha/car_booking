class User < ActiveRecord::Base
  # Include default devise modules. Others available are:

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
      #   :confirmable, :lockable, :timeoutable


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates :email, presence: true,
             length: { maximum: 255 },
             format: { with: VALID_EMAIL_REGEX },
             uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 8 }, allow_blank: true






end
