class Training < ActiveRecord::Base
    belongs_to :user
    belongs_to :exercise
    belongs_to :day
  end