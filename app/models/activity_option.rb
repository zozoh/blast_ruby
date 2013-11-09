class ActivityOption
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :activity
  has_many :users, :class_name => 'ActivityOptionUser'

  field :option, type: Time
end
