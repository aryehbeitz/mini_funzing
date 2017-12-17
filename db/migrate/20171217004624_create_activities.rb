class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.text :title
      t.string :description
      t.bigint :maximum_attendees
      t.bigint :available_tickets
      t.float :ticket_price
      t.datetime :date
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
