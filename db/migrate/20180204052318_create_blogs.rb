class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :content
      t.timestamps
    end
  end
end
