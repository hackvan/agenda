class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :phone
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
