class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.belongs_to :sender, index: true
      t.belongs_to :receiver, index: true
      t.text :content
      t.timestamps
    end
  end
end
