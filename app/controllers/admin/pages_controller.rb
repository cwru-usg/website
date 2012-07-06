class Admin::PagesController < Admin::AdminController
  def index
    @pages = Page.limit(5).order('created_at DESC').where(:active => true)
    @archived_pages = Page.limit(5).order('created_at DESC').where(:active => false)
    @new_page = Page.new
  end
  
  def active
    @pages = Page.all
  end
  
  def archived
    @pages = Page.archived
  end
  
  def show
    @page = Page.find(params[:id])
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def update
    @page = Page.find(params[:id])
  end
  
  def create
    @page = Page.new(params[:page])
    @page.content = "Add your content here :)"
    @page.save!
    
    redirect_to '/editor' + page_path(@page)
  end
end