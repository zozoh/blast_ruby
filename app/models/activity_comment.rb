class ActivityComment
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :activity
  belongs_to :user

  field :comment, type: String
end
