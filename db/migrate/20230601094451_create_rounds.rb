class CreateRounds < ActiveRecord::Migration[7.0]
  def change
    create_table :rounds do |t|
      t.string :date
      t.integer :number_of_holes
      t.integer :score
      t.string :guest_name
      t.integer :guest_score

      t.timestamps
    end
  end
end
