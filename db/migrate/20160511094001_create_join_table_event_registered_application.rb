class CreateJoinTableEventRegisteredApplication < ActiveRecord::Migration
  def change
    create_table :events_registered_applications, id: false do |t|
      t.integer :event_id
      t.integer :registered_application_id
    end
  end
end
