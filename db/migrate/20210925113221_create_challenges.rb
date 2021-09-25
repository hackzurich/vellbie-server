class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.references :goal, null: false, foreign_key: true
      t.integer :level
      t.references :activity

      t.timestamps
    end
  end
end
