class CreateIdeasImages < ActiveRecord::Migration
  def change
    create_table :ideas_images do |t|
      t.integer :image_id
      t.integer :idea_id

      t.timestamps null: false
    end
  end
end
