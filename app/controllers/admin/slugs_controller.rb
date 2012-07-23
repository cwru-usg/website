class Admin::SlugsController < Admin::AdminController
  def destroy
    @slug = FriendlyId::Slug.find(params[:id])
    @slug.destroy
    redirect_to :back, :notice => "The URL <strong>/#{@slug.slug}</strong> has been removed"
  end
end