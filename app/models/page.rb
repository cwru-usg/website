class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => [:slugged, :history]
  acts_as_nested_set
  
  attr_accessible :title, :content, :parent_id, :active, :archived_on
  
  scope :currently_active, :conditions => { :active => true }
  scope :archived, :conditions => { :active => false }
  
  def active?
    self.active
  end
  
  def archived?
    !self.active
  end
end
