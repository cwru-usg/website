class Admin::NavItemsController < Admin::AdminController
	def index
		@nav_items = NavItem.roots
		@new_nav_item = NavItem.new
		@nav_item_weight_options = [["Weight (0)",0]]+(1..(@nav_items.max_by {|ni| ni.weight}.weight+1)).map {|x| [x,x]}
	end

	def create
		@nav_item = NavItem.new(params[:nav_item])
		@nav_item.save

		redirect_to admin_nav_items_url
	end

	def destroy
		@nav_item = NavItem.find(params[:id])
		@nav_item.destroy

		redirect_to admin_nav_items_url
	end
end