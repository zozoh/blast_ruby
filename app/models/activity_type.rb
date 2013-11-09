class ActivityType
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :activity

  field :name, type: String
  field :type, type: String
  field :image, type: String
end
