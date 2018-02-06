class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false
      t.references :blog, null: false

      t.timestamps
    end
  end
end
