class AddStressLevelToStressDatum < ActiveRecord::Migration[6.0]
  def change
    add_column :stress_data, :stress_level, :integer
  end
end
