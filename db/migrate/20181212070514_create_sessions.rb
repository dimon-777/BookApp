class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.string :email, uniqueness: true, null: false
      t.string :password_digest


      t.timestamps
    end
  end
end
