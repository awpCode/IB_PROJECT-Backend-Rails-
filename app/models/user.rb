class User < ApplicationRecord
    validates :name, length: { minimum: 3, maximum: 25 }
    has_many :interview_users, dependent: :destroy
    has_many :interviews, through: :interview_users, dependent: :destroy
  end
  