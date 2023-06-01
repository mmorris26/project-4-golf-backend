class AddReferenceToRounds < ActiveRecord::Migration[7.0]
  def change
    add_reference :rounds, :course, foreign_key: :true
  end
end
