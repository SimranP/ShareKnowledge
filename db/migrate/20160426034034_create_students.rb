class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.text :name
      t.text :address
      t.text :gender
      t.text :guardian
      t.integer :contact
      t.text  :interest
      t.date  :dob
      t.attachment :picture
      t.timestamps null: false
    end
  end
end
