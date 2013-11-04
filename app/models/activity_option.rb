class ActivityOption
  include Mongoid::Document

  belongs_to :activity

  field :option, type: Time
  field :users, type: Array
end
