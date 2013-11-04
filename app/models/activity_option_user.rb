class ActivityOptionUser
  include Mongoid::Document

  belongs_to :selected_option, :class_name => 'ActivityOption'

  field :name, type: String
end
