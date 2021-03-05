class CreateDeacons < ActiveRecord::Migration[5.2]
  def change
    create_table :deacons do |t|
      t.string :name
      t.string :email
      t.string :cellphone
      t.date :beginningterm
      t.date :endterm

      t.timestamps
    end
  end
end
