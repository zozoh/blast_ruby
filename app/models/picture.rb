class Picture
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  belongs_to :blast

  field :attachment_file_name, type: String

  has_mongoid_attached_file :attachment,
  	:url  => "/assets/pictures/:id/:style/:basename.:extension",
  	:path => ":rails_root/public/assets/pictures/:id/:style/:basename.:extension",
    # :path           => ':attachment/:id/:style.:extension',
    :styles => {
      :original => ['1920x1680>', :jpg],
      :small    => ['100x100#',   :jpg],
      :medium   => ['250x250',    :jpg],
      :large    => ['500x500>',   :jpg]
    },
    :convert_options => { :all => '-background white -flatten +matte' }
end
