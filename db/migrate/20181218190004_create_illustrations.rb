class CreateIllustrations < ActiveRecord::Migration[5.2]
  def change
    create_table :illustrations do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :book, foreign_key: true
      t.boolean :approved

      t.timestamps
    end
  end
end


