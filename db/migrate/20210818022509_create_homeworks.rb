class CreateHomeworks < ActiveRecord::Migration[5.1]
  def change
    create_table :homeworks do |t|
      t.string :title
      t.text :text
      t.string :author

      t.timestamps
    end
  end
end
