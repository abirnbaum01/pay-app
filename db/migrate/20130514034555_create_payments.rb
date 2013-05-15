class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :email
      t.string :description
      t.decimal :amount
      t.string :frequency
      t.string :paid

      t.timestamps
    end
  end
end
