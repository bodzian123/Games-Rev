class CreateOpinions < ActiveRecord::Migration[5.1]
  def change
    create_table :opinions do |t|
      t.string :commenter
      t.text :body
      t.references :music, foreign_key: true

      t.timestamps
    end
  end
end
