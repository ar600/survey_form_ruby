class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :location
      t.string :language
      t.text :comment

      t.timestamps null: false
    end
  end
end
