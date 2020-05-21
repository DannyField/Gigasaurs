class CreateCartGigs < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_gigs do |t|
      t.references :gig, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
