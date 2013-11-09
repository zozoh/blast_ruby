class User
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :activity
  has_many :options, :class_name => 'ActivityOptionUser'

  field :name, type: String
  field :username, type: String
end
