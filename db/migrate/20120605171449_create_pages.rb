class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.boolean :active, :default => false
      t.timestamp :archived_on
      
      # awesome_nested_set (acts_as_nested_set)
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth

      t.timestamps
    end
    add_index :pages, :slug, unique: true
  end
end
