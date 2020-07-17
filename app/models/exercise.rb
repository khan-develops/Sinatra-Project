class Exercise < ActiveRecord::Base
  has_many :trainings
  has_many :users, through: :trainings
  has_many :days, through: :trainings
end