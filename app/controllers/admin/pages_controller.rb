class Admin::PagesController < Admin::AdminController
  def index
    @pages = Page.limit(5).order('created_at DESC').where(:active => true)
    @archived_pages = Page.limit(5).order('created_at DESC').where(:active => false)
    @new_page = Page.new
  end
  
  def active
    @pages = Page.now_active
  end
  
  def archived
    @pages = Page.now_archived
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def show
    @page = Page.find(params[:id])
  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to edit_admin_page_path(@page)
    else
      render :action => 'edit'
    end
  end
  
  def create
    @page = Page.new(params[:page])
    @page.content = "Add your content here :)"
    if @page.save
      redirect_to '/editor' + page_path(@page)
    else
      render :action => 'index'
    end
  end
end