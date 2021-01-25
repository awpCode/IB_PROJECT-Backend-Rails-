class InterviewSerializer < ActiveModel::Serializer
  attributes :id, :starttime, :endtime
  has_many :users
end
