class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.text :title
      t.string :state
      t.text :description
      t.string :owner

      t.timestamps
    end
  end
end
