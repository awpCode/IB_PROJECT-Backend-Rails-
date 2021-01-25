class ModelValidator < ActiveModel::Validator
    def validate(record)
      return if record.starttime == nil || record.endtime == nil
      if record.starttime > record.endtime
        record.errors[:base] << "Interview Endtime should be after Start time"
      end
  
      if record.starttime < Time.now
        record.errors[:base] << "Interview Must be Scheduled for the future."
      end
  
      if record.endtime - record.starttime > 14400
        record.errors[:base] << "Interview Duration is longer than allowed(i.e 4 Hours)"
      end
      if !(check_users_count record)
        record.errors[:base] << "Number of users must be greater than 2."
      end
  
      if clash record
        record.errors[:base] << "Some participants are busy in this time slot."
      end
    end
  
    private
    def check_users_count(obj)
      if obj.users.length >=   2
        return true
      else
        return false
      end
    end
  
    def clash(obj)
      users_arr = obj.users
      l = obj.starttime
      r = obj.endtime
      users_arr.each do |user|
        interview_all = user.interviews
        interview_all.each do |interview|
          if interview.id == obj.id || interview.starttime > r || interview.endtime < l
            next
          else
            return true
          end
        end
      end
      return false
    end
  
end
  class Interview < ApplicationRecord
    has_many :interview_users,dependent: :destroy
    has_many :users, through: :interview_users,dependent: :destroy
    validates :starttime, :endtime, presence: true
    validates_with ModelValidator
  end
  