# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Users
User.create(:username => 'jdh111', :name => 'James Hale')

# Pages
p = Page.create(:title => "Default page", :content => "Default content of the default page", :active => true)
    Page.create(:title => "A child page", :content => "This is a child of another page", :parent_id => p.id, :active => true)
    Page.create(:title => "Another child page", :content => "This is another child page that is archived", :parent_id => p.id, :archived_on => Time.now)
Page.create(:title => "A top-level page", :content => "This is a top level page with no children that is archived", :archived_on => Time.now)