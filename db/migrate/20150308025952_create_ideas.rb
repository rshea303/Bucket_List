class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.string :description
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :ideas, :users
  end
end
