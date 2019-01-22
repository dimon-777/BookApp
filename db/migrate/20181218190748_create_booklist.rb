class CreateBooklist < ActiveRecord::Migration[5.2]
  def change
    create_table :booklists, id: false do |t|
      t.belongs_to :user
      t.belongs_to :book
    end

    add_index(:booklists, [:user_id, :book_id], :unique => true)
  end
end
