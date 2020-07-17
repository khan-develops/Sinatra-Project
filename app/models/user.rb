class User < ActiveRecord::Base
    has_secure_password

    has_many :trainings
    has_many :exercises, through: :trainings
    has_many :days, through: :trainings

  end