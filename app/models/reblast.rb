class Reblast
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :bid, :class_name => 'Blast'

  field :bno, type: Integer

end
