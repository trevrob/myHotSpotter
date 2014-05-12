class Hotspot < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy

  validates :latitude, uniqueness: true
  validates :longitude, uniqueness: true 

  # has_attached_file :pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
# Validate content type
 # 	validates :pic, :attachment_presence => true
	# validates_with AttachmentPresenceValidator, :attributes => :pic
# Explicitly do not validate
  # do_not_validate_attachment_file_type :pic

  # validates_attachment :pic, :content_type => { :content_type => ["image/jpg", "image/gif", "image/png"] }
end
