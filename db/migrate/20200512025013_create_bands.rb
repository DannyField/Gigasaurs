class CreateBands < ActiveRecord::Migration[6.0]
  def change
    create_table :bands do |t|
      t.string :name
      t.string :profile_picture
      t.text :about
      t.string :website

      t.timestamps
    end
  end
end
