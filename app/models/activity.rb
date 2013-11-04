class Activity
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :options, :class_name => 'ActivityOption'

  field :name, type: String
  field :option1, type: Time
  field :option2, type: Time
  field :option3, type: Time
end
