class CreateUserAccomplishments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_accomplishments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :accomplishment, index: true
      t.timestamps
    end
  end
end
