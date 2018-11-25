class CreateComentages < ActiveRecord::Migration[5.1]
  def change
    create_table :comentages do |t|
      t.string :comenter
      t.text :body
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
