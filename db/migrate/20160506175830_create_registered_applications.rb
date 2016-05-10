class CreateRegisteredApplications < ActiveRecord::Migration
  def change
    create_table :registered_applications do |t|
      t.references :user, foreign_key: true, null: false, default: ""
      t.string :name, null: false, default: ""
      t.string :url, null: false, default: ""

      t.timestamps null: false
    end
    add_index :registered_applications, :url, unique: true
    add_index :registered_applications, :user_id
  end
end
