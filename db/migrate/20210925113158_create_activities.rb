# frozen_string_literal: true

class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
