class NavItem < ActiveRecord::Base
  acts_as_nested_set
  attr_accessible :title, :url, :parent_id, :weight
end
