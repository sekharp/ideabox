class AddColumnToIdeas < ActiveRecord::Migration
  def change
    add_reference :ideas, :category, index: true, foreign_key: true
  end
end
