class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.bigint :number_of_tickets
      t.float :total_price
      t.references :activity, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
