# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :wants, dependent: :destroy
  has_one :goal, dependent: :destroy
  validates :email, presence: true, uniqueness: true
  # validates :password, presence: true, confirmation: true
  # validates :password_confirmation, presence: true
end
