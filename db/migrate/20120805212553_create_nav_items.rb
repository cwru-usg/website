class CreateNavItems < ActiveRecord::Migration
  def change
    create_table :nav_items do |t|
      t.string :title
      t.string :url

      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth

      t.timestamps
    end
  end
end
