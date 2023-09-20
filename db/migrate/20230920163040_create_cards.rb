class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :question
      t.string :answer
      t.boolean :seen
      t.boolean :correct
      t.integer :deck_id

      t.timestamps
    end
  end
end
