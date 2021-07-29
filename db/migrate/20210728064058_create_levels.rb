class CreateLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :levels do |t|
      t.integer      :level, null: false
      t.references   :user,  null: false

      t.timestamps
    end
  end
end
