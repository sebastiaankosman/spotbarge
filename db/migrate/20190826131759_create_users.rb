class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :ice_chat
      t.string :company_name
      t.string :type_of_company
      t.string :country
      t.string :phone_number
      t.string :city
      t.boolean :notification_email
      t.boolean :notification_sms

      t.timestamps
    end
  end
end
