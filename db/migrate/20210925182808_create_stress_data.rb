class CreateStressData < ActiveRecord::Migration[6.0]
  def change
    create_table :stress_data do |t|
      t.references :user, null: false, foreign_key: true
      t.string :uid
      t.json :meta
      t.string :calendar_date

      t.timestamps
    end
  end
end
