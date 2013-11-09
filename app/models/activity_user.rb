class ActivityUser
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :activity
  belongs_to :user

  field :voted, type: Boolean
end
