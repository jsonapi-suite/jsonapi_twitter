class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.belongs_to :friendee, index: true
      t.belongs_to :friender, index: true
      t.timestamps
    end
  end
end
