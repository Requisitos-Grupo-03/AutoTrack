class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :registration
      t.string :office
      t.string :email

      t.timestamps
    end
  end
end
