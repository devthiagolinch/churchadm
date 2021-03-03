class CreateChurchmembers < ActiveRecord::Migration[5.2]
  def change
    create_table :churchmembers do |t|
      t.string :name
      t.string :email
      t.integer :cellphone
      t.date :birthdate
      t.date :membershipdate
      t.string :street
      t.string :district

      t.timestamps
    end
  end
end
