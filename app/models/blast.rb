class Blast
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :reblasts

  field :ow, 			type: String # owner
  field :cnt, 		type: String # content
  field :pic, 		type: String # picture
  field :picurl, 	type: String # picurl
  field :lv, 			type: Integer # live

  field :lo,  type: Array
  index({lo: "2d"})

  # distance - 0.5 (35 - 55km)
  # distance - 0.005 (300 - 500m)
end
