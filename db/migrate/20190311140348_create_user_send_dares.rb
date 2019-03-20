class CreateUserSendDares < ActiveRecord::Migration[5.2]
  def change
    create_table :user_send_dares do |t|
      t.belongs_to :dare, index: true
      t.belongs_to :sender, index: true
      t.belongs_to :recipient, index: true
      t.boolean :accepted
      t.timestamps
    end
  end
end
