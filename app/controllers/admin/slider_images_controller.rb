class Admin::SliderImagesController < Admin::AdminController
	def index
		@slider_images = SliderImage.all
		@new_slider_image = SliderImage.new
	end

	def edit
		@slider_image = SliderImage.find(params[:id])
	end

	def create
		@new_slider_image = SliderImage.new(params[:slider_image])
		if @new_slider_image.save
			redirect_to admin_slider_images_url
		else
			@slider_images = SliderImage.all
			render :action => 'index'
		end
	end

	def update
		@slider_image = SliderImage.find(params[:id])
		if @slider_image.update(params[:slider_image])
			redirect_to admin_slider_images_url
		else
			render :action => 'edit'
		end
	end

	def destroy
		@slider_image = SliderImage.find(params[:id])
		@slider_image.destroy
		redirect_to admin_slider_images_url
	end
end