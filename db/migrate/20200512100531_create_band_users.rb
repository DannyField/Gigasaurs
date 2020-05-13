class CreateBandUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :band_users do |t|
      t.references :band, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
