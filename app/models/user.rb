# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_goals
  has_many :goals, through: :user_goals
  has_many :user_activities
  has_many :activities, through: :user_activities
  has_many :stress_logs, class_name: 'StressDatum'
end
