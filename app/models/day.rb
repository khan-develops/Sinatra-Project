class Day < ActiveRecord::Base
    has_many :workouts
    has_many :user, through: :workouts
end