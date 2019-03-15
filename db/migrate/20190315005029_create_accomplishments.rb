class CreateAccomplishments < ActiveRecord::Migration[5.2]
  def change
    create_table :accomplishments do |t|
      t.string :name
      t.string :title
      t.string :icon_class

      t.timestamps
    end
  end
end
