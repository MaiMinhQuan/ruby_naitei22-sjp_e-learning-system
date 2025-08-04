class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.text :content, null: false
      t.text :meaning, null: false
      t.integer :type, null: false, default: 0

      t.timestamps
    end
  end
end
