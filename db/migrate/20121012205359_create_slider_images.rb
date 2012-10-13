class CreateSliderImages < ActiveRecord::Migration
	def up
		create_table :slider_images do |t|
			t.string :title
			t.string :url
			t.attachment :image
		end
	end

	def down
		drop_table :slider_images
	end
end
