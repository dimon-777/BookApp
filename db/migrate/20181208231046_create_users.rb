class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :email, uniqueness: true, null: false
      t.string :user_type
      t.string :password_digest

      t.timestamps
    end
  end
end
