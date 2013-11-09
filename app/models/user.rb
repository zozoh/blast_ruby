class User
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :activity

  field :name, type: String
  field :username, type: String
  field :option
end
