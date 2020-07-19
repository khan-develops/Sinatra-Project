class User < ActiveRecord::Base

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  has_secure_password

  has_many :workouts
  has_many :days, through: :workouts

end