class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.references :user, index: true
      t.string :title, null: false
      t.text :content

      t.timestamps
    end
  end
end
