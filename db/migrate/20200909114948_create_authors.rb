class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.date :birth_data
      t.string :nationality

      t.timestamps
    end
  end
end
