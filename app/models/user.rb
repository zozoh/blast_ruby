class User
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :activity
  has_many :invited_activities, :class_name => 'ActivityUser'
  has_many :created_activities, :class_name => 'Activity'
  has_many :options, :class_name => 'ActivityOptionUser'

  field :name, type: String
  field :username, type: String
end
