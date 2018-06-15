class Movie < ApplicationRecord
	mount_uploader :image, ImageUploader
	has_many :comments,dependent: :destroy
	validate :dislike , :checkdislike
	validate :like , :checklike
	 def checklike
	 	self.like =0;
	 end
	 
	 def checkdislike
	 	self.dislike =0;
	 end
end
