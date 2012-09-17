# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Users
User.create(:username => 'jdh111', :name => 'James Hale')
User.create(:username => 'ted27', :name => 'Tom Dooner')

# Pages
p = Page.create(:title => "About USG", :content => "Default content of the default page", :active => true)
    Page.create(:title => "The Executive Committee", :content => "The Executive Committee page is a child of the USG Page", :parent_id => p.id, :active => true)
    Page.create(:title => "The General Assembly", :content => "The General Assembly Page is a child of the USG Page", :parent_id => p.id, :active => true)
    Page.create(:title => "The COMPASS Committee", :content => "The COMPASS page is a child of the USG Page but has been archived", :parent_id => p.id, :active => false, :archived_on => Time.now)
Page.create(:title => "Resources", :content => "This is a top level page with no children", :active => true)
Page.create(:title => "Feedback", :content => "This is the USG Feedback form", :active => true)
Page.create(:title => "Disbursements", :content => "This is a disbursements page", :active => true)

# NavItems
NavItem.create(:title => 'Home', :url => "/", :weight => 0)
NavItem.create(:title => 'About Us', :url => "/about-usg", :weight => 1)
NavItem.create(:title => 'Resources', :url => "/resources", :weight => 2)