class Day < ActiveRecord::Base
    has_many :trainings
    has_many :exercises, through: :trainings
    has_many :users, through: :trainings
end