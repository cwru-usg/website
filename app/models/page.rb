class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_for_url, :use => [:slugged, :history]
  acts_as_nested_set
  
  attr_accessible :title, :content, :parent_id, :active, :archived_on, :url_seed
  
  # url_seed is available to be set before a save.  If it is set, the content of
  # url_seed overrides the value of title when creating the URL for the page
  attr_accessor :url_seed
  
  validates_presence_of :title, :content
  
  scope :currently_active, :conditions => { :active => true }
  scope :archived, :conditions => { :active => false }
  
  def slug_for_url
    self.url_seed.blank? ? self.title : self.url_seed
  end
  
  def active?
    self.active
  end
  
  def archived?
    !self.active
  end
end
