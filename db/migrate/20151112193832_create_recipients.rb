class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :emailer
      t.string :emailseries
      t.string :emailprogress
      t.string :lastactivitydate

      t.timestamps null: false
    end
  end
end
