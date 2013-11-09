class ActivityOptionUser
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :selected_option, :class_name => 'ActivityOption'
  belongs_to :user
end
