class AddHandicapToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :handicap, :integer
  end
end
