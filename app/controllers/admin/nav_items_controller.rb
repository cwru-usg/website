class Admin::NavItemsController < Admin::AdminController
	def index
		@nav_items = NavItem.all
	end

	def edit
		@nav_item = NavItem.find(params[:id])
	end

	def create
		@nav_item = NavItem.new(params[:nav_item])
	end

	def destroy
		@nav_item = NavItem.find(params[:id])
	end
end