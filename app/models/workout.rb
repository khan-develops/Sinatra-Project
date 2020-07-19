class Workout < ActiveRecord::Base
    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods

    belongs_to :user
    belongs_to :day
    has_many :exercise_workouts
    has_many :exercises, through: :exercise_workouts
end