class AddPayMethodAndPayDescAndEmailInstructionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pay_method, :string
    add_column :users, :pay_desc, :text
    add_column :users, :email_instructions, :text
  end
end
