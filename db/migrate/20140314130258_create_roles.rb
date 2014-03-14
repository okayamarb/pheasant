class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.string :code
      t.text :memo

      t.timestamps
    end
    add_index :roles, :code, unique: true
  end
end
