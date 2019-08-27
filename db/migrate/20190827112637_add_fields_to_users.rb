class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :ice_chat, :string
    add_column :users, :company_name, :string
    add_column :users, :type_of_company, :string
    add_column :users, :country, :string
    add_column :users, :phone_number, :string
    add_column :users, :city, :string
    add_column :users, :notification_email, :boolean
    add_column :users, :notification_sms, :boolean
  end
end
