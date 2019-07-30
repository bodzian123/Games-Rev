class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :text
      t.string :type
      t.integer :user_id
      
      t.timestamps
    end
  end
end
