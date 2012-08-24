class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :fetch_nav_items

  def fetch_nav_items
  	@nav_items = NavItem.order("weight ASC")
  end
end
