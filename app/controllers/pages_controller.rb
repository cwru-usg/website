class PagesController < ApplicationController
  before_filter :find_page
  before_filter :authenticate_user!, :only => [:update]
  
  def show
    if !@page.active?
      user_signed_in? ? flash[:notice] = "You are vewing an archived page (only available to admins)" : raise(ActionController::RoutingError.new('Page is not active'))
    end
  end
  
  # Mercury Editor is updating a page
  def update
    @page.content = params[:content][:page_content][:value]
    @page.save!
    render :text => ""
  end
  
  def find_page
    @page = Page.find(params[:id])
    if request.path != page_path(@page)
      flash[:notice] = render_to_string :partial => "flashes/page_url_change"
      return redirect_to @page, :status => :moved_permanently
    end
  end
  
end