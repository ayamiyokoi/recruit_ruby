class User < ApplicationRecord
  has_many :events
  has_many :accept_conditions
  has_many :companies
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
