class User < ActiveRecord::Base
	has_many :friendships, :dependent => :destroy
	has_many :comments, :dependent => :destroy
	has_many :hotspots, :dependent => :destroy

	validates :fb_id, uniqueness: true 



end
