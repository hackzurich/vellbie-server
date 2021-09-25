class AddIndexToStressDatum < ActiveRecord::Migration[6.0]
  def change
    add_index :stress_data, :uid, unique: true
  end
end
