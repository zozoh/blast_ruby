class Token
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user

  validates_presence_of :token, :type
  validates_uniqueness_of :token
  
  field :token, type: String
  field :type, type: String
end
