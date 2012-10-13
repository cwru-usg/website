class SliderImage < ActiveRecord::Base
	attr_accessible :title, :url, :image
	has_attached_file :image, :styles => {:original => "520x279#", :thumb => "150x150#" }
end