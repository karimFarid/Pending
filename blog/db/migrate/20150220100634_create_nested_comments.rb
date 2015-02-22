class CreateNestedComments < ActiveRecord::Migration
  def change
    create_table :nested_comments do |t|
      t.string :commenter
      t.text :body
      t.references :comment, index: true
      t.references :post, index: true

      t.timestamps null: false
    end
    add_foreign_key :nested_comments, :comments
    add_foreign_key :nested_comments, :posts
  end
end
