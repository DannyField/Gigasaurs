class CreateGigs < ActiveRecord::Migration[6.0]
  def change
    create_table :gigs do |t|
      t.string :title
      t.string :venue
      t.string :location
      t.date :date
      t.time :start_time
      t.time :end_time
      t.text :gig_details
      t.string :support
      t.integer :tickets_available
      t.integer :cost
      t.string :picture_upload

      t.timestamps
    end
  end
end
